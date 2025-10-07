' Insert → WebContainer
' Name: wc_NewPassword
' Super: wc_Base

' *******************************************************************************
' Properties
' *******************************************************************************
Public UserID As Integer = 0
Public TokenID As Integer = 0


' *******************************************************************************
' Controls
' *******************************************************************************
' Label: lblTitle (text: "Create New Password", Bold)
' Label: lblInstructions
' Label: lblPasswordRequirements
' Label: lblNewPassword (text: "New Password:")
' TextField: txtNewPassword (PasswordField = True)
' Label: lblConfirmPassword (text: "Confirm Password:")
' TextField: txtConfirmPassword (PasswordField = True)
' PushButton: btnSetPassword (text: "Set Password")
' PushButton: btnCancel (text: "Cancel")
' Label: lblMessage (text: "", Visible = False)


' *******************************************************************************
' wc_NewPassword.Opening event
' *******************************************************************************
Sub Opening()
  lblInstructions.Text = "Please create a strong password for your account"
  lblPasswordRequirements.Text = "Password must be at least 8 characters long and contain:" + EndOfLine + _
  "• At least one uppercase letter" + EndOfLine + _
  "• At least one lowercase letter" + EndOfLine + _
  "• At least one number"
  
  lblMessage.Text = ""
  lblMessage.Visible = False
  txtNewPassword.SetFocus
End Sub


' *******************************************************************************
' Methods
' *******************************************************************************
Sub ShowMessage(msg As String, isSuccess As Boolean)
  lblMessage.Text = msg
  lblMessage.TextColor = If(isSuccess, &c27ae60, &ce74c3c)
  lblMessage.Visible = True
End Sub

Function ValidatePassword(password As String) As Boolean
  If password.Length < 8 Then Return False
  
  Var hasUpper As Boolean = False
  Var hasLower As Boolean = False
  Var hasNumber As Boolean = False
  
  For i As Integer = 0 To password.Length - 1
    Var c As String = password.Middle(i, 1)
    
    If c >= "A" And c <= "Z" Then
      hasUpper = True
    ElseIf c >= "a" And c <= "z" Then
      hasLower = True
    ElseIf c >= "0" And c <= "9" Then
      hasNumber = True
    End If
  Next
  
  Return hasUpper And hasLower And hasNumber
End Function

Sub NavigateToLogin(t As Timer)
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub


' *******************************************************************************
' btnSetPassword.Pressed Event
' *******************************************************************************
Sub Pressed()
  If txtNewPassword.Text.Trim = "" Or txtConfirmPassword.Text.Trim = "" Then
    ShowMessage("Please fill in both password fields", False)
    Return
  End If
  
  If txtNewPassword.Text <> txtConfirmPassword.Text Then
    ShowMessage("Passwords do not match", False)
    Return
  End If
  
  If Not ValidatePassword(txtNewPassword.Text) Then
    ShowMessage("Password does not meet requirements", False)
    Return
  End If
  
  If PasswordResetHelper.ResetPassword(TokenID, UserID, txtNewPassword.Text) Then
    ShowMessage("Password reset successfully! Redirecting to login...", True)
    
    Var t As New Timer
    t.Period = 2000
    t.Mode = Timer.ModeOff
    AddHandler t.Action, AddressOf NavigateToLogin
    t.RunMode = Timer.RunModes.Single
    t.Enabled = True
    
  Else
    ShowMessage("Failed to reset password. Please try again.", False)
  End If
End Sub


' *******************************************************************************
' btnCancel.Pressed Event
' *******************************************************************************
Sub Pressed()
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub
