Insert → WebContainer
Name: wc_UserHome
Super: wc_Base

' *******************************************************************************
' Controls
' *******************************************************************************
' Label: lblWelcome (Bold, Large)
' ListBox: lstCases (4 columns: Case, Serial, Status, Score)
' PushButton: btnStartCase (text: "Start/Continue Case")
' PushButton: btnLogout (text: "Logout")


' *******************************************************************************
' wc_UserHome.Opening event
' *******************************************************************************
Sub Opening()
  lblWelcome.Text = "Welcome, " + Session.CurrentUserName
  LoadCases
End Sub


' *******************************************************************************
' Methods
' *******************************************************************************
Sub LoadCases()
  lstCases.RemoveAllRows
  
  Var sql As String = _
  "SELECT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.response_id " + _
  "FROM cases c " + _
  "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
  "ORDER BY c.serial_number"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, Session.CurrentUserID)
    
    Var rs As RowSet = ps.SelectSQL
    
    While Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("case_label").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("serial_number").StringValue
      
      If rs.Column("response_id").IntegerValue > 0 Then
        If rs.Column("is_completed").BooleanValue Then
          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "Completed"
        Else
          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "In Progress"
        End If
      Else
        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "Not Started"
      End If
      
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
    
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub


' *******************************************************************************   
' Methods
' *******************************************************************************
Sub LoadCases()
  lstCases.RemoveAllRows
  
  Var sql As String = _
  "SELECT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.response_id " + _
  "FROM cases c " + _
  "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
  "ORDER BY c.serial_number"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, Session.CurrentUserID)
    
    Var rs As RowSet = ps.SQLSelect
    
    While Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("case_label").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("serial_number").StringValue
      
      If rs.Column("response_id").IntegerValue > 0 Then
        If rs.Column("is_completed").BooleanValue Then
          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "Completed"
        Else
          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "In Progress"
        End If
      Else
        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "Not Started"
      End If
      
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
    
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' btnStartCase.Pressed Event
' *******************************************************************************
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case")
    Return
  End If
  
  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
  
  Var caseReview As New wc_CaseReview
  caseReview.ContainerID = "CaseReview"
  caseReview.Position = wc_Base.PositionEnum.TopLeft
  caseReview.CaseID = caseID
  Session.Navigation.NavigateTo(caseReview)
End Sub


' *******************************************************************************
' btnLogout.Pressed Event
' *******************************************************************************
Sub Pressed()
  Session.CurrentUserID = 0
  Session.CurrentUserName = ""
  Session.IsAdmin = False
  
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub


