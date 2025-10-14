#tag WebContainerControl
Begin wc_base wc_UserHome
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   628
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
   Width           =   812
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblWelcome
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
      Visible         =   True
      Width           =   512
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstCases
      AllowRowReordering=   False
      ColumnCount     =   3
      ColumnWidths    =   "60%,20%,20%"
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   447
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Case	Serial	Status"
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
      Top             =   154
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
      Indicator       =   0
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
      Top             =   98
      Visible         =   True
      Width           =   217
      _mPanelIndex    =   -1
   End
   Begin WebButton btnLogout
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Log out"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   248
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
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   98
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
		  ' wc_UserHome.Opening event
		  ' *******************************************************************************
		  lblWelcome.Text = "Welcome, " + Session.CurrentUserName
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
	#tag EndMethod


#tag EndWindowCode

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
#tag Events btnLogout
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnLogout.Pressed Event
		  ' *******************************************************************************
		  Session.CurrentUserID = 0
		  Session.CurrentUserName = ""
		  Session.IsAdmin = False
		  
		  Var login As New wc_Login
		  login.ContainerID = "Login"
		  login.Position = wc_Base.PositionEnum.Center
		  Session.Navigation.NavigateTo(login)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
