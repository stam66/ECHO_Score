-- =============================================================================
-- wc_Base Class
-- Base class for all WebContainers with positioning support
-- =============================================================================

' Insert → Class
' Name: wc_Base
' Super: WebContainer

' Properties:
Public ContainerID As String
Public Position As PositionEnum

' Insert → Enum in wc_Base
' Name: PositionEnum
' Values: 
'   - Center
'   - TopLeft

' Method: EmbedInto
' Parameters: target As WebContainer
' Purpose: Positions the container within the target based on Position property
Public Sub EmbedInto(target As WebContainer) 
  Select Case Position
  Case PositionEnum.TopLeft
    ' Lock all sides for full-screen containers
    Self.LockLeft = True
    Self.LockTop = True
    Self.LockRight = True
    Self.LockBottom = True
    
  Case PositionEnum.Center
    ' Center the container within the target
    Var targetW As Integer = target.Width
    Var targetH As Integer = target.Height
    Self.Left = (targetW - Self.Width) / 2
    Self.Top = (targetH - Self.Height) / 2
  End Select
End Sub

' =============================================================================
' Usage:
' 
' All WebContainers in the application should inherit from wc_Base.
' 
' Example:
'   Var login As New wc_Login
'   login.ContainerID = "Login"
'   login.Position = wc_Base.PositionEnum.Center
'   Session.Navigation.NavigateTo(login)
' 
' PositionEnum.Center: Used for login, dialogs, and small forms
' PositionEnum.TopLeft: Used for full-screen dashboards and main views
' =============================================================================