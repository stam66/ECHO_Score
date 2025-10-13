' Insert → WebContainer
' Name: wc_AdminHome
' Super: wc_Base


' *******************************************************************************
' Controls
' *******************************************************************************
' Label: lblWelcome (Bold, Large)
' PushButton: btnManageUsers (text: "Manage Users")
' PushButton: btnManageCases (text: "Manage Cases")
' PushButton: btnEmailConfig (text: "Email Configuration")
' PushButton: btnLogout (text: "Logout")


' *******************************************************************************
' wc_AdminHome.Opening event
' *******************************************************************************
Sub Opening()
  lblWelcome.Text = "Admin Dashboard - Welcome, " + Session.CurrentUserName
End Sub


' *******************************************************************************
' btnManageUsers.Pressed Event
' *******************************************************************************
Sub Pressed()
  Var userAdmin As New wc_UserAdmin
  userAdmin.ContainerID = "UserAdmin"
  userAdmin.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(userAdmin)
End Sub


' *******************************************************************************
' btnManageCases.Pressed Event
' *******************************************************************************
Sub Pressed()
  Var caseAdmin As New wc_CaseAdmin
  caseAdmin.ContainerID = "CaseAdmin"
  caseAdmin.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(caseAdmin)
End Sub


' *******************************************************************************
' btnEmailConfig.Pressed Event
' *******************************************************************************
Sub Pressed()
  Var emailConfig As New wc_EmailConfig
  emailConfig.ContainerID = "EmailConfig"
  emailConfig.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(emailConfig)
End Sub


' *******************************************************************************
' btnLogout.Pressed Event
' *******************************************************************************
Sub Pressed()
  Session.CurrentUserID = 0
  Session.CurrentUserName = ""
  Session.IsAdmin = False
  
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub