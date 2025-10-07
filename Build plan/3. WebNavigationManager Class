' Insert → Class
' Name: WebNavigationManager
' Super: (none)

' *******************************************************************************
' Add Properties:
' *******************************************************************************
Private mHostPage As wp_MainShell
Private mHistory() As WebContainer
Private mForward() As WebContainer

' *******************************************************************************
' Add Method: Constructor
'   Parameters: host As wp_MainShell
' *******************************************************************************
Public Sub Constructor(host As wp_MainShell)
  mHostPage = host
End Sub


' *******************************************************************************
' Add Method: NavigateTo
'   Parameters: container As WebContainer
' *******************************************************************************
Public Sub NavigateTo(container As WebContainer)
  If mHostPage.ContentArea <> Nil Then
    mHistory.Add(mHostPage.ContentArea)
    mHostPage.ContentArea.Visible = False
  End If
  
  mForward.RemoveAll
  mHostPage.ContentArea = container
  
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
  LogNavigation("NavigateTo", container)
End Sub


' *******************************************************************************
' Add Method: NavigateBack
' *******************************************************************************
Public Sub NavigateBack()
  If mHistory.Count > 0 Then
    If mHostPage.ContentArea <> Nil Then
      mForward.Add(mHostPage.ContentArea)
      mHostPage.ContentArea.Visible = False
    End If
    
    Var previousContainer As WebContainer = mHistory.Pop
    mHostPage.ContentArea = previousContainer
    
    If previousContainer IsA wc_Base Then
      Var wc As wc_Base = wc_Base(previousContainer)
      
      If wc.Parent = Nil Then
        Var embedW, embedH As Integer
        If wc.Position = wc_Base.PositionEnum.TopLeft Then
          embedW = mHostPage.Placeholder.Width
          embedH = mHostPage.Placeholder.Height
        Else
          embedW = wc.Width
          embedH = wc.Height
        End If
        
        previousContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
      End If
      
      wc.EmbedInto(mHostPage.Placeholder)
    Else
      If previousContainer.Parent = Nil Then
        previousContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
      End If
    End If
    
    previousContainer.Visible = True
    LogNavigation("NavigateBack", previousContainer)
  End If
End Sub

' *******************************************************************************
' Add Method: NavigateForward
' *******************************************************************************
Public Sub NavigateForward()
  If mForward.Count > 0 Then
    If mHostPage.ContentArea <> Nil Then
      mHistory.Add(mHostPage.ContentArea)
      mHostPage.ContentArea.Visible = False
    End If
    
    Var nextContainer As WebContainer = mForward.Pop
    mHostPage.ContentArea = nextContainer
    
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
    LogNavigation("NavigateForward", nextContainer)
  End If
End Sub

' *******************************************************************************
' Add Method: LogNavigation
'   Parameters: action As String, destination As WebContainer
' *******************************************************************************
Private Sub LogNavigation(action As String, destination As WebContainer)
  Var name As String = If(destination IsA wc_Base, wc_Base(destination).ContainerID, "Unknown")
  System.DebugLog("Navigation: " + action + " → " + name)
End Sub