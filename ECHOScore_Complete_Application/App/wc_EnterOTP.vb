' =============================================================================
' wc_EnterOTP WebContainer
' =============================================================================

' Insert → WebContainer
' Name: wc_EnterOTP
' Super: wc_Base

' Properties:
Public UserID As Integer
Public Email As String

' Controls:
' Label: lblTitle (text: "Enter Code", Bold, Large)
' Label: lblInstructions (text: "Enter the 6-digit code sent to your email")
' Label: lblOTP (text: "Code:")
' TextField: txtOTP (MaxLength = 6)
' PushButton: btnVerify (text: "Verify Code", Primary style)
' WebLink: lnkResend (text: "Resend Code")
' WebLink: lnkBackToLogin (text: "Back to Login")

' wc_EnterOTP.Opening Event
Sub Opening()
  ContainerID = "EnterOTP"
  txtOTP.SetFocus
End Sub

' btnVerify.Pressed Event
Sub Pressed()
  If txtOTP.Text.Trim = "" Or txtOTP.Text.Trim.Length <> 6 Then
    MessageBox("Please enter the 6-digit code")
    Return
  End If
  
  ' Validate OTP
  Var result As Dictionary = PasswordResetHelper.ValidateOTP(UserID, txtOTP.Text.Trim)
  
  If result.Value("success") Then
    Var token As String = result.Value("token")
    
    ' Navigate to new password screen
    Var newPassword As New wc_NewPassword
    newPassword.ContainerID = "NewPassword"
    newPassword.Token = token
    Session.Navigation.NavigateTo(newPassword)
  Else
    MessageBox("Invalid or expired code. Please try again.")
    txtOTP.Text = ""
    txtOTP.SetFocus
  End If
End Sub

' lnkResend.Pressed Event
Sub Pressed()
  ' Create new password reset request
  Var resetInfo As Dictionary = PasswordResetHelper.CreatePasswordResetRequest(UserID, Request.RemoteAddress)
  
  If Not resetInfo.Value("success") Then
    MessageBox("Error creating password reset request. Please try again.")
    Return
  End If
  
  Var otp As String = resetInfo.Value("otp")
  
  ' Get user name for email
  Var userInfo As Dictionary = PasswordResetHelper.GetUserByEmail(Email)
  Var userName As String = userInfo.Value("full_name")
  
  ' Send new email with OTP
  If EmailHelper.SendPasswordResetEmail(Email, userName, otp) Then
    MessageBox("A new code has been sent to your email")
    txtOTP.Text = ""
    txtOTP.SetFocus
  Else
    MessageBox("Error sending email. Please try again.")
  End If
End Sub

' lnkBackToLogin.Pressed Event
Sub Pressed()
  Var login As New wc_Login
  login.ContainerID = "Login"
  Session.Navigation.NavigateTo(login)
End Sub