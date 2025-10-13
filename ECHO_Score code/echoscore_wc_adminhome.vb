-- =============================================================================
-- wc_AdminHome WebContainer
-- Admin dashboard with navigation to management screens
-- =============================================================================

' Insert → WebContainer
' Name: wc_AdminHome
' Super: wc_Base

' Controls:
' Label: lblWelcome (Bold, Large)
' PushButton: btnManageUsers (text: "Manage Users")
' PushButton: btnManageCases (text: "Manage Cases")
' PushButton: btnEmailConfig (text: "Email Configuration")
' PushButton: btnLogout (text: "Logout")

' wc_AdminHome.Opening Event
Sub Opening()
  lblWelcome.Text = "Admin Dashboard - Welcome, " + Session.CurrentUserName
End Sub

' btnManageUsers.Pressed Event
Sub Pressed()
  Var userAdmin As New wc_UserAdmin
  userAdmin.ContainerID = "UserAdmin"
  userAdmin.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(userAdmin)
End Sub

' btnManageCases.Pressed Event - UPDATED FOR NEW WORKFLOW
Sub Pressed()
  Var caseList As New wc_CaseList
  caseList.ContainerID = "CaseList"
  caseList.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(caseList)
End Sub

' btnEmailConfig.Pressed Event
Sub Pressed()
  Var emailConfig As New wc_EmailConfig
  emailConfig.ContainerID = "EmailConfig"
  emailConfig.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(emailConfig)
End Sub

' btnLogout.Pressed Event
Sub Pressed()
  Session.CurrentUserID = 0
  Session.CurrentUserName = ""
  Session.IsAdmin = False
  
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub

' =============================================================================
' Notes:
' * Simple navigation hub for admin functions
' * Navigates to wc_CaseList (not wc_CaseAdmin) for two-screen workflow
' * All admin screens use TopLeft positioning for full-screen layout
' =============================================================================