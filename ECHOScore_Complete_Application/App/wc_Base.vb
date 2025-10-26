' =============================================================================
' wc_Base WebContainer - Complete Updated Version
' Base class for all content containers with navigation support
' =============================================================================

' Insert → WebContainer
' Name: wc_Base
' Super: WebContainer

' Properties:
Public ContainerID As String

' wc_Base.Opening Event
Sub Opening()
  ' Override in subclasses if needed
End Sub

' UpdateNavigation Method - Called after navigation to update button states
Sub UpdateNavigation()
  ' Get reference to main page
  Var mainPage As wp_MainShell = wp_MainShell(Session.CurrentPage)
  If mainPage = Nil Then Return
  
  ' Update Back button state
  mainPage.btnBack.Enabled = Session.Navigation.CanGoBack()
  
  ' Update Logout button state (always enabled unless on login page)
  mainPage.btnLogout.Enabled = (ContainerID <> "Login")
  
  ' Hide/show navigation buttons based on container
  Select Case ContainerID
  Case "Login", "ForgotPassword", "EnterOTP", "NewPassword"
    ' Authentication screens - hide both buttons
    mainPage.btnBack.Visible = False
    mainPage.btnLogout.Visible = False
  Case Else
    ' All other screens - show buttons
    mainPage.btnBack.Visible = True
    mainPage.btnLogout.Visible = True
  End Select
  
  System.DebugLog("Navigation updated for: " + ContainerID)
End Sub

' =============================================================================
' wc_Base Change Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. CONTAINERID PROPERTY:
'    - Unique identifier for each container instance
'    - Used by WebNavigationManager for history tracking
'    - Must be set before calling Session.Navigation.NavigateTo()
' 
' 2. UPDATENAVIGATION METHOD:
'    - Called automatically after each navigation
'    - Updates Back button enabled state based on history
'    - Updates Logout button enabled state
'    - Shows/hides navigation buttons based on container type
' 
' 3. BUTTON VISIBILITY LOGIC:
'    - Authentication screens: Hide both Back and Logout
'    - All other screens: Show both buttons
'    - Back button enabled only when history exists
'    - Logout button always enabled (except on Login screen)
' 
' 4. SUBCLASSING:
'    - All content containers inherit from wc_Base
'    - Override Opening() if initialization is needed
'    - ContainerID must be set in each subclass
' 
' =============================================================================
' Usage in Subclasses:
' =============================================================================
' 
' EXAMPLE - wc_UserHome.Opening:
'   Sub Opening()
'     ContainerID = "UserHome"
'     ' Additional initialization code...
'   End Sub
' 
' EXAMPLE - Navigating from one container to another:
'   Var caseReview As New wc_CaseReview
'   caseReview.ContainerID = "CaseReview"
'   caseReview.CaseID = 123
'   Session.Navigation.NavigateTo(caseReview)
' 
' =============================================================================
' Subclass List:
' =============================================================================
' 
' Authentication:
' - wc_Login
' - wc_ForgotPassword
' - wc_EnterOTP
' - wc_NewPassword
' 
' Admin:
' - wc_AdminHome
' - wc_UserAdmin
' - wc_EmailConfig
' - wc_CaseList
' - wc_CaseDetails
' 
' Student:
' - wc_UserHome
' - wc_CaseReview
' 
' =============================================================================
' Notes:
' =============================================================================
' 
' 1. UpdateNavigation() relies on wp_MainShell having btnBack and btnLogout
' 2. Session.Navigation must be initialized in Session.Opening
' 3. ContainerID should match the string used in CreateContainerInstance()
' 4. Debug logging can be removed in production
' 
' =============================================================================