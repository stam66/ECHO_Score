' =============================================================================
' wc_CaseList WebContainer
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseList
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "Case Management", Bold, Large)
' Label: lblInstructions (text: "Double-click a case to view details and manage videos")
' ListBox: lstCases (2 columns: Serial Number, Description)
' PushButton: btnAddCase (text: "Add New Case", Primary style)
' PushButton: btnRefresh (text: "Refresh")

' wc_CaseList.Opening Event
Sub Opening()
  ContainerID = "CaseList"
  LoadCases()
End Sub

' LoadCases Method
Sub LoadCases()
  lstCases.RemoveAllRows
  
  Var sql As String = "SELECT case_id, serial_number, case_label FROM cases ORDER BY serial_number"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    While rs <> Nil And Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("serial_number").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
    
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub

' lstCases.CellAction Event (Double-click)
Sub CellAction(row As Integer, column As Integer)
  If row < 0 Then Return
  
  Var caseID As Integer = Me.RowTagAt(row)
  
  ' Navigate to case details
  Var caseDetails As New wc_CaseDetails
  caseDetails.ContainerID = "CaseDetails"
  caseDetails.CaseID = caseID
  Session.Navigation.NavigateTo(caseDetails)
End Sub

' btnAddCase.Pressed Event
Sub Pressed()
  ' Show add case dialog
  Var dialog As New dlg_AddCase
  AddHandler dialog.CaseAdded, AddressOf HandleCaseAdded
  dialog.Show
End Sub

' HandleCaseAdded Method
Private Sub HandleCaseAdded(caseID As Integer)
  ' Refresh case list
  LoadCases()
  
  ' Navigate to new case details
  Var caseDetails As New wc_CaseDetails
  caseDetails.ContainerID = "CaseDetails"
  caseDetails.CaseID = caseID
  Session.Navigation.NavigateTo(caseDetails)
End Sub

' btnRefresh.Pressed Event
Sub Pressed()
  LoadCases()
End Sub