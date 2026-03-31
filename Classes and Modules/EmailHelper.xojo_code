#tag Module
Protected Module EmailHelper
	#tag Method, Flags = &h0
		Function GenerateOTP() As String
		  ' *******************************************************************************
		  ' Add Method: GenerateOTP
		  '   Return Type: String
		  '   Purpose: Generates a secure 6-digit OTP
		  ' *******************************************************************************
		  
		  Var randomData As MemoryBlock = Crypto.GenerateRandomBytes(4)
		  
		  Var number As Integer = Abs(randomData.UInt8Value(0) * 16777216 + randomData.UInt8Value(1) * 65536 + randomData.UInt8Value(2) * 256 + randomData.UInt8Value(3))
		  Var otp As String = Format(number Mod 1000000, "000000")
		  
		  Return otp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GeneratePasswordResetEmailHTML(userName As String, otp As String) As String
		  ' *******************************************************************************
		  ' Add Method: GeneratePasswordResetEmailHTML
		  '   Parameters: userName As String, otp As String
		  '   Return Type: String
		  '   Scope: Private
		  '   Purpose: Creates styled HTML email content
		  ' *******************************************************************************
		  
		  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
		  html = html + "body{font-family:Arial,sans-serif;line-height:1.6;color:#333;max-width:600px;margin:0 auto;padding:20px;}"
		  html = html + ".container{background:#f9f9f9;border-radius:10px;padding:30px;}"
		  html = html + ".header{background:#2c3e50;color:white;padding:20px;border-radius:10px 10px 0 0;text-align:center;}"
		  html = html + ".content{background:white;padding:30px;border-radius:0 0 10px 10px;}"
		  html = html + ".otp-box{background:#3498db;color:white;font-size:32px;font-weight:bold;padding:20px;text-align:center;border-radius:5px;margin:20px 0;letter-spacing:8px;}"
		  html = html + ".warning{background:#fff3cd;border-left:4px solid #ffc107;padding:15px;margin:20px 0;}"
		  html = html + ".footer{text-align:center;color:#666;font-size:12px;margin-top:30px;}"
		  html = html + "</style></head><body><div class='container'><div class='header'>"
		  html = html + "<h1>ECHOScore</h1><p>Password Reset Request</p></div><div class='content'>"
		  html = html + "<p>Hello <strong>" + userName + "</strong>,</p>"
		  html = html + "<p>You have requested to reset your ECHOScore password. Use the one-time password (OTP) below to proceed:</p>"
		  html = html + "<div class='otp-box'>" + otp + "</div>"
		  html = html + "<p style='text-align:center;'><strong>This OTP will expire in 30 minutes.</strong></p>"
		  html = html + "<div class='warning'><strong>⚠️ Security Notice:</strong> If you didn't request this password reset, please ignore this email and ensure your account is secure.</div>"
		  html = html + "<p>After entering your OTP, you'll be able to create a new password.</p>"
		  html = html + "<p>Best regards,<br>The ECHOScore Team</p></div>"
		  html = html + "<div class='footer'><p>This is an automated message. Please do not reply to this email.</p></div>"
		  html = html + "</div></body></html>"
		  
		  Return html
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateSecureToken() As String
		  ' *******************************************************************************
		  ' Add Method: GenerateSecureToken
		  '   Return Type: String
		  '   Purpose: Generates a secure 64-character token
		  ' *******************************************************************************
		  Var randomData As MemoryBlock = Crypto.GenerateRandomBytes(32)
		  
		  Var token As String = ""
		  For i As Integer = 0 To randomData.Size - 1
		    token = token + randomData.UInt8Value(i).ToHex(2)
		  Next
		  
		  Return token
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendAccessRequestNotification(toEmail as String, toName as String, applicantName as String, applicantEmail as String, db as MySQLCommunityServer) As Boolean
		  ' *******************************************************************************
		  ' Add Method: SendAccessRequestNotification
		  '   Parameters: toEmail (admin), toName (admin), applicantName, applicantEmail
		  '   Return Type: Boolean
		  '   Purpose: Notifies admins when a new access request is submitted
		  ' *******************************************************************************
		  
		  ' Load email configuration from database
		  Var configSQL As String = "SELECT * FROM email_config LIMIT 1"
		  
		  Try
		    Var rs As RowSet = db.SelectSQL(configSQL)
		    
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
		    
		    System.DebugLog("Sending access request notification to: " + toEmail)
		    
		    ' Create email message
		    Var mail As New EmailMessage
		    mail.FromAddress = If(fromName <> "", fromName + " <" + fromEmail + ">", fromEmail)
		    mail.Subject = "ECHOScore - New Access Request"
		    mail.AddRecipient(toEmail)
		    
		    ' Generate HTML body
		    Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
		    html = html + "body{font-family:Arial,sans-serif;line-height:1.6;color:#333;max-width:600px;margin:0 auto;padding:20px;}"
		    html = html + ".container{background:#f9f9f9;border-radius:10px;padding:30px;}"
		    html = html + ".header{background:#2c3e50;color:white;padding:20px;border-radius:10px 10px 0 0;text-align:center;}"
		    html = html + ".content{background:white;padding:30px;border-radius:0 0 10px 10px;}"
		    html = html + ".info-box{background:#e8f4f8;border-left:4px solid #3498db;padding:15px;margin:20px 0;}"
		    html = html + ".info-row{margin:10px 0;}"
		    html = html + ".label{font-weight:bold;color:#2c3e50;}"
		    html = html + ".button{display:inline-block;background:#3498db;color:white;padding:12px 30px;text-decoration:none;border-radius:5px;margin-top:20px;}"
		    html = html + ".footer{text-align:center;color:#666;font-size:12px;margin-top:30px;}"
		    html = html + "</style></head><body><div class='container'><div class='header'>"
		    html = html + "<h1>ECHOScore</h1><p>New Access Request</p></div><div class='content'>"
		    html = html + "<p>Hello <strong>" + toName + "</strong>,</p>"
		    html = html + "<p>A new user has requested access to ECHOScore:</p>"
		    html = html + "<div class='info-box'>"
		    html = html + "<div class='info-row'><span class='label'>Name:</span> " + applicantName + "</div>"
		    html = html + "<div class='info-row'><span class='label'>Email:</span> " + applicantEmail + "</div>"
		    html = html + "<div class='info-row'><span class='label'>Requested:</span> " + DateTime.Now.ToString + "</div>"
		    html = html + "</div>"
		    html = html + "<p>Please review this request in the admin panel and approve or reject it.</p>"
		    html = html + "<p>Best regards,<br>The ECHOScore System</p></div>"
		    html = html + "<div class='footer'><p>This is an automated notification. Please do not reply to this email.</p></div>"
		    html = html + "</div></body></html>"
		    
		    mail.BodyHTML = html
		    
		    ' Generate plain text body
		    Var textBody As String = "Hello " + toName + "," + EndOfLine + EndOfLine
		    textBody = textBody + "A new user has requested access to ECHOScore:" + EndOfLine + EndOfLine
		    textBody = textBody + "Name: " + applicantName + EndOfLine
		    textBody = textBody + "Email: " + applicantEmail + EndOfLine
		    textBody = textBody + "Requested: " + DateTime.Now.ToString + EndOfLine + EndOfLine
		    textBody = textBody + "Please review this request in the admin panel." + EndOfLine + EndOfLine
		    textBody = textBody + "Best regards," + EndOfLine
		    textBody = textBody + "ECHOScore System"
		    mail.BodyPlainText = textBody
		    
		    ' Configure SMTP socket
		    ' Note: SMTPSecureSocket always uses TLS. If use_tls=false is required,
		    ' replace with SMTPSocket (plain) and update this block accordingly.
		    If Not useTLS Then
		      System.DebugLog("Warning: use_tls=false is set but SMTPSecureSocket always uses TLS. Update socket class if plain SMTP is needed.")
		    End If
		    Var socket As New SMTPSecureSocket
		    socket.Address = smtpServer
		    socket.Port = smtpPort
		    socket.Username = smtpUsername
		    socket.Password = smtpPassword

		    ' Send email
		    socket.Messages.Add(mail)
		    socket.SendMail

		    ' Wait for send completion (max 30 seconds: 300 × 100ms)
		    Var timeout As Integer = 300
		    Var elapsed As Integer = 0
		    While socket.Messages.Count > 0 And elapsed < timeout
		      App.DoEvents(100)
		      elapsed = elapsed + 1
		    Wend

		    If socket.Messages.Count = 0 Then
		      System.DebugLog("Access request notification sent to: " + toEmail)
		      Return True
		    Else
		      System.DebugLog("Failed to send notification to: " + toEmail)
		      Return False
		    End If
		    
		  Catch e As RuntimeException
		    System.DebugLog("Error sending notification email: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendPasswordResetEmail(toEmail As String, toName As String, otp As String, resetLink As String) As Boolean
		  ' *******************************************************************************
		  ' Add Method: SendPasswordResetEmail
		  '   Parameters: toEmail As String, toName As String, otp As String, resetLink As String
		  '   Return Type: Boolean
		  ' *******************************************************************************
		  
		  #Pragma Unused resetLink
		  
		  ' Load email configuration from database
		  Var configSQL As String = "SELECT * FROM email_config LIMIT 1"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(configSQL)
		    
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
		    
		    System.DebugLog("SMTP Config - Server: " + smtpServer + ", Port: " + Str(smtpPort) + ", Username: " + smtpUsername + ", TLS: " + If(useTLS, "Yes", "No"))
		    
		    ' Create email message
		    Var mail As New EmailMessage
		    mail.FromAddress = If(fromName <> "", fromName + " <" + fromEmail + ">", fromEmail)
		    mail.Subject = "ECHOScore - Password Reset Request"
		    mail.AddRecipient(toEmail)
		    
		    ' Generate HTML body
		    Var htmlBody As String = GeneratePasswordResetEmailHTML(toName, otp)
		    mail.BodyHTML = htmlBody
		    
		    ' Generate plain text body
		    Var textBody As String = "Hello " + toName + "," + EndOfLine + EndOfLine
		    textBody = textBody + "You have requested to reset your ECHOScore password." + EndOfLine + EndOfLine
		    textBody = textBody + "Your one-time password (OTP) is: " + otp + EndOfLine + EndOfLine
		    textBody = textBody + "This OTP will expire in 30 minutes." + EndOfLine + EndOfLine
		    textBody = textBody + "If you didn't request this, please ignore this email." + EndOfLine + EndOfLine
		    textBody = textBody + "Best regards," + EndOfLine
		    textBody = textBody + "ECHOScore Team"
		    mail.BodyPlainText = textBody
		    
		    ' Configure SMTP socket
		    ' Note: SMTPSecureSocket always uses TLS. If use_tls=false is required,
		    ' replace with SMTPSocket (plain) and update this block accordingly.
		    If Not useTLS Then
		      System.DebugLog("Warning: use_tls=false is set but SMTPSecureSocket always uses TLS. Update socket class if plain SMTP is needed.")
		    End If
		    System.DebugLog("Creating SMTP socket...")
		    Var socket As New SMTPSecureSocket
		    socket.Address = smtpServer
		    socket.Port = smtpPort
		    socket.Username = smtpUsername
		    socket.Password = smtpPassword
		    
		    ' Send email
		    System.DebugLog("Adding message and sending...")
		    socket.Messages.Add(mail)
		    socket.SendMail
		    
		    ' Wait for send completion (max 30 seconds: 300 × 100ms)
		    Var timeout As Integer = 300
		    Var elapsed As Integer = 0
		    While socket.Messages.Count > 0 And elapsed < timeout
		      App.DoEvents(100)
		      elapsed = elapsed + 1
		    Wend
		    
		    If socket.Messages.Count = 0 Then
		      System.DebugLog("Password reset email sent successfully to: " + toEmail)
		      Return True
		    Else
		      System.DebugLog("Failed to send password reset email to: " + toEmail + " - Message still in queue")
		      Return False
		    End If
		    
		  Catch e As RuntimeException
		    System.DebugLog("Error sending email: " + e.Message)
		    If e.Stack.Count > 0 Then
		      System.DebugLog("Stack trace: " + String.FromArray(e.Stack, EndOfLine))
		    End If
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendWelcomeEmail(toEmail as String, toName as String, username as String, tempPassword as String) As Boolean
		  ' *******************************************************************************
		  ' Add Method: SendWelcomeEmail
		  '   Parameters: toEmail, toName, username, tempPassword
		  '   Return Type: Boolean
		  '   Purpose: Sends welcome email with login credentials to new users
		  ' *******************************************************************************
		  
		  ' Load email configuration from database
		  Var configSQL As String = "SELECT * FROM email_config LIMIT 1"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(configSQL)
		    
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
		    
		    System.DebugLog("Sending welcome email to: " + toEmail)
		    
		    ' Create email message
		    Var mail As New EmailMessage
		    mail.FromAddress = If(fromName <> "", fromName + " <" + fromEmail + ">", fromEmail)
		    mail.Subject = "Welcome to ECHOScore - Your Account is Ready"
		    mail.AddRecipient(toEmail)
		    
		    ' Generate HTML body
		    Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
		    html = html + "body{font-family:Arial,sans-serif;line-height:1.6;color:#333;max-width:600px;margin:0 auto;padding:20px;}"
		    html = html + ".container{background:#f9f9f9;border-radius:10px;padding:30px;}"
		    html = html + ".header{background:#27ae60;color:white;padding:20px;border-radius:10px 10px 0 0;text-align:center;}"
		    html = html + ".content{background:white;padding:30px;border-radius:0 0 10px 10px;}"
		    html = html + ".credentials-box{background:#e8f8f5;border-left:4px solid #27ae60;padding:20px;margin:20px 0;}"
		    html = html + ".credential-item{margin:15px 0;font-size:16px;}"
		    html = html + ".label{font-weight:bold;color:#2c3e50;display:inline-block;width:120px;}"
		    html = html + ".value{font-family:monospace;background:#fff;padding:8px 12px;border-radius:3px;border:1px solid #ddd;}"
		    html = html + ".warning{background:#fff3cd;border-left:4px solid #ffc107;padding:15px;margin:20px 0;}"
		    html = html + ".footer{text-align:center;color:#666;font-size:12px;margin-top:30px;}"
		    html = html + "</style></head><body><div class='container'><div class='header'>"
		    html = html + "<h1>Welcome to ECHOScore!</h1><p>Your account has been approved</p></div><div class='content'>"
		    html = html + "<p>Hello <strong>" + toName + "</strong>,</p>"
		    html = html + "<p>Great news! Your access request has been approved. You can now log in to ECHOScore using the credentials below:</p>"
		    html = html + "<div class='credentials-box'>"
		    html = html + "<div class='credential-item'><span class='label'>Username:</span> <span class='value'>" + username + "</span></div>"
		    html = html + "<div class='credential-item'><span class='label'>Password:</span> <span class='value'>" + tempPassword + "</span></div>"
		    html = html + "</div>"
		    html = html + "<div class='warning'><strong>🔒 Important Security Notice:</strong><br>"
		    html = html + "This is a temporary password. Please change it immediately after your first login for security reasons.</div>"
		    html = html + "<p>You can access ECHOScore by visiting the login page and entering your credentials.</p>"
		    html = html + "<p>If you have any questions or need assistance, please contact your administrator.</p>"
		    html = html + "<p>Best regards,<br>The ECHOScore Team</p></div>"
		    html = html + "<div class='footer'><p>This is an automated message. Please do not reply to this email.</p></div>"
		    html = html + "</div></body></html>"
		    
		    mail.BodyHTML = html
		    
		    ' Generate plain text body
		    Var textBody As String = "Welcome to ECHOScore!" + EndOfLine + EndOfLine
		    textBody = textBody + "Hello " + toName + "," + EndOfLine + EndOfLine
		    textBody = textBody + "Your access request has been approved. You can now log in using:" + EndOfLine + EndOfLine
		    textBody = textBody + "Username: " + username + EndOfLine
		    textBody = textBody + "Password: " + tempPassword + EndOfLine + EndOfLine
		    textBody = textBody + "IMPORTANT: This is a temporary password. Please change it after your first login." + EndOfLine + EndOfLine
		    textBody = textBody + "Best regards," + EndOfLine
		    textBody = textBody + "ECHOScore Team"
		    mail.BodyPlainText = textBody
		    
		    ' Configure SMTP socket
		    ' Note: SMTPSecureSocket always uses TLS. If use_tls=false is required,
		    ' replace with SMTPSocket (plain) and update this block accordingly.
		    If Not useTLS Then
		      System.DebugLog("Warning: use_tls=false is set but SMTPSecureSocket always uses TLS. Update socket class if plain SMTP is needed.")
		    End If
		    Var socket As New SMTPSecureSocket
		    socket.Address = smtpServer
		    socket.Port = smtpPort
		    socket.Username = smtpUsername
		    socket.Password = smtpPassword

		    ' Send email
		    socket.Messages.Add(mail)
		    socket.SendMail

		    ' Wait for send completion (max 30 seconds: 300 × 100ms)
		    Var timeout As Integer = 300
		    Var elapsed As Integer = 0
		    While socket.Messages.Count > 0 And elapsed < timeout
		      App.DoEvents(100)
		      elapsed = elapsed + 1
		    Wend

		    If socket.Messages.Count = 0 Then
		      System.DebugLog("Welcome email sent to: " + toEmail)
		      Return True
		    Else
		      System.DebugLog("Failed to send welcome email to: " + toEmail)
		      Return False
		    End If
		    
		  Catch e As RuntimeException
		    System.DebugLog("Error sending welcome email: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod


	#tag Method, Flags = &h0
		Function SendNewAccountEmail(toEmail As String, toName As String, username As String, otp As String) As Boolean
		  ' *******************************************************************************
		  ' Add Method: SendNewAccountEmail
		  '   Parameters: toEmail, toName, username, otp
		  '   Return Type: Boolean
		  '   Purpose: Sends welcome email with OTP so new user can set their own password
		  ' *******************************************************************************

		  ' Load email configuration from database
		  Var configSQL As String = "SELECT * FROM email_config LIMIT 1"

		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(configSQL)

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

		    System.DebugLog("Sending new account email to: " + toEmail)

		    ' Create email message
		    Var mail As New EmailMessage
		    mail.FromAddress = If(fromName <> "", fromName + " <" + fromEmail + ">", fromEmail)
		    mail.Subject = "Welcome to ECHOScore - Set Your Password"
		    mail.AddRecipient(toEmail)

		    ' Generate HTML body
		    Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
		    html = html + "body{font-family:Arial,sans-serif;line-height:1.6;color:#333;max-width:600px;margin:0 auto;padding:20px;}"
		    html = html + ".container{background:#f9f9f9;border-radius:10px;padding:30px;}"
		    html = html + ".header{background:#27ae60;color:white;padding:20px;border-radius:10px 10px 0 0;text-align:center;}"
		    html = html + ".content{background:white;padding:30px;border-radius:0 0 10px 10px;}"
		    html = html + ".credentials-box{background:#e8f8f5;border-left:4px solid #27ae60;padding:20px;margin:20px 0;}"
		    html = html + ".credential-item{margin:15px 0;font-size:16px;}"
		    html = html + ".label{font-weight:bold;color:#2c3e50;display:inline-block;width:120px;}"
		    html = html + ".value{font-family:monospace;background:#fff;padding:8px 12px;border-radius:3px;border:1px solid #ddd;}"
		    html = html + ".otp-box{background:#3498db;color:white;font-size:32px;font-weight:bold;padding:20px;text-align:center;border-radius:5px;margin:20px 0;letter-spacing:8px;}"
		    html = html + ".warning{background:#fff3cd;border-left:4px solid #ffc107;padding:15px;margin:20px 0;}"
		    html = html + ".footer{text-align:center;color:#666;font-size:12px;margin-top:30px;}"
		    html = html + "</style></head><body><div class='container'><div class='header'>"
		    html = html + "<h1>Welcome to ECHOScore!</h1><p>Your account has been approved</p></div><div class='content'>"
		    html = html + "<p>Hello <strong>" + toName + "</strong>,</p>"
		    html = html + "<p>Great news! Your access request has been approved. Your username is:</p>"
		    html = html + "<div class='credentials-box'>"
		    html = html + "<div class='credential-item'><span class='label'>Username:</span> <span class='value'>" + username + "</span></div>"
		    html = html + "</div>"
		    html = html + "<p>Use the one-time password (OTP) below to log in and set your password:</p>"
		    html = html + "<div class='otp-box'>" + otp + "</div>"
		    html = html + "<p style='text-align:center;'><strong>This OTP will expire in 30 minutes.</strong></p>"
		    html = html + "<div class='warning'><strong>Note:</strong> This OTP can only be used once. After logging in you will be prompted to set a new password.</div>"
		    html = html + "<p>If you have any questions or need assistance, please contact your administrator.</p>"
		    html = html + "<p>Best regards,<br>The ECHOScore Team</p></div>"
		    html = html + "<div class='footer'><p>This is an automated message. Please do not reply to this email.</p></div>"
		    html = html + "</div></body></html>"

		    mail.BodyHTML = html

		    ' Generate plain text body
		    Var textBody As String = "Welcome to ECHOScore!" + EndOfLine + EndOfLine
		    textBody = textBody + "Hello " + toName + "," + EndOfLine + EndOfLine
		    textBody = textBody + "Your access request has been approved." + EndOfLine + EndOfLine
		    textBody = textBody + "Username: " + username + EndOfLine + EndOfLine
		    textBody = textBody + "Use the following one-time password (OTP) to log in and set your password:" + EndOfLine
		    textBody = textBody + otp + EndOfLine + EndOfLine
		    textBody = textBody + "This OTP will expire in 30 minutes." + EndOfLine + EndOfLine
		    textBody = textBody + "Best regards," + EndOfLine
		    textBody = textBody + "ECHOScore Team"
		    mail.BodyPlainText = textBody

		    ' Configure SMTP socket
		    If Not useTLS Then
		      System.DebugLog("Warning: use_tls=false is set but SMTPSecureSocket always uses TLS. Update socket class if plain SMTP is needed.")
		    End If
		    Var socket As New SMTPSecureSocket
		    socket.Address = smtpServer
		    socket.Port = smtpPort
		    socket.Username = smtpUsername
		    socket.Password = smtpPassword

		    ' Send email
		    socket.Messages.Add(mail)
		    socket.SendMail

		    ' Wait for send completion (max 30 seconds: 300 × 100ms)
		    Var timeout As Integer = 300
		    Var elapsed As Integer = 0
		    While socket.Messages.Count > 0 And elapsed < timeout
		      App.DoEvents(100)
		      elapsed = elapsed + 1
		    Wend

		    If socket.Messages.Count = 0 Then
		      System.DebugLog("New account email sent to: " + toEmail)
		      Return True
		    Else
		      System.DebugLog("Failed to send new account email to: " + toEmail)
		      Return False
		    End If

		  Catch e As RuntimeException
		    System.DebugLog("Error sending new account email: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
