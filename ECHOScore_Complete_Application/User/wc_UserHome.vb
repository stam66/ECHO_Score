' =============================================================================
' wc_UserHome WebContainer - Complete Updated Version
' Student dashboard with case list, group filtering, and completion tracking
' =============================================================================

' Insert → WebContainer
' Name: wc_UserHome
' Super: wc_Base

' Properties:
Private mCurrentCaseIndex As Integer = -1
Private mCaseIDs() As Integer

' Controls:
' Label: lblTitle (text: "My Cases", Bold, Large)
' Label: lblWelcome (text: "Welcome, [Student Name]")
' Label: lblGroup (text: "Group: [Group Name]")
' ListBox: lstCases (4 columns: Serial Number, Description, Status, Score)
' PushButton: btnOpenCase (text: "Open Case", Primary style)
' PushButton: btnPreviousCase (text: "❮ Previous Case")
' PushButton: btnNextCase (text: "Next Case ❯")

' wc_UserHome.Opening Event
Sub Opening()
  ContainerID = "UserHome"
  lblWelcome.Text = "Welcome, " + Session.CurrentUsername
  lblGroup.Text = "Group: " + Session.UserGroup
  LoadCases()
End Sub

' LoadCases Method
Sub LoadCases()
  lstCases.RemoveAllRows
  mCaseIDs.RemoveAll
  mCurrentCaseIndex = -1
  
  ' Build SQL for group filtering
  Var sql As String
  If Session.UserGroup = "" Or Session.UserGroup = Nil Then
    ' No group assigned - show all cases
    sql = "SELECT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.score FROM cases c LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? ORDER BY c.serial_number"
  Else
    ' Show cases where user's group matches any group in case_groups
    sql = "SELECT c.case_id, c.serial_number, c.case_label, ur.is_completed, ur.score FROM cases c LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? WHERE (c.case_groups IS NULL OR c.case_groups = '' OR FIND_IN_SET(?, REPLACE(c.case_groups, ' ', '')) > 0 OR c.case_groups LIKE ?) ORDER BY c.serial_number"
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, Session.CurrentUserID)
    
    If Session.UserGroup <> "" And Session.UserGroup <> Nil Then
      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(1, Session.UserGroup)
      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(2, "%" + Session.UserGroup + "%")
    End If
    
    Var rs As RowSet = ps.SelectSQL
    
    While rs <> Nil And Not rs.AfterLastRow
      Var caseID As Integer = rs.Column("case_id").IntegerValue
      Var serialNumber As String = rs.Column("serial_number").StringValue
      Var caseLabel As String = rs.Column("case_label").StringValue
      Var isCompleted As Boolean = False
      Var score As String = ""
      
      If rs.Column("is_completed").Value <> Nil Then
        isCompleted = rs.Column("is_completed").BooleanValue
      End If
      
      If rs.Column("score").Value <> Nil Then
        score = Str(rs.Column("score").IntegerValue) + "/13"
      End If
      
      ' Determine status
      Var status As String
      If isCompleted Then
        status = "Completed"
      ElseIf rs.Column("is_completed").Value <> Nil Then
        status = "In Progress"
      Else
        status = "Not Started"
      End If
      
      ' Add to list
      lstCases.AddRow(serialNumber)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = caseLabel
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = status
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 3) = score
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = caseID
      
      ' Add to case IDs array for navigation
      mCaseIDs.Add(caseID)
      
      rs.MoveToNextRow
    Wend
    
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
  
  UpdateNavigationButtons()
End Sub

' lstCases.SelectionChanged Event
Sub SelectionChanged()
  If Me.SelectedRowIndex >= 0 Then
    mCurrentCaseIndex = Me.SelectedRowIndex
    UpdateNavigationButtons()
  End If
End Sub

' lstCases.CellAction Event (Double-click)
Sub CellAction(row As Integer, column As Integer)
  If row >= 0 Then
    Me.SelectedRowIndex = row
    btnOpenCase.Pressed
  End If
End Sub

' btnOpenCase.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case to open")
    Return
  End If
  
  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
  
  ' Navigate to case review
  Var caseReview As New wc_CaseReview
  caseReview.ContainerID = "CaseReview"
  caseReview.CaseID = caseID
  Session.Navigation.NavigateTo(caseReview)
End Sub

' btnPreviousCase.Pressed Event
Sub Pressed()
  If mCurrentCaseIndex > 0 Then
    mCurrentCaseIndex = mCurrentCaseIndex - 1
    lstCases.SelectedRowIndex = mCurrentCaseIndex
    btnOpenCase.Pressed
  ElseIf mCaseIDs.Count > 0 Then
    ' Wrap around to last case
    mCurrentCaseIndex = mCaseIDs.Count - 1
    lstCases.SelectedRowIndex = mCurrentCaseIndex
    btnOpenCase.Pressed
  End If
End Sub

' btnNextCase.Pressed Event
Sub Pressed()
  If mCurrentCaseIndex < mCaseIDs.Count - 1 Then
    mCurrentCaseIndex = mCurrentCaseIndex + 1
    lstCases.SelectedRowIndex = mCurrentCaseIndex
    btnOpenCase.Pressed
  ElseIf mCaseIDs.Count > 0 Then
    ' Wrap around to first case
    mCurrentCaseIndex = 0
    lstCases.SelectedRowIndex = mCurrentCaseIndex
    btnOpenCase.Pressed
  End If
End Sub

' UpdateNavigationButtons Method
Sub UpdateNavigationButtons()
  btnPreviousCase.Enabled = (mCaseIDs.Count > 0)
  btnNextCase.Enabled = (mCaseIDs.Count > 0)
  btnOpenCase.Enabled = (lstCases.SelectedRowIndex >= 0)
End Sub

' =============================================================================
' wc_UserHome Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. CASE FILTERING:
'    - Shows only cases assigned to user's group
'    - Cases without groups are visible to all
'    - Uses FIND_IN_SET() and LIKE for comma-separated matching
' 
' 2. COMPLETION TRACKING:
'    - Status column: "Not Started", "In Progress", "Completed"
'    - Score column: "X/13" for completed cases
'    - LEFT JOIN with user_responses to show status
' 
' 3. CASE NAVIGATION:
'    - Double-click to open case
'    - "Open Case" button
'    - Previous/Next buttons with wrap-around
'    - Keyboard-friendly navigation
' 
' 4. USER INFO DISPLAY:
'    - Welcome message with username
'    - Current group assignment
'    - Helps users know their context
' 
' 5. LIST DISPLAY:
'    - Four columns: Serial Number, Description, Status, Score
'    - Clear visual feedback on progress
'    - Sortable by serial number
' 
' =============================================================================
' Group Filtering Logic:
' =============================================================================
' 
' A student sees a case if:
' 1. The case has no groups assigned (case_groups is NULL or empty), OR
' 2. The student's user_group matches ANY group in the case's case_groups
' 
' Example:
' - Student group: "Cardiology 2025 Q1"
' - Case groups: "Cardiology 2025 Q1,ICU 2025 Q1,ED 2025 Q1"
' - Result: Student sees the case
' 
' The SQL uses:
' - FIND_IN_SET() for exact matching (after removing spaces)
' - LIKE for flexible matching (with spaces)
' 
' =============================================================================
' Navigation Behavior:
' =============================================================================
' 
' - Previous button: Goes to previous case, wraps to last
' - Next button: Goes to next case, wraps to first
' - Both buttons navigate immediately (no separate Open click needed)
' - Allows quick review of multiple cases
' 
' =============================================================================
