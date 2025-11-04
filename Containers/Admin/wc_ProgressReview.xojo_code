#tag WebContainerControl
Begin wc_base wc_ProgressReview
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   688
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
   Width           =   1044
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebLabel lblGroupFilter
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
      Left            =   27
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Filter by Group:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   57
      Underline       =   False
      Visible         =   True
      Width           =   122
      _mPanelIndex    =   -1
   End
   Begin WebCombobox cmbGroupFilter
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FilteringMode   =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "All Groups"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   157
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   -1
      SelectedRowText =   ""
      TabIndex        =   1
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   57
      Visible         =   True
      Width           =   201
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblTimeFilter
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
      Left            =   486
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Time Period:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   57
      Underline       =   False
      Visible         =   True
      Width           =   98
      _mPanelIndex    =   -1
   End
   Begin WebCombobox cmbTimeFilter
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FilteringMode   =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "\nLast Month\nLast 3 Months\nLast 6 Months\nAll Time"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   592
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   -1
      SelectedRowText =   ""
      TabIndex        =   3
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   57
      Visible         =   True
      Width           =   201
      _mPanelIndex    =   -1
   End
   Begin WebButton btnRefresh
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Refresh"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   27
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   137
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstProgress
      AllowRowReordering=   False
      ColumnCount     =   5
      ColumnWidths    =   "35%, 20%, 15%, 15%, 15%"
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   485
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Name	Group	#Completed	Status	Score"
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
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   183
      Visible         =   True
      Width           =   1004
      _mPanelIndex    =   -1
   End
   Begin WebButton btnExport
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Export"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   924
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   137
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_ResultsReview.opening event
		  ' *******************************************************************************
		  
		  LoadGroupFilter
		  LoadProgress
		  
		  Self.EnableBackButton = True
		  Self.EnableLogoutButton = True
		  Self.SectionTitle = "Student Progress Review"
		  
		  UpdateNavigation // update shell page data
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  cmbTimeFilter.SelectedRowIndex = 1 
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CalculateOverallScore(userID As Integer, dateThreshold As String) As Double
		  ' This calculates the average score across all completed cases
		  Var sql As String = _
		  "SELECT " + _
		  "ur.*, " + _
		  "c.lv_size_dilated as correct_lv_size, " + _
		  "c.lv_function_impaired as correct_lv_function, " + _
		  "c.rv_size_dilated as correct_rv_size, " + _
		  "c.rv_function_impaired as correct_rv_function, " + _
		  "c.aortic_stenosis_significant as correct_aortic_stenosis, " + _
		  "c.aortic_regurgitation_significant as correct_aortic_regurg, " + _
		  "c.mitral_stenosis_significant as correct_mitral_stenosis, " + _
		  "c.mitral_regurgitation_significant as correct_mitral_regurg, " + _
		  "c.tricuspid_stenosis_significant as correct_tricuspid_stenosis, " + _
		  "c.tricuspid_regurgitation_significant as correct_tricuspid_regurg, " + _
		  "c.pericardial_effusion_significant as correct_pericardial, " + _
		  "c.ivc_high_ra_pressure as correct_ivc, " + _
		  "c.requires_full_echo as correct_full_echo " + _
		  "FROM user_responses ur " + _
		  "INNER JOIN cases c ON ur.case_id = c.case_id " + _
		  "WHERE ur.user_id = ? " + _
		  "AND ur.is_completed = TRUE "
		  
		  ' Add date filter if applicable
		  If dateThreshold <> "" Then
		    sql = sql + "AND ur.completed_at >= '" + dateThreshold + "'"
		  End If
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, userID)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    Var totalScore As Integer = 0
		    Var totalPossible As Integer = 0
		    Var caseCount As Integer = 0
		    
		    While Not rs.AfterLastRow
		      Var caseScore As Integer = 0
		      Const TOTAL_QUESTIONS As Integer = 13
		      
		      ' Compare each answer (13 questions total)
		      If rs.Column("lv_size_dilated").BooleanValue = rs.Column("correct_lv_size").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("lv_function_impaired").BooleanValue = rs.Column("correct_lv_function").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("rv_size_dilated").BooleanValue = rs.Column("correct_rv_size").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("rv_function_impaired").BooleanValue = rs.Column("correct_rv_function").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("aortic_stenosis_significant").BooleanValue = rs.Column("correct_aortic_stenosis").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("aortic_regurgitation_significant").BooleanValue = rs.Column("correct_aortic_regurg").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("mitral_stenosis_significant").BooleanValue = rs.Column("correct_mitral_stenosis").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("mitral_regurgitation_significant").BooleanValue = rs.Column("correct_mitral_regurg").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("tricuspid_stenosis_significant").BooleanValue = rs.Column("correct_tricuspid_stenosis").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("tricuspid_regurgitation_significant").BooleanValue = rs.Column("correct_tricuspid_regurg").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("pericardial_effusion_significant").BooleanValue = rs.Column("correct_pericardial").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("ivc_high_ra_pressure").BooleanValue = rs.Column("correct_ivc").BooleanValue Then caseScore = caseScore + 1
		      If rs.Column("requires_full_echo").BooleanValue = rs.Column("correct_full_echo").BooleanValue Then caseScore = caseScore + 1
		      
		      totalScore = totalScore + caseScore
		      totalPossible = totalPossible + TOTAL_QUESTIONS
		      caseCount = caseCount + 1
		      
		      rs.MoveToNextRow
		    Wend
		    
		    ' Return average percentage
		    If totalPossible > 0 Then
		      Return (totalScore / totalPossible) * 100
		    Else
		      Return 0
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error calculating score: " + e.Message)
		    Return 0
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDateThreshold() As String
		  ' Returns SQL-formatted date string based on selected time period
		  ' Returns empty string for "All Time"
		  
		  Var selectedIndex As Integer = cmbTimeFilter.SelectedRowIndex
		  If selectedIndex < 0 Then selectedIndex = 1  ' Default to Last Month
		  
		  Var now As DateTime = DateTime.Now
		  Var threshold As DateTime
		  
		  Select Case selectedIndex
		  Case 0  ' Last Week
		    threshold = now.SubtractInterval(0, 0, 7)
		  Case 1  ' Last Month
		    threshold = now.SubtractInterval(0, 1, 0)
		  Case 2  ' Last 3 Months
		    threshold = now.SubtractInterval(0, 3, 0)
		  Case 3  ' Last 6 Months
		    threshold = now.SubtractInterval(0, 6, 0)
		  Case 4  ' All Time
		    Return ""
		  Else
		    threshold = now.SubtractInterval(0, 1, 0)  ' Default to Last Month
		  End Select
		  
		  ' Format as SQL datetime: YYYY-MM-DD HH:MM:SS
		  Return threshold.SQLDateTime
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadGroupFilter()
		  cmbGroupFilter.RemoveAllRows
		  cmbGroupFilter.AddRow("All Groups")
		  
		  ' Load unique groups from users table
		  Var sql As String = "SELECT DISTINCT user_group FROM users WHERE user_group IS NOT NULL AND user_group != '' ORDER BY user_group"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    While Not rs.AfterLastRow
		      cmbGroupFilter.AddRow(rs.Column("user_group").StringValue)
		      rs.MoveToNextRow
		    Wend
		    
		    cmbGroupFilter.SelectedRowIndex = 0
		  Catch e As DatabaseException
		    MessageBox("Error loading groups: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProgress()
		  lstProgress.RemoveAllRows
		  
		  ' Get filter values
		  Var selectedGroup As String = ""
		  If cmbGroupFilter.SelectedRowIndex > 0 Then
		    selectedGroup = cmbGroupFilter.RowTextAt(cmbGroupFilter.SelectedRowIndex)
		  End If
		  
		  ' Calculate date threshold based on time filter
		  Var dateThreshold As String = GetDateThreshold()
		  
		  ' Build SQL query
		  Var sql As String = _
		  "SELECT " + _
		  "u.user_id, " + _
		  "u.full_name, " + _
		  "u.user_group, " + _
		  "COUNT(DISTINCT ur.case_id) as cases_completed, " + _
		  "(SELECT COUNT(*) FROM cases) as total_cases " + _
		  "FROM users u " + _
		  "LEFT JOIN user_responses ur ON u.user_id = ur.user_id " + _
		  "AND ur.is_completed = TRUE "
		  
		  ' Add date filter if not "All Time"
		  If dateThreshold <> "" Then
		    sql = sql + "AND ur.completed_at >= '" + dateThreshold + "' "
		  End If
		  
		  sql = sql + "WHERE u.is_admin = FALSE "
		  
		  ' Add group filter
		  If selectedGroup <> "" Then
		    sql = sql + "AND u.user_group = ? "
		  End If
		  
		  sql = sql + _
		  "GROUP BY u.user_id, u.full_name, u.user_group " + _
		  "ORDER BY u.full_name"
		  
		  Try
		    Var rs As RowSet
		    
		    If selectedGroup <> "" Then
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(0, selectedGroup)
		      rs = ps.SelectSQL
		    Else
		      rs = Session.DB.SelectSQL(sql)
		    End If
		    
		    ' Create centered style once (reuse for all rows)
		    Var centeredStyle As New WebStyle
		    centeredStyle.Value("text-align") = "center"
		    
		    While Not rs.AfterLastRow
		      Var userID As Integer = rs.Column("user_id").IntegerValue
		      Var fullName As String = rs.Column("full_name").StringValue
		      Var userGroup As String = rs.Column("user_group").StringValue
		      Var casesCompleted As Integer = rs.Column("cases_completed").IntegerValue
		      Var totalCases As Integer = rs.Column("total_cases").IntegerValue
		      
		      ' Calculate overall score for this user
		      Var overallScore As Double = CalculateOverallScore(userID, dateThreshold)
		      
		      ' Add row to listbox
		      lstProgress.AddRow(fullName)
		      Var rowIdx As Integer = lstProgress.LastAddedRowIndex
		      
		      ' Column 1: Group
		      lstProgress.CellTextAt(rowIdx, 1) = userGroup
		      
		      ' Column 2: Cases Completed (centered)
		      Var casesText As String = Str(casesCompleted) + " of " + Str(totalCases)
		      lstProgress.CellValueAt(rowIdx, 2) = New WebListBoxStyleRenderer(centeredStyle, casesText)
		      
		      ' Column 3: Completion Status (centered)
		      Var percentage As Double = 0
		      If totalCases > 0 Then
		        percentage = (casesCompleted / totalCases) * 100
		      End If
		      
		      Var statusText As String
		      If casesCompleted = 0 Then
		        statusText = "Not Started"
		      ElseIf casesCompleted = totalCases Then
		        statusText = "100% Complete"
		      Else
		        statusText = Format(percentage, "0.0") + "% Complete"
		      End If
		      lstProgress.CellValueAt(rowIdx, 3) = New WebListBoxStyleRenderer(centeredStyle, statusText)
		      
		      ' Column 4: Overall Score (centered)
		      Var scoreText As String
		      If casesCompleted > 0 Then
		        scoreText = Format(overallScore, "0.0") + "%"
		      Else
		        scoreText = "N/A"
		      End If
		      lstProgress.CellValueAt(rowIdx, 4) = New WebListBoxStyleRenderer(centeredStyle, scoreText)
		      
		      ' Store user_id in row tag for potential detail view
		      lstProgress.RowTagAt(rowIdx) = userID
		      
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading progress: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSelectedUserID As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events cmbGroupFilter
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  #Pragma Unused item
		  LoadProgress
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cmbTimeFilter
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  #Pragma Unused item
		  LoadProgress
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRefresh
	#tag Event
		Sub Pressed()
		  LoadProgress
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstProgress
	#tag Event
		Sub DoublePressed(row As Integer, column As Integer)
		  #Pragma Unused row
		  #Pragma Unused column
		  
		  If Me.SelectedRowIndex < 0 Then Return
		  
		  Var userID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
		  Var userName As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
		  
		  ' Future enhancement: Navigate to detailed view for this user
		  MessageBox("Detail view for " + userName + " (User ID: " + Str(userID) + ") - Coming soon!")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnExport
	#tag Event
		Sub Pressed()
		  ' Export current list to CSV
		  Var csv As String = "Student Name,Group,Cases Completed,Status,Overall Score" + EndOfLine
		  
		  For i As Integer = 0 To lstProgress.LastRowIndex
		    csv = csv + lstProgress.CellTextAt(i, 0) + ","
		    csv = csv + lstProgress.CellTextAt(i, 1) + ","
		    csv = csv + lstProgress.CellTextAt(i, 2) + ","
		    csv = csv + lstProgress.CellTextAt(i, 3) + ","
		    csv = csv + lstProgress.CellTextAt(i, 4) + EndOfLine
		  Next
		  
		  ' Generate filename with timestamp
		  Var timestamp As String = DateTime.Now.SQLDate
		  Var filename As String = "progress_export_" + timestamp + ".csv"
		  
		  Try
		    Var f As FolderItem = SpecialFolder.Desktop.Child(filename)
		    Var t As TextOutputStream = TextOutputStream.Create(f)
		    t.Write(csv)
		    t.Close
		    
		    MessageBox("Progress report exported to Desktop: " + filename)
		  Catch e As IOException
		    MessageBox("Error exporting file: " + e.Message)
		  End Try
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
