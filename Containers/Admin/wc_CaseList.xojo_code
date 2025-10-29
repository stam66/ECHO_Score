#tag WebContainerControl
Begin wc_base wc_CaseList
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
   _mPanelIndex    =   -1
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
      Height          =   488
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Case Serial	Case Description	Groups	Videos"
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
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   134
      Visible         =   True
      Width           =   1004
      _mPanelIndex    =   -1
   End
   Begin WebButton btnNewCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "New Case"
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
      Scope           =   2
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Case"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   153
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblInstructions
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   True
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   19
      TabStop         =   True
      Text            =   "Double-click a case to view details and manage videos"
      TextAlignment   =   0
      TextColor       =   &c66666600
      Tooltip         =   ""
      Top             =   630
      Underline       =   False
      Visible         =   True
      Width           =   1004
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblFilterBy
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
      Left            =   20
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
      TabIndex        =   20
      TabStop         =   True
      Text            =   "Filter by group:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   88
      Underline       =   False
      Visible         =   True
      Width           =   124
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popFilterGroup
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   138
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
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   21
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Visible         =   True
      Width           =   190
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblSearch
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
      Left            =   347
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
      TabIndex        =   22
      TabStop         =   True
      Text            =   "Search:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   88
      Underline       =   False
      Visible         =   True
      Width           =   65
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtSearch
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   408
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   23
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   88
      Visible         =   True
      Width           =   196
      _mPanelIndex    =   -1
   End
   Begin WebButton btnClearFilters
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Clear Filters"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   625
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
      TabIndex        =   24
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Visible         =   True
      Width           =   131
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_CaseList.opening event
		  ' *******************************************************************************
		  LoadGroupFilter
		  LoadCases
		  
		  Self.EnableBackButton = True
		  Self.EnableLogoutButton = True
		  Self.SectionTitle = "Manage Cases"
		  
		  UpdateNavigation // update shell page data
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  LoadCases
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub HandleAddCaseDialogClosed(sender As dlg_AddCase)
		  ' ******************************************************************
		  ' HandleAddCaseDialogClosed Method
		  ' ******************************************************************
		  #Pragma Unused sender
		  ' Reload cases and groups after dialog closes
		  LoadGroupFilter
		  LoadCases
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteCaseConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  ' ******************************************************************
		  ' HandleDeleteCaseConfirm Method
		  ' ******************************************************************
		  Select Case button
		  Case dialog.ActionButton
		    Var caseID As Integer = mSelectedCaseID
		    Var sql As String = "DELETE FROM cases WHERE case_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, caseID)
		      
		      ps.ExecuteSQL
		      
		      MessageBox("Case deleted successfully!")
		      mSelectedCaseID = 0  ' Clear stored ID
		      LoadGroupFilter  ' Refresh group list in case groups were removed
		      LoadCases
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting case: " + e.Message)
		    End Try
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCases()
		  ' ******************************************************************
		  ' LoadCases Method - FIXED to use case_groups instead of video_purpose
		  ' ******************************************************************
		  
		  ' Store currently selected case ID (if any)
		  Var selectedCaseID As Integer = mSelectedCaseID
		  
		  lstCases.RemoveAllRows
		  
		  Var selectedGroup As String = ""
		  If popFilterGroup.SelectedRowIndex > 0 Then
		    selectedGroup = popFilterGroup.RowTagAt(popFilterGroup.SelectedRowIndex)
		    If selectedGroup = "" Then
		      selectedGroup = popFilterGroup.RowTextAt(popFilterGroup.SelectedRowIndex)
		    End If
		  End If
		  
		  Var searchTerm As String = txtSearch.Text.Trim
		  
		  ' FIXED: Use case_groups instead of video_purpose
		  Var sql As String = _
		  "SELECT c.case_id, c.serial_number, c.case_label, c.case_groups, " + _
		  "COUNT(cv.video_id) AS video_count " + _
		  "FROM cases c " + _
		  "LEFT JOIN case_videos cv ON c.case_id = cv.case_id "
		  
		  Var whereConditions() As String
		  
		  ' Add group filter - check case_groups field
		  If selectedGroup <> "" Then
		    whereConditions.Add("(c.case_groups LIKE ? OR FIND_IN_SET(?, REPLACE(c.case_groups, ' ', '')) > 0)")
		  End If
		  
		  ' Add search filter
		  If searchTerm <> "" Then
		    whereConditions.Add("(c.serial_number LIKE ? OR c.case_label LIKE ?)")
		  End If
		  
		  ' Combine WHERE conditions
		  If whereConditions.Count > 0 Then
		    sql = sql + "WHERE " + String.FromArray(whereConditions, " AND ")
		  End If
		  
		  ' Use NUMERICAL sorting instead of alphabetical
		  sql = sql + " GROUP BY c.case_id, c.serial_number, c.case_label, c.case_groups ORDER BY CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    Var paramIndex As Integer = 0
		    
		    ' Bind group filter parameters
		    If selectedGroup <> "" Then
		      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(paramIndex, "%" + selectedGroup + "%")
		      paramIndex = paramIndex + 1
		      
		      Var cleanGroup As String = selectedGroup.ReplaceAll(" ", "")
		      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(paramIndex, cleanGroup)
		      paramIndex = paramIndex + 1
		    End If
		    
		    ' Bind search parameters
		    If searchTerm <> "" Then
		      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(paramIndex, "%" + searchTerm + "%")
		      paramIndex = paramIndex + 1
		      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(paramIndex, "%" + searchTerm + "%")
		      paramIndex = paramIndex + 1
		    End If
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    While Not rs.AfterLastRow
		      lstCases.AddRow(rs.Column("serial_number").StringValue)
		      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
		      
		      ' Display groups from case_groups field
		      Var groupsText As String = rs.Column("case_groups").StringValue
		      If groupsText.Trim = "" Then
		        groupsText = "(No groups)"
		      End If
		      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = groupsText
		      
		      ' Display video count
		      ' lstCases.CellTextAt(lstCases.LastAddedRowIndex, 3) = Str(rs.Column("video_count").IntegerValue)
		      
		      ' Center the video_count column - use CellValueAt with WebListBoxStyleRenderer
		      Var row As Integer = lstCases.LastAddedRowIndex
		      Var video_count As String = Str(rs.Column("video_count").IntegerValue)
		      Var centeredStyle As New WebStyle
		      centeredStyle.Value("text-align") = "center"
		      lstCases.CellValueAt(row, 3) = New WebListBoxStyleRenderer(centeredStyle, video_count)
		      
		      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		    
		    ' Restore selection after reload
		    If selectedCaseID > 0 Then
		      For i As Integer = 0 To lstCases.RowCount - 1
		        If lstCases.RowTagAt(i) = selectedCaseID Then
		          lstCases.SelectedRowIndex = i
		          Exit For i
		        End If
		      Next
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading cases: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadGroupFilter()
		  ' ******************************************************************
		  ' LoadGroupFilter Method - FIXED to use case_groups
		  ' ******************************************************************
		  popFilterGroup.RemoveAllRows
		  popFilterGroup.AddRow("All Groups")
		  popFilterGroup.SelectedRowIndex = 0
		  
		  ' Load unique groups from case_groups field
		  Var sql As String = "SELECT DISTINCT case_groups FROM cases WHERE case_groups IS NOT NULL AND case_groups <> '' ORDER BY case_groups"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    Var uniqueGroups() As String
		    
		    While Not rs.AfterLastRow
		      Var groupsText As String = rs.Column("case_groups").StringValue
		      
		      ' Split comma-separated groups
		      If groupsText.Trim <> "" Then
		        Var groups() As String = groupsText.Split(",")
		        For Each group As String In groups
		          Var cleanGroup As String = group.Trim
		          If cleanGroup <> "" Then
		            ' Add if not already in list
		            Var found As Boolean = False
		            For Each existing As String In uniqueGroups
		              If existing = cleanGroup Then
		                found = True
		                Exit For existing
		              End If
		            Next
		            If Not found Then
		              uniqueGroups.Add(cleanGroup)
		            End If
		          End If
		        Next
		      End If
		      
		      rs.MoveToNextRow
		    Wend
		    
		    ' Sort and add to popup
		    uniqueGroups.Sort
		    For Each group As String In uniqueGroups
		      popFilterGroup.AddRow(group)
		    Next
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading groups: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSelectedCaseID As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events lstCases
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' ******************************************************************
		  ' lstCases.SelectionChanged Event
		  ' ******************************************************************
		  #Pragma Unused rows
		  
		  ' Store selected case ID - DO NOT call LoadCases here!
		  If Me.SelectedRowIndex >= 0 Then
		    mSelectedCaseID = Me.RowTagAt(Me.SelectedRowIndex)
		  Else
		    mSelectedCaseID = 0
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row As Integer, column As Integer)
		  ' ******************************************************************
		  ' lstCases.DoublePressed Event
		  ' ******************************************************************
		  #Pragma Unused row
		  #Pragma Unused column
		  
		  If mSelectedCaseID = 0 Then Return
		  
		  Var caseDetails As New wc_CaseDetails
		  caseDetails.ContainerID = "CaseDetails"
		  caseDetails.Position = wc_Base.PositionEnum.TopLeft
		  caseDetails.CaseID = mSelectedCaseID
		  Session.Navigation.NavigateTo(caseDetails)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewCase
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnNewCase.Pressed Event
		  ' ******************************************************************
		  Var dlg As New dlg_AddCase
		  AddHandler dlg.Dismissed, AddressOf HandleAddCaseDialogClosed
		  dlg.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteCase
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnDeleteCase.Pressed Event
		  ' ******************************************************************
		  If mSelectedCaseID = 0 Then
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
	#tag EndEvent
#tag EndEvents
#tag Events popFilterGroup
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  ' ******************************************************************
		  ' popFilterGroup.SelectionChanged Event
		  ' ******************************************************************
		  #Pragma Unused item
		  LoadCases
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtSearch
	#tag Event
		Sub TextChanged()
		  ' ******************************************************************
		  ' txtSearch.TextChanged Event
		  ' Real-time filtering as user types
		  ' ******************************************************************
		  LoadCases
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClearFilters
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnClearFilters.Pressed Event
		  ' ******************************************************************
		  popFilterGroup.SelectedRowIndex = 0
		  txtSearch.Text = ""
		  LoadCases
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
