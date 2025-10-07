#tag Module
Protected Module EmailHelper
	#tag Method, Flags = &h0
		Function GenerateOTP() As String
		  ' Generate 6-digit random OTP
		  Dim crypto As New Crypto
		  Var randomBytes() As Byte = crypto.GenerateRandomBytes(4)
		  
		  Var number As Integer = Abs(randomBytes(0) * 16777216 + randomBytes(1) * 65536 + randomBytes(2) * 256 + randomBytes(3))
		  Var otp As String = Format(number Mod 1000000, "000000")
		  
		  Return otp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GeneratePasswordResetEmailHTML(userName As String, otp As String, resetLink As String) As String
		  Var html As String = "<!DOCTYPE html>" + EndOfLine
		  html = html + "<html>" + EndOfLine
		  html = html + "<head>" + EndOfLine
		  html = html + "<meta charset='UTF-8'>" + EndOfLine
		  html = html + "<style>" + EndOfLine
		  html = html + "body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px; }" + EndOfLine
		  html = html + ".container { background: #f9f9f9; border-radius: 10px; padding: 30px; }" + EndOfLine
		  html = html + ".header { background: #2c3e50; color: white; padding: 20px; border-radius: 10px 10px 0 0; text-align: center; }" + EndOfLine
		  html = html + ".content { background: white; padding: 30px; border-radius: 0 0 10px 10px; }" + EndOfLine
		  html = html + ".otp-box { background: #3498db; color: white; font-size: 32px; font-weight: bold; padding: 20px; text-align: center; border-radius: 5px; margin: 20px 0; letter-spacing: 8px; }" + EndOfLine
		  html = html + ".warning { background: #fff3cd; border-left: 4px solid #ffc107; padding: 15px; margin: 20px 0; }" + EndOfLine
		  html = html + ".footer { text-align: center; color: #666; font-size: 12px; margin-top: 30px; }" + EndOfLine
		  html = html + "</style>" + EndOfLine
		  html = html + "</head>" + EndOfLine
		  html = html + "<body>" + EndOfLine
		  html = html + "<div class='container'>" + EndOfLine
		  html = html + "<div class='header'>" + EndOfLine
		  html = html + "<h1>ECHOScore</h1>" + EndOfLine
		  html = html + "<p>Password Reset Request</p>" + EndOfLine
		  html = html + "</div>" + EndOfLine
		  html = html + "<div class='content'>" + EndOfLine
		  html = html + "<p>Hello <strong>" + userName + "</strong>,</p>" + EndOfLine
		  html = html + "<p>You have requested to reset your ECHOScore password. Use the one-time password (OTP) below to proceed:</p>" + EndOfLine
		  html = html + "<div class='otp-box'>" + otp + "</div>" + EndOfLine
		  html = html + "<p style='text-align: center;'><strong>This OTP will expire in 30 minutes.</strong></p>" + EndOfLine
		  html = html + "<div class='warning'>" + EndOfLine
		  html = html + "<strong>⚠️ Security Notice:</strong> If you didn't request this password reset, please ignore this email and ensure your account is secure." + EndOfLine
		  html = html + "</div>" + EndOfLine
		  html = html + "<p>After entering your OTP, you'll be able to create a new password.</p>" + EndOfLine
		  html = html + "<p>Best regards,<br>The ECHOScore Team</p>" + EndOfLine
		  html = html + "</div>" + EndOfLine
		  html = html + "<div class='footer'>" + EndOfLine
		  html = html + "<p>This is an automated message. Please do not reply to this email.</p>" + EndOfLine
		  html = html + "</div>" + EndOfLine
		  html = html + "</div>" + EndOfLine
		  html = html + "</body>" + EndOfLine
		  html = html + "</html>"
		  
		  Return html
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateSecureToken() As String
		  ' Generate secure random token for URL
		  Dim crypto As New Crypto
		  Var randomBytes() As Byte = crypto.GenerateRandomBytes(32)
		  
		  ' Convert to hex string
		  Var token As String = EncodeHex(randomBytes)
		  
		  Return token
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPasswordResetEmail(toEmail As String, toName As String, otp As String, resetLink As String) As Boolean
		  ' Get email configuration from database
		  Var configSQL As String = "SELECT * FROM email_config LIMIT 1"
		  
		  Try
		    Var rs As RowSet = Session.DB.SQLSelect(configSQL)
		    
		    If rs = Nil Or rs.AfterLastRow Then
		      System.DebugLog("Email configuration not found")
		      Return False
		    End If
		    
		    Var smtpServer As String = rs.Column("smtp_server").StringValue
		    Var smtpPort As Integer = rs.Column("smtp_port").IntegerValue
		    Var smtpUsername As String = rs.Column("smtp_username").StringValue
		    Var smtpPassword As String = rs.Column("smtp_password").StringValue
		    Var fromEmail As String = rs.Column("from_email").StringValue
		    Var fromName As String = rs.Column("from_name").StringValue
		    Var useTLS As Boolean = rs.Column("use_tls").BooleanValue
		    
		    ' Create email message
		    Var mail As New EmailMessage
		    mail.FromAddress = fromEmail
		    mail.Subject = "ECHOScore - Password Reset Request"
		    
		    ' Add recipient
		    mail.AddRecipient(toEmail)
		    
		    ' Create HTML body
		    Var htmlBody As String = GeneratePasswordResetEmailHTML(toName, otp, resetLink)
		    mail.BodyHTML = htmlBody
		    
		    ' Create plain text version
		    Var textBody As String = "Hello " + toName + "," + EndOfLine + EndOfLine
		    textBody = textBody + "You have requested to reset your ECHOScore password." + EndOfLine + EndOfLine
		    textBody = textBody + "Your one-time password (OTP) is: " + otp + EndOfLine + EndOfLine
		    textBody = textBody + "This OTP will expire in 30 minutes." + EndOfLine + EndOfLine
		    textBody = textBody + "If you didn't request this, please ignore this email." + EndOfLine + EndOfLine
		    textBody = textBody + "Best regards," + EndOfLine
		    textBody = textBody + "ECHOScore Team"
		    mail.BodyPlainText = textBody
		    
		    ' Configure SMTP socket
		    Var socket As New SMTPSecureSocket
		    socket.Address = smtpServer
		    socket.Port = smtpPort
		    socket.Username = smtpUsername
		    socket.Password = smtpPassword
		    socket.ConnectionType = If(useTLS, SMTPSecureSocket.TLSv12, SMTPSecureSocket.None)
		    
		    ' Send email
		    socket.Messages.Add(mail)
		    socket.Send
		    
		    ' Wait for send completion (with timeout)
		    Var timeout As Integer = 30 ' seconds
		    Var elapsed As Integer = 0
		    While socket.Messages.Count > 0 And elapsed < timeout
		      App.DoEvents(100) ' Wait 100ms
		      elapsed = elapsed + 1
		    Wend
		    
		    If socket.Messages.Count = 0 Then
		      System.DebugLog("Password reset email sent successfully to: " + toEmail)
		      Return True
		    Else
		      System.DebugLog("Failed to send password reset email to: " + toEmail)
		      Return False
		    End If
		    
		  Catch e As RuntimeException
		    System.DebugLog("Error sending email: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod


End Module
#tag EndModule
