' =============================================================================
' wc_ForgotPassword WebContainer
' =============================================================================

' Insert → WebContainer
' Name: wc_ForgotPassword
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "Reset Password", Bold, Large)
' Label: lblInstructions (text: "Enter your email address and we'll send you a code to reset your password")
' Label: lblEmail (text: "Email Address:")
' TextField: txtEmail
' PushButton: btnSendCode (text: "Send Code", Primary style)
' WebLink: lnkBackToLogin (text: "Back to Login")

' wc_ForgotPassword.Opening Event
Sub Opening()
  ContainerID = "ForgotPassword"
  txtEmail.SetFocus
End Sub

' btnSendCode.Pressed Event
Sub Pressed()
  If txtEmail.Text.Trim = "" Then
    MessageBox("Please enter your email address")
    Return
  End If
  
  ' Get user by email
  Var userInfo As Dictionary = PasswordResetHelper.GetUserByEmail(txtEmail.Text.Trim)
  
  If Not userInfo.Value("success") Then
    MessageBox("Email address not found")
    Return
  End If
  
  Var userID As Integer = userInfo.Value("user_id")
  Var userName As String = userInfo.Value("full_name")
  
  ' Create password reset request
  Var resetInfo As Dictionary = PasswordResetHelper.CreatePasswordResetRequest(userID, Request.RemoteAddress)
  
  If Not resetInfo.Value("success") Then
    MessageBox("Error creating password reset request. Please try again.")
    Return
  End If
  
  Var otp As String = resetInfo.Value("otp")
  
  ' Send email with OTP
  If EmailHelper.SendPasswordResetEmail(txtEmail.Text.Trim, userName, otp) Then
    MessageBox("A password reset code has been sent to your email")
    
    ' Navigate to OTP entry screen
    Var enterOTP As New wc_EnterOTP
    enterOTP.ContainerID = "EnterOTP"
    enterOTP.UserID = userID
    enterOTP.Email = txtEmail.Text.Trim
    Session.Navigation.NavigateTo(enterOTP)
  Else
    MessageBox("Error sending email. Please check email configuration.")
  End If
End Sub

' lnkBackToLogin.Pressed Event
Sub Pressed()
  Var login As New wc_Login
  login.ContainerID = "Login"
  Session.Navigation.NavigateTo(login)
End Sub