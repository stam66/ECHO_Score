-- =============================================================================
-- wc_UserHome WebContainer
-- Student dashboard with case list
-- =============================================================================

' Insert → WebContainer
' Name: wc_UserHome
' Super: wc_Base

' Controls:
' Label: lblWelcome (Bold, Large)
' ListBox: lstCases (3 columns: Case, Serial, Status)
' PushButton: btnStartCase (text: "Start/Continue Case")
' PushButton: btnLogout (text: "Logout")

' wc_UserHome.Opening Event
Sub Opening()
  lblWelcome.Text = "Welcome, " + Session.CurrentUserName
  LoadCases
End Sub

' LoadCases Method (WITH MULTI-GROUP FILTERING)
Sub LoadCases()
  lstCases.RemoveAllRows
  
  ' Get current user's group
  Var userGroup As String = ""
  Var userSQL As String = "SELECT user_group FROM users WHERE user_id = ?"
  
  Try
    Var userPS As MySQLPreparedStatement = Session.DB.Prepare(userSQL)
    userPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    userPS.Bind(0, Session.CurrentUserID)
    
    Var userRS As RowSet = userPS.SelectSQL
    If userRS <> Nil And Not userRS.AfterLastRow Then
      userGroup = userRS.Column("user_group").StringValue
    End If
  Catch e As DatabaseException
    ' If error, show all cases
  End Try
  
  ' Build SQL based on whether user has a group
  Var sql As String
  If userGroup.Trim = "" Then
    ' No group - show all cases
    sql = "SELECT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.response_id " + _
    "FROM cases c " + _
    "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
    "ORDER BY c.serial_number"
  Else
    ' Has group - show cases with matching videos OR cases with no purpose set
    ' Use FIND_IN_SET or LIKE to match comma-separated values
    sql = "SELECT DISTINCT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.response_id " + _
    "FROM cases c " + _
    "LEFT JOIN case_videos cv ON c.case_id = cv.case_id " + _
    "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
    "WHERE cv.video_purpose IS NULL OR cv.video_purpose = '' " + _
    "OR FIND_IN_SET(?, REPLACE(cv.video_purpose, ' ', '')) > 0 " + _
    "OR cv.video_purpose LIKE ? " + _
    "ORDER BY c.serial_number"
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, Session.CurrentUserID)
    
    If userGroup.Trim <> "" Then
      ' Remove spaces from user group for comparison
      Var cleanUserGroup As String = userGroup.ReplaceAll(" ", "")
      
      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(1, cleanUserGroup)
      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(2, "%" + userGroup + "%")
    End If
    
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

' btnStartCase.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case")
    Return
  End If
  
  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
  
  Var caseReview As New wc_CaseReview
  caseReview.CaseID = caseID
  caseReview.ContainerID = "CaseReview"
  caseReview.Position = wc_Base.PositionEnum.TopLeft
  Session.Navigation.NavigateTo(caseReview)
End Sub

' btnLogout.Pressed Event
Sub Pressed()
  Session.CurrentUserID = 0
  Session.CurrentUserName = ""
  Session.IsAdmin = False
  
  Var login As New wc_Login
  login.ContainerID = "Login"
  login.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(login)
End Sub

' =============================================================================
' Notes:
' * Shows only cases with videos matching user's group
' * Cases with no video_purpose set are visible to everyone
' * Multi-group support: videos can be assigned to multiple groups
' * Shows completion status for each case
' * Double-click or button to start case
' =============================================================================