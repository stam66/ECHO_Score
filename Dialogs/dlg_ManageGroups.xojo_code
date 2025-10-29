#tag WebPage
Begin WebDialog dlg_ManageGroups
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   500
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
   Width           =   600
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblInstruction
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
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
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Enter a new group name or select from existing groups:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   560
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtNewGroup
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
      Left            =   20
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
      TabIndex        =   1
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   60
      Visible         =   True
      Width           =   460
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAddGroup
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   490
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Visible         =   True
      Width           =   90
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblOrSelect
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   25
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   True
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Or select from existing groups:"
      TextAlignment   =   0
      TextColor       =   &c66666600
      Tooltip         =   ""
      Top             =   108
      Underline       =   False
      Visible         =   True
      Width           =   240
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popAvailableGroups
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   20
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
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   138
      Visible         =   True
      Width           =   560
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblAssigned
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   25
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
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Currently Assigned Groups:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   186
      Underline       =   False
      Visible         =   True
      Width           =   240
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstAssignedGroups
      AllowRowReordering=   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   28
      Enabled         =   True
      GridLineStyle   =   1
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   190
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
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
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   216
      Visible         =   True
      Width           =   560
      _mPanelIndex    =   -1
   End
   Begin WebButton btnRemoveGroup
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Remove Selected"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   416
      Visible         =   True
      Width           =   163
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDone
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Done"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   490
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
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   416
      Visible         =   True
      Width           =   90
      _mPanelIndex    =   -1
   End
   Begin WebButton btnManageAvailable
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Edit Groups..."
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   191
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   416
      Visible         =   True
      Width           =   163
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ReloadAvailableGroups()
		  ' Save current selection
		  Var currentSelection As String = ""
		  If popAvailableGroups.SelectedRowIndex >= 0 Then
		    currentSelection = popAvailableGroups.RowTextAt(popAvailableGroups.SelectedRowIndex)
		  End If
		  
		  ' Reload from database
		  popAvailableGroups.RemoveAllRows
		  
		  Var sql As String = "SELECT group_name FROM available_groups WHERE is_active = TRUE ORDER BY display_order, group_name"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    
		    While Not rs.AfterLastRow
		      popAvailableGroups.AddRow(rs.Column("group_name").StringValue)
		      rs.MoveToNextRow
		    Wend
		    
		    ' Restore selection if possible
		    If currentSelection <> "" Then
		      For i As Integer = 0 To popAvailableGroups.RowCount - 1
		        If popAvailableGroups.RowTextAt(i) = currentSelection Then
		          popAvailableGroups.SelectedRowIndex = i
		          Exit For i
		        End If
		      Next
		    End If
		    
		    If popAvailableGroups.SelectedRowIndex < 0 And popAvailableGroups.RowCount > 0 Then
		      popAvailableGroups.SelectedRowIndex = 0
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error reloading available groups: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AssignedGroups() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		GroupsChanged As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events txtNewGroup
	#tag Event
		Sub TextChanged()
		  ' Enable Add button only if text field has content
		  If Me.Text.Trim <> "" Then
		    btnAddGroup.Enabled = True
		  Else
		    ' btnAddGroup.Enabled = False  ' Optional: disable when empty
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddGroup
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnAddGroup.Pressed - Add group from text field or popup
		  ' ******************************************************************
		  
		  Var selectedGroup As String
		  
		  If txtNewGroup.Text.Trim <> "" Then
		    selectedGroup = txtNewGroup.Text.Trim
		    If selectedGroup.Length < 2 Then
		      MessageBox("Group name must be at least 2 characters")
		      Return
		    End If
		  ElseIf popAvailableGroups.SelectedRowIndex >= 0 Then
		    selectedGroup = popAvailableGroups.RowTextAt(popAvailableGroups.SelectedRowIndex)
		  Else
		    MessageBox("Please enter a group name or select from the list")
		    Return
		  End If
		  
		  For i As Integer = 0 To lstAssignedGroups.RowCount - 1
		    If lstAssignedGroups.CellTextAt(i, 0) = selectedGroup Then
		      MessageBox("This group is already assigned to this case")
		      Return
		    End If
		  Next
		  
		  lstAssignedGroups.AddRow(selectedGroup)
		  AssignedGroups.Add(selectedGroup)
		  GroupsChanged = True
		  
		  If txtNewGroup.Text.Trim <> "" Then
		    Var found As Boolean = False
		    For i As Integer = 0 To popAvailableGroups.RowCount - 1
		      If popAvailableGroups.RowTextAt(i) = selectedGroup Then
		        found = True
		        Exit For i
		      End If
		    Next
		    If Not found Then
		      popAvailableGroups.AddRow(selectedGroup)
		    End If
		    txtNewGroup.Text = ""
		    txtNewGroup.SetFocus
		  End If
		  
		  System.DebugLog("Group added: " + selectedGroup)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRemoveGroup
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnRemoveGroup.Pressed - Remove selected group
		  ' ******************************************************************
		  
		  If lstAssignedGroups.SelectedRowIndex < 0 Then
		    MessageBox("Please select a group to remove")
		    Return
		  End If
		  
		  Var selectedRow As Integer = lstAssignedGroups.SelectedRowIndex
		  Var groupName As String = lstAssignedGroups.CellTextAt(selectedRow, 0)
		  
		  lstAssignedGroups.RemoveRowAt(selectedRow)
		  
		  For i As Integer = AssignedGroups.LastIndex DownTo 0
		    If AssignedGroups(i) = groupName Then
		      AssignedGroups.RemoveAt(i)
		      Exit For i
		    End If
		  Next
		  
		  GroupsChanged = True
		  System.DebugLog("Group removed: " + groupName)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDone
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnDone.Pressed - Close dialog
		  ' ******************************************************************
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnManageAvailable
	#tag Event
		Sub Pressed()
		  Var adminDlg As New dlg_ManageAvailableGroups
		  adminDlg.Show
		  
		  ' When admin dialog closes, refresh our popup if groups were modified
		  If adminDlg.GroupsModified Then
		    ' Reload the available groups popup
		    ReloadAvailableGroups
		  End If
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
		Name="GroupsChanged"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
