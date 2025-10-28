#tag WebContainerControl
Begin wc_base wc_UserHome
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   698
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1072
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblWelcome
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   20.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Welcome, <user>"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   False
      Width           =   772
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstCases
      AllowRowReordering=   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   632
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Serial	Status	Score	Date Completed"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   772
      _mPanelIndex    =   -1
   End
   Begin WebButton btnStartCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Start/Continue Case"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   8
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   217
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblProgressTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Your Progress"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   59
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblTotalCases
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Total number of cases: 0"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   105
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblCompleted
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Completed: 0"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   151
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblInProgress
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Text            =   "In Progress: 0"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   197
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblNotStarted
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   8
      TabStop         =   True
      Text            =   "Not yet started: 0"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   243
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblAverageScore
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   819
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   9
      TabStop         =   True
      Text            =   "Average Score: --"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   289
      Underline       =   False
      Visible         =   True
      Width           =   233
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_UserHome.Opening event
		  ' *******************************************************************************
		  lblWelcome.Text = "Welcome, " + Session.CurrentUserName
		  LoadProgressStats
		  LoadCases
		  
		  Self.EnableBackButton = False
		  Self.EnableLogoutButton = True
		  Self.SectionTitle = "Welcome, " + Session.CurrentUserName
		  
		  UpdateNavigation // update shell page data
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  LoadProgressStats
		  LoadCases
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadCases()
		  ' *******************************************************************************
		  '  LoadCases Method (WITH MULTI-GROUP FILTERING)
		  ' *******************************************************************************
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
		    sql = "SELECT c.case_id, c.serial_number, ur.is_completed, ur.response_id, ur.score, ur.completed_at " + _
		    "FROM cases c " + _
		    "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
		    "ORDER BY CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)"
		  Else
		    ' Has group - show cases where case_groups contains user's group
		    sql = "SELECT c.case_id, c.serial_number, ur.is_completed, ur.response_id, ur.score, ur.completed_at " + _
		    "FROM cases c " + _
		    "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? " + _
		    "WHERE c.case_groups LIKE ? OR c.case_groups IS NULL OR c.case_groups = '' " + _
		    "ORDER BY CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)"
		  End If
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, Session.CurrentUserID)
		    
		    If userGroup.Trim <> "" Then
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, "%" + userGroup + "%")
		    End If
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    While Not rs.AfterLastRow
		      ' Column 0: Serial Number
		      lstCases.AddRow(rs.Column("serial_number").StringValue)
		      
		      ' Column 1: Status
		      If rs.Column("response_id").IntegerValue > 0 Then
		        If rs.Column("is_completed").BooleanValue Then
		          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = "Completed"
		        Else
		          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = "In Progress"
		        End If
		      Else
		        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = "Not Started"
		      End If
		      
		      ' Column 2: Score (only if completed)
		      ' FIXED: Score is always calculated on submit, never NULL if completed
		      If rs.Column("is_completed").BooleanValue Then
		        If rs.Column("score").Value <> Nil Then
		          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = Str(rs.Column("score").IntegerValue) + " / 13"
		        Else
		          ' This should never happen, but handle gracefully
		          lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "Error"
		        End If
		      Else
		        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = "--"
		      End If
		      
		      ' Column 3: Date Completed
		      If rs.Column("completed_at").Value <> Nil Then
		        Var completedDate As DateTime = rs.Column("completed_at").DateTimeValue
		        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 3) = completedDate.ToString(Locale.Current, DateTime.FormatStyles.Short, DateTime.FormatStyles.None)
		      Else
		        lstCases.CellTextAt(lstCases.LastAddedRowIndex, 3) = "--"
		      End If
		      
		      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading cases: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProgressStats()
		  ' Get user's group for filtering
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
		    System.DebugLog("Error getting user group: " + e.Message)
		  End Try
		  
		  ' Build SQL to get progress stats based on accessible cases
		  Var statsSQL As String
		  If userGroup.Trim = "" Then
		    ' No group - count all cases
		    statsSQL = "SELECT " + _
		    "(SELECT COUNT(DISTINCT c.case_id) FROM cases c) AS total_cases, " + _
		    "(SELECT COUNT(*) FROM user_responses WHERE user_id = ? AND is_completed = 1) AS completed, " + _
		    "(SELECT COUNT(*) FROM user_responses WHERE user_id = ? AND is_completed = 0) AS in_progress, " + _
		    "(SELECT AVG(score) FROM user_responses WHERE user_id = ? AND is_completed = 1) AS avg_score"
		  Else
		    ' Has group - count only accessible cases
		    statsSQL = "SELECT " + _
		    "(SELECT COUNT(DISTINCT c.case_id) FROM cases c WHERE c.case_groups LIKE ? OR c.case_groups IS NULL OR c.case_groups = '') AS total_cases, " + _
		    "(SELECT COUNT(*) FROM user_responses ur INNER JOIN cases c ON ur.case_id = c.case_id WHERE ur.user_id = ? AND ur.is_completed = 1 AND (c.case_groups LIKE ? OR c.case_groups IS NULL OR c.case_groups = '')) AS completed, " + _
		    "(SELECT COUNT(*) FROM user_responses ur INNER JOIN cases c ON ur.case_id = c.case_id WHERE ur.user_id = ? AND ur.is_completed = 0 AND (c.case_groups LIKE ? OR c.case_groups IS NULL OR c.case_groups = '')) AS in_progress, " + _
		    "(SELECT AVG(ur.score) FROM user_responses ur INNER JOIN cases c ON ur.case_id = c.case_id WHERE ur.user_id = ? AND ur.is_completed = 1 AND (c.case_groups LIKE ? OR c.case_groups IS NULL OR c.case_groups = '')) AS avg_score"
		  End If
		  
		  Try
		    Var statsPS As MySQLPreparedStatement = Session.DB.Prepare(statsSQL)
		    Var paramIndex As Integer = 0
		    
		    If userGroup.Trim <> "" Then
		      ' Bind group filter for total_cases
		      statsPS.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      statsPS.Bind(paramIndex, "%" + userGroup + "%")
		      paramIndex = paramIndex + 1
		    End If
		    
		    ' Bind user_id parameters
		    For i As Integer = 0 To 2
		      statsPS.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      statsPS.Bind(paramIndex, Session.CurrentUserID)
		      paramIndex = paramIndex + 1
		      
		      If userGroup.Trim <> "" Then
		        statsPS.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        statsPS.Bind(paramIndex, "%" + userGroup + "%")
		        paramIndex = paramIndex + 1
		      End If
		    Next
		    
		    Var statsRS As RowSet = statsPS.SelectSQL
		    
		    If statsRS <> Nil And Not statsRS.AfterLastRow Then
		      Var totalCases As Integer = statsRS.Column("total_cases").IntegerValue
		      Var completed As Integer = statsRS.Column("completed").IntegerValue
		      Var inProgress As Integer = statsRS.Column("in_progress").IntegerValue
		      Var notStarted As Integer = totalCases - completed - inProgress
		      
		      lblTotalCases.Text = "Total Cases Available: " + Str(totalCases)
		      lblCompleted.Text = "Completed: " + Str(completed)
		      lblInProgress.Text = "In Progress: " + Str(inProgress)
		      lblNotStarted.Text = "Not Started: " + Str(notStarted)
		      
		      ' Average score
		      If statsRS.Column("avg_score").Value <> Nil Then
		        Var avgScore As Double = statsRS.Column("avg_score").DoubleValue
		        lblAverageScore.Text = "Average Score: " + Format(avgScore, "#0.0") + " / 13"
		      Else
		        lblAverageScore.Text = "Average Score: --"
		      End If
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading progress stats: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lstCases
	#tag Event
		Sub DoublePressed(row As Integer, column As Integer)
		  #Pragma Unused row
		  #Pragma Unused column
		  
		  btnStartCase.Press
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnStartCase
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnStartCase.Pressed Event
		  ' *******************************************************************************
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
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="SectionTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EnableBackButton"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EnableLogoutButton"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="ContainerID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Position"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="PositionEnum"
		EditorType="Enum"
		#tag EnumValues
			"0 - Center"
			"1 - TopLeft"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
