-- =============================================================================
-- wc_CaseList WebContainer
-- Case list view with navigation to details (Screen 1 of 2)
-- =============================================================================

' Insert → WebContainer
' Name: wc_CaseList
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "Case Management", Bold, Large)
' Label: lblInstructions (text: "Double-click a case to view details and manage videos")
' ListBox: lstCases (2 columns: Serial Number, Description)
' PushButton: btnNewCase (text: "New Case")
' PushButton: btnDeleteCase (text: "Delete Case")
' PushButton: btnBack (text: "Back to Admin")

' wc_CaseList.Opening Event
Sub Opening()
  LoadCases
End Sub

' LoadCases Method
Sub LoadCases()
  lstCases.RemoveAllRows
  
  Var sql As String = "SELECT case_id, serial_number, case_label FROM cases ORDER BY serial_number"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    While Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("serial_number").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub

' lstCases.DoublePressed Event
Sub DoublePressed()
  If Me.SelectedRowIndex < 0 Then Return
  
  Var caseID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
  
  Var caseDetails As New wc_CaseDetails
  caseDetails.ContainerID = "CaseDetails"
  caseDetails.Position = wc_Base.PositionEnum.TopLeft
  caseDetails.CaseID = caseID
  Session.Navigation.NavigateTo(caseDetails)
End Sub

' btnNewCase.Pressed Event
Sub Pressed()
  Var dlg As New dlg_AddCase
  AddHandler dlg.Closed, AddressOf HandleAddCaseDialogClosed
  dlg.Show
End Sub

' HandleAddCaseDialogClosed Method
Private Sub HandleAddCaseDialogClosed()
  ' Reload cases after dialog closes
  LoadCases
End Sub

' btnDeleteCase.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case to delete")
    Return
  End If
  
  Var d As New WebMessageDialog
  d.Title = "Confirm Delete"
  d.Message = "Are you sure you want to delete this case? This will also delete all associated videos and user responses. This action cannot be undone."
  d.ActionButton.Caption = "Delete"
  d.CancelButton.Caption = "Cancel"
  d.CancelButton.Visible = True
  
  AddHandler d.ButtonPressed, AddressOf HandleDeleteCaseConfirm
  d.Show
End Sub

' HandleDeleteCaseConfirm Method
Private Sub HandleDeleteCaseConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
  Select Case button
  Case dialog.ActionButton
    Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
    Var sql As String = "DELETE FROM cases WHERE case_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, caseID)
      
      ps.ExecuteSQL
      
      MessageBox("Case deleted successfully!")
      LoadCases
      
    Catch e As DatabaseException
      MessageBox("Error deleting case: " + e.Message)
    End Try
  End Select
End Sub

' btnBack.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * Simple list view of all cases
' * Double-click to navigate to wc_CaseDetails
' * New Case button opens dlg_AddCase dialog
' * Cascade delete: deleting case removes videos and responses
' * Clean, uncluttered interface
' =============================================================================