-- =============================================================================
-- dlg_AddCase WebDialog
-- Dialog for creating new cases with auto-incrementing case numbers
-- =============================================================================

' Insert → WebDialog
' Name: dlg_AddCase

' Controls:
' Label: lblTitle (text: "Add New Case", Bold)
' Label: lblSerialNumber (text: "Case Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblDescription (text: "Case Description:")
' TextField: txtDescription
' PushButton: btnOK (text: "Create Case", Default = True)
' PushButton: btnCancel (text: "Cancel", Cancel = True)

' dlg_AddCase.Opening Event
Sub Opening()
  ' Get next case number
  Var sql As String = "SELECT serial_number FROM cases ORDER BY serial_number DESC LIMIT 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    If rs <> Nil And Not rs.AfterLastRow Then
      Var lastSerial As String = rs.Column("serial_number").StringValue
      ' Extract number from "Case X"
      Var parts() As String = lastSerial.Split(" ")
      If parts.Count >= 2 Then
        Var lastNum As Integer = Val(parts(1))
        txtSerialNumber.Text = "Case " + Str(lastNum + 1)
      Else
        txtSerialNumber.Text = "Case 1"
      End If
    Else
      txtSerialNumber.Text = "Case 1"
    End If
  Catch e As DatabaseException
    txtSerialNumber.Text = "Case 1"
  End Try
  
  txtDescription.SetFocus
End Sub

' btnOK.Pressed Event
Sub Pressed()
  If txtDescription.Text.Trim = "" Then
    MessageBox("Please enter a case description")
    Return
  End If
  
  ' Create the case with all checkboxes set to NULL (indeterminate)
  Var sql As String = "INSERT INTO cases (serial_number, case_label) VALUES (?, ?)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, txtSerialNumber.Text.Trim)
    ps.Bind(1, txtDescription.Text.Trim)
    ps.ExecuteSQL
    
    MessageBox("Case created successfully!")
    Self.Close
  Catch e As DatabaseException
    MessageBox("Error creating case: " + e.Message)
  End Try
End Sub

' btnCancel.Pressed Event
Sub Pressed()
  Self.Close
End Sub

' =============================================================================
' Notes:
' * Auto-generates next case number (Case 1, Case 2, etc.)
' * Serial number is read-only (auto-assigned)
' * All correct answer checkboxes start as NULL/indeterminate
' * Admin can set correct answers later in wc_CaseDetails
' =============================================================================