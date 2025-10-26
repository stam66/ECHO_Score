' =============================================================================
' wc_AdminHome WebContainer
' =============================================================================

' Insert → WebContainer
' Name: wc_AdminHome
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "Admin Home", Bold, Large)
' Label: lblWelcome (text: "Welcome, [Admin Name]")
' PushButton: btnManageUsers (text: "Manage Users", Large)
' PushButton: btnManageCases (text: "Manage Cases", Large)
' PushButton: btnEmailConfig (text: "Email Configuration", Large)

' wc_AdminHome.Opening Event
Sub Opening()
  ContainerID = "AdminHome"
  lblWelcome.Text = "Welcome, " + Session.CurrentUsername
End Sub

' btnManageUsers.Pressed Event
Sub Pressed()
  Var userAdmin As New wc_UserAdmin
  userAdmin.ContainerID = "UserAdmin"
  Session.Navigation.NavigateTo(userAdmin)
End Sub

' btnManageCases.Pressed Event
Sub Pressed()
  Var caseList As New wc_CaseList
  caseList.ContainerID = "CaseList"
  Session.Navigation.NavigateTo(caseList)
End Sub

' btnEmailConfig.Pressed Event
Sub Pressed()
  Var emailConfig As New wc_EmailConfig
  emailConfig.ContainerID = "EmailConfig"
  Session.Navigation.NavigateTo(emailConfig)
End Sub