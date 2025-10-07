' Insert → Class
' Name: wc_Base
' Super: WebContainer

' *******************************************************************************
' Add Properties:
' *******************************************************************************
Public ContainerID As String
Public Position As PositionEnum


' *******************************************************************************
' Insert → Enum in wc_Base
' Name: PositionEnum
' Add values:
'    Center
'    TopLeft
' Add Method: EmbedInto
'   Parameters: target As WebContainer
'   Return Type: (none)
' *******************************************************************************
Public Sub EmbedInto(target As WebContainer) 
  Select Case Position
  Case PositionEnum.TopLeft
    Self.LockLeft = True
    Self.LockTop = True
    Self.LockRight = True
    Self.LockBottom = True
    
  Case PositionEnum.Center
    Var targetW As Integer = target.Width
    Var targetH As Integer = target.Height
    Self.Left = (targetW - Self.Width) / 2
    Self.Top = (targetH - Self.Height) / 2
  End Select
End Sub