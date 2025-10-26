' =============================================================================
' WebNavigationManager Class
' Manages navigation between WebContainers with history support
' =============================================================================

' Insert → Class
' Name: WebNavigationManager
' Super: (none)

' ******************************************************************
' Properties:
' ******************************************************************
Private mHostPage As wp_MainShell
Private mHistory() As WebContainer
Private mForward() As WebContainer

' ******************************************************************
' Method: Constructor
' Parameters: host As wp_MainShell
' ******************************************************************
Public Sub Constructor(host As wp_MainShell)
  mHostPage = host
End Sub

' ******************************************************************
' Method: NavigateTo
' Parameters: container As WebContainer
' Purpose: Navigate to a new container, adding current to history
' ******************************************************************
Public Sub NavigateTo(container As WebContainer)
  
  
End Sub

' ******************************************************************
' Method: NavigateBack
' Purpose: Navigate to previous container in history
' ******************************************************************
Public Sub NavigateBack()
    ' Save current container to history
  If mHostPage.ContentArea <> Nil Then
    mHistory.Add(mHostPage.ContentArea)
    mHostPage.ContentArea.Visible = False
  End If

  ' Clear forward history on new navigation
  mForward.RemoveAll
  mHostPage.ContentArea = container

  ' Handle wc_Base positioning
  If container IsA wc_Base Then
    Var wc As wc_Base = wc_Base(container)
    
    Var embedW, embedH As Integer
    If wc.Position = wc_Base.PositionEnum.TopLeft Then
      embedW = mHostPage.Placeholder.Width
      embedH = mHostPage.Placeholder.Height
    Else
      embedW = wc.Width
      embedH = wc.Height
    End If
    
    container.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
    wc.EmbedInto(mHostPage.Placeholder)
  Else
    container.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
  End If

  container.Visible = True

  ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
  If container IsA wc_Base Then
    wc_Base(container).UpdateNavigation
  End If

  LogNavigation("NavigateTo", container)
End Sub

' ******************************************************************
' Method: NavigateForward
' Purpose: Navigate forward in history (after NavigateBack)
' ******************************************************************
Public Sub NavigateForward()
  If mForward.Count > 0 Then
    ' Save current to history
    If mHostPage.ContentArea <> Nil Then
      mHistory.Add(mHostPage.ContentArea)
      mHostPage.ContentArea.Visible = False
    End If
    
    ' Get next container
    Var nextContainer As WebContainer = mForward.Pop
    mHostPage.ContentArea = nextContainer
    
    ' Re-embed if necessary
    If nextContainer IsA wc_Base Then
      Var wc As wc_Base = wc_Base(nextContainer)
      
      If wc.Parent = Nil Then
        Var embedW, embedH As Integer
        If wc.Position = wc_Base.PositionEnum.TopLeft Then
          embedW = mHostPage.Placeholder.Width
          embedH = mHostPage.Placeholder.Height
        Else
          embedW = wc.Width
          embedH = wc.Height
        End If
        
        nextContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
      End If
      
      wc.EmbedInto(mHostPage.Placeholder)
    Else
      If nextContainer.Parent = Nil Then
        nextContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
      End If
    End If
    
    nextContainer.Visible = True
    
    ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
    If nextContainer IsA wc_Base Then
      wc_Base(nextContainer).UpdateNavigation
    End If
    
    LogNavigation("NavigateForward", nextContainer)
  End If
End Sub

' ******************************************************************
' Method: LogNavigation (Private)
' Parameters: action As String, destination As WebContainer
' Purpose: Debug logging for navigation actions
' ******************************************************************
Private Sub LogNavigation(action As String, destination As WebContainer)
  Var name As String = If(destination IsA wc_Base, wc_Base(destination).ContainerID, "Unknown")
  System.DebugLog("Navigation: " + action + " → " + name)
End Sub

' =============================================================================
' Usage:
' * Automatically manages navigation history
' * Supports back/forward navigation
' * Handles container embedding and positioning
' * Debug logging for troubleshooting
' =============================================================================