#tag WebPage
Begin WebDialog dlg_UserProgress
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   560
   Index           =   -2147483648
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   PanelIndex      =   0
   Position        =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1000
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   18.0
      Height          =   30
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
      Text            =   "Student"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   960
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblSummary
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   24
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
      TabIndex        =   1
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   54
      Underline       =   False
      Visible         =   True
      Width           =   960
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstCases
      AllowRowReordering=   False
      ColumnCount     =   6
      ColumnWidths    =   "90, *, 130, 120, 120, 140"
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   36
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   400
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Case	Label	Status	Started	Completed	Score"
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
      NoRowsMessage   =   "No cases available to this student"
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   90
      Visible         =   True
      Width           =   960
      _mPanelIndex    =   -1
   End
   Begin WebButton btnClose
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Close"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   880
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   505
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' dlg_UserProgress - per-student case-by-case progress, opened from
		  ' wc_ProgressReview on double-click. Set UserID (and optionally GroupFilter,
		  ' the parent page's selected group) before calling Show.
		  ' *******************************************************************************
		  LoadDetails
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadDetails()
		  lstCases.RemoveAllRows
		  Const TOTAL_QUESTIONS As Integer = 13
		  
		  ' --- User header -----------------------------------------------------------
		  Var fullName As String = ""
		  Var userGroup As String = ""
		  Var isActive As Boolean = True
		  
		  Try
		    Var ups As MySQLPreparedStatement = Session.DB.Prepare("SELECT full_name, user_group, is_active FROM users WHERE user_id = ?")
		    ups.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ups.Bind(0, UserID)
		    Var urs As RowSet = ups.SelectSQL
		    If Not urs.AfterLastRow Then
		      fullName = urs.Column("full_name").StringValue
		      userGroup = urs.Column("user_group").StringValue
		      isActive = urs.Column("is_active").BooleanValue
		    End If
		  Catch e As DatabaseException
		    MessageBox("Error loading user: " + e.Message)
		    Return
		  End Try
		  
		  If isActive Then
		    lblTitle.Text = fullName
		  Else
		    lblTitle.Text = fullName + " (inactive)"
		  End If
		  
		  ' --- Cases -----------------------------------------------------------------
		  ' Only the cases belonging to the context group: the group selected in the
		  ' parent page's filter if one is set, otherwise the user's own group. A user
		  ' with no group and no filter sees every case. Responses to cases outside
		  ' that group are deliberately not shown.
		  Var contextGroup As String = GroupFilter.Trim
		  If contextGroup = "" Then contextGroup = userGroup.Trim
		  
		  Var sql As String = _
		  "SELECT c.case_id, c.serial_number, c.case_label, " + _
		  "ur.response_id, ur.is_completed, ur.started_at, ur.completed_at, " + _
		  "ur.score, ur.has_mcq_questions, ur.mcq_score " + _
		  "FROM cases c " + _
		  "LEFT JOIN user_responses ur ON c.case_id = ur.case_id AND ur.user_id = ? "
		  
		  Var hasGroup As Boolean = (contextGroup <> "")
		  If hasGroup Then
		    sql = sql + "WHERE FIND_IN_SET(?, c.case_groups) > 0 "
		  End If
		  
		  sql = sql + "ORDER BY CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED), c.case_id"
		  
		  Var completed As Integer = 0
		  Var inProgress As Integer = 0
		  Var totalScore As Integer = 0
		  Var totalPossible As Integer = 0
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, UserID)
		    If hasGroup Then
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, contextGroup)
		    End If
		    Var rs As RowSet = ps.SelectSQL
		    
		    While Not rs.AfterLastRow
		      Var status As String
		      Var startedText As String = ""
		      Var completedText As String = ""
		      Var scoreText As String = "-"
		      
		      If rs.Column("response_id").Value = Nil Then
		        status = "Not Started"
		        
		      ElseIf rs.Column("is_completed").BooleanValue Then
		        status = "Completed"
		        completed = completed + 1
		        Var score As Integer = rs.Column("score").IntegerValue
		        scoreText = Str(score) + " / " + Str(TOTAL_QUESTIONS)
		        totalScore = totalScore + score
		        totalPossible = totalPossible + TOTAL_QUESTIONS
		        If rs.Column("has_mcq_questions").BooleanValue Then
		          scoreText = scoreText + " (MCQ " + Str(rs.Column("mcq_score").IntegerValue) + ")"
		        End If
		        
		      Else
		        status = "In Progress"
		        inProgress = inProgress + 1
		      End If
		      
		      If rs.Column("started_at").Value <> Nil Then
		        startedText = rs.Column("started_at").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Short, DateTime.FormatStyles.None)
		      End If
		      If rs.Column("completed_at").Value <> Nil Then
		        completedText = rs.Column("completed_at").DateTimeValue.ToString(Locale.Current, DateTime.FormatStyles.Short, DateTime.FormatStyles.None)
		      End If
		      
		      lstCases.AddRow(rs.Column("serial_number").StringValue, rs.Column("case_label").StringValue, status, startedText, completedText, scoreText)
		      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading progress: " + e.Message)
		  End Try
		  
		  ' --- Summary line ----------------------------------------------------------
		  Var groupText As String = contextGroup
		  If groupText = "" Then groupText = "none"
		  
		  Var summary As String = "Group: " + groupText + _
		  "    |    Completed: " + Str(completed) + " of " + Str(lstCases.RowCount) + _
		  "    |    In progress: " + Str(inProgress)
		  If totalPossible > 0 Then
		    summary = summary + "    |    Overall score: " + Format((totalScore / totalPossible) * 100, "0.0") + "%"
		  End If
		  lblSummary.Text = summary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		GroupFilter As String = ""
	#tag EndProperty

	#tag Property, Flags = &h0
		UserID As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events btnClose
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
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
		Name="Position"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="WebDialog.Positions"
		EditorType="Enum"
		#tag EnumValues
			"0 - Top"
			"1 - Center"
		#tag EndEnumValues
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
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
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
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
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
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
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
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
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
		Name="GroupsModified"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
