' =============================================================================
' EmailHelper Module - Complete Updated Version
' Handles email sending via SMTP with configuration from database
' =============================================================================

' Insert → Module
' Name: EmailHelper

' LoadEmailConfig Method - Load SMTP settings from database
Function LoadEmailConfig() As Dictionary
  Var config As New Dictionary
  
  Try
    Var sql As String = "SELECT * FROM email_config ORDER BY config_id DESC LIMIT 1"
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    If rs <> Nil And Not rs.AfterLastRow Then
      config.Value("smtp_server") = rs.Column("smtp_server").StringValue
      config.Value("smtp_port") = rs.Column("smtp_port").IntegerValue
      config.Value("smtp_username") = rs.Column("smtp_username").StringValue
      config.Value("smtp_password") = rs.Column("smtp_password").StringValue
      config.Value("from_email") = rs.Column("from_email").StringValue
      config.Value("from_name") = rs.Column("from_name").StringValue
      config.Value("use_tls") = rs.Column("use_tls").BooleanValue
    End If
  Catch e As DatabaseException
    System.DebugLog("Error loading email config: " + e.Message)
  End Try
  
  Return config
End Function

' SendEmail Method - Send email using SMTP
Function SendEmail(toEmail As String, toName As String, subject As String, body As String) As Boolean
  Var config As Dictionary = LoadEmailConfig()
  
  If config.KeyCount = 0 Then
    System.DebugLog("Email configuration not found")
    Return False
  End If
  
  Try
    ' Create email message
    Var email As New EmailMessage
    email.FromAddress = config.Value("from_email")
    email.FromName = config.Value("from_name")
    email.Subject = subject
    email.BodyPlainText = body
    email.AddRecipient(toEmail, toName)
    
    ' Create SMTP socket
    Var smtp As New SMTPSecureSocket
    smtp.Address = config.Value("smtp_server")
    smtp.Port = config.Value("smtp_port")
    smtp.Username = config.Value("smtp_username")
    smtp.Password = config.Value("smtp_password")
    smtp.Secure = config.Value("use_tls")
    
    ' Set connection timeout
    smtp.ConnectionTimeout = 30
    
    ' Send email
    smtp.Send(email)
    
    System.DebugLog("Email sent successfully to: " + toEmail)
    Return True
    
  Catch e As RuntimeException
    System.DebugLog("Error sending email: " + e.Message)
    Return False
  End Try
End Function

' SendPasswordResetEmail Method - Send OTP email for password reset
Function SendPasswordResetEmail(toEmail As String, toName As String, otp As String) As Boolean
  Var subject As String = "ECHOScore Password Reset"
  
  Var body As String = "Hello " + toName + "," + EndOfLine + EndOfLine
  body = body + "You have requested to reset your ECHOScore password." + EndOfLine + EndOfLine
  body = body + "Your One-Time Password (OTP) is: " + otp + EndOfLine + EndOfLine
  body = body + "This OTP will expire in 15 minutes." + EndOfLine + EndOfLine
  body = body + "If you did not request this password reset, please ignore this email." + EndOfLine + EndOfLine
  body = body + "Best regards," + EndOfLine
  body = body + "ECHOScore Team"
  
  Return SendEmail(toEmail, toName, subject, body)
End Function

' TestEmailConfiguration Method - Test email settings
Function TestEmailConfiguration(testEmail As String) As Boolean
  Var subject As String = "ECHOScore Email Configuration Test"
  Var body As String = "This is a test email from ECHOScore to verify your email configuration is working correctly."
  
  Return SendEmail(testEmail, "Test Recipient", subject, body)
End Function

' =============================================================================
' EmailHelper Module Change Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. DATABASE-DRIVEN CONFIGURATION:
'    - LoadEmailConfig() reads from email_config table
'    - No hardcoded email settings in code
'    - Admin can update settings via wc_EmailConfig
' 
' 2. SMTP SENDING:
'    - Uses SMTPSecureSocket for secure connections
'    - Supports TLS/SSL encryption
'    - Configurable port (587 for STARTTLS, 465 for SSL)
'    - 30-second connection timeout
' 
' 3. PASSWORD RESET EMAILS:
'    - SendPasswordResetEmail() formats OTP message
'    - Clear instructions for users
'    - 15-minute expiration notice
' 
' 4. TESTING:
'    - TestEmailConfiguration() for verifying setup
'    - Returns Boolean success/failure
'    - Debug logging for troubleshooting
' 
' 5. ERROR HANDLING:
'    - Try/Catch blocks for all operations
'    - Debug logging for errors
'    - Returns Boolean for success/failure
' 
' =============================================================================
' Usage Examples:
' =============================================================================
' 
' SEND PASSWORD RESET EMAIL:
'   Var success As Boolean = EmailHelper.SendPasswordResetEmail("user@example.com", "John Doe", "123456")
'   If success Then
'     MessageBox("Password reset email sent successfully")
'   Else
'     MessageBox("Failed to send email. Please check email configuration.")
'   End If
' 
' SEND CUSTOM EMAIL:
'   Var success As Boolean = EmailHelper.SendEmail("user@example.com", "John Doe", "Welcome", "Welcome to ECHOScore!")
' 
' TEST EMAIL CONFIGURATION:
'   Var success As Boolean = EmailHelper.TestEmailConfiguration("admin@example.com")
'   If success Then
'     MessageBox("Email configuration is working correctly")
'   Else
'     MessageBox("Email configuration test failed")
'   End If
' 
' =============================================================================
' Email Configuration Requirements:
' =============================================================================
' 
' Gmail Example:
'   Server: smtp.gmail.com
'   Port: 587 (TLS) or 465 (SSL)
'   Username: your-email@gmail.com
'   Password: App-specific password (not regular password)
'   Use TLS: True
' 
' Office 365 Example:
'   Server: smtp.office365.com
'   Port: 587
'   Username: your-email@company.com
'   Password: Your password
'   Use TLS: True
' 
' Custom SMTP:
'   Server: Your SMTP server address
'   Port: Usually 587 (TLS) or 465 (SSL)
'   Username: Your SMTP username
'   Password: Your SMTP password
'   Use TLS: True (recommended)
' 
' =============================================================================
' Notes:
' =============================================================================
' 
' 1. Gmail requires app-specific passwords (not regular account password)
' 2. Some SMTP servers require "Allow less secure apps" to be enabled
' 3. Port 587 uses STARTTLS, port 465 uses SSL/TLS
' 4. Connection timeout is set to 30 seconds
' 5. Debug logging helps troubleshoot email issues
' 6. Email body uses EndOfLine for proper line breaks
' 
' =============================================================================
