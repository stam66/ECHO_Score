' =============================================================================
' dlg_AddCase Dialog
' =============================================================================

' Insert → WebDialog
' Name: dlg_AddCase

' Properties:
Public Event CaseAdded(caseID As Integer)

' Controls:
' Label: lblTitle (text: "Add New Case", Bold)
' Label: lblCaseLabel (text: "Case Description:")
' TextField: txtCaseLabel
' Label: lblSerialNote (text: "Serial number will be auto-generated")
' PushButton: btnCreate (text: "Create Case", Primary style)
' PushButton: btnCancel (text: "Cancel")

' dlg_AddCase.Opening Event
Sub Opening()
  txtCaseLabel.SetFocus
End Sub

' btnCreate.Pressed Event
Sub Pressed()
  If txtCaseLabel.Text.Trim = "" Then
    MessageBox("Please enter a case description")
    Return
  End If
  
  Try
    ' Get next serial number
    Var serialSQL As String = "SELECT COALESCE(MAX(CAST(SUBSTRING(serial_number, 5) AS UNSIGNED)), 0) + 1 AS next_num FROM cases WHERE serial_number LIKE 'Case%'"
    Var serialRS As RowSet = Session.DB.SelectSQL(serialSQL)
    
    Var nextNum As Integer = 1
    If serialRS <> Nil And Not serialRS.AfterLastRow Then
      nextNum = serialRS.Column("next_num").IntegerValue
    End If
    
    Var serialNumber As String = "Case" + Format(nextNum, "000")
    
    ' Insert new case
    Var sql As String = "INSERT INTO cases (serial_number, case_label) VALUES (?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    
    ps.Bind(0, serialNumber)
    ps.Bind(1, txtCaseLabel.Text.Trim)
    
    ps.ExecuteSQL
    
    ' Get the new case_id
    Var idSQL As String = "SELECT LAST_INSERT_ID() AS case_id"
    Var idRS As RowSet = Session.DB.SelectSQL(idSQL)
    
    If idRS <> Nil And Not idRS.AfterLastRow Then
      Var newCaseID As Integer = idRS.Column("case_id").IntegerValue
      
      ' Raise event
      RaiseEvent CaseAdded(newCaseID)
      
      ' Close dialog
      Me.Close
    End If
    
  Catch e As DatabaseException
    MessageBox("Error creating case: " + e.Message)
  End Try
End Sub

' btnCancel.Pressed Event
Sub Pressed()
  Me.Close
End Sub