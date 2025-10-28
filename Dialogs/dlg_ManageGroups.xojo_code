#tag WebDialog
Begin WebDialog dlg_ManageGroups
   Backdrop        =   0
   CloseButtonVisible=   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   FullScreen      =   False
   HasBackdrop     =   True
   Height          =   500
   HelpTag         =   ""
   Index           =   -2147483648
   Indicator       =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MacProcID       =   0
   MinimumHeight   =   500
   MinimumWidth    =   500
   PanelIndex      =   0
   Resizeable      =   False
   TabIndex        =   0
   Title           =   "Manage Groups"
   Type            =   0
   Visible         =   True
   Width           =   600
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
      Indicator       =   0
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
      Scope           =   0
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
      Hint            =   "Type new group name and press Enter..."
      Index           =   -2147483648
      Indicator       =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
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
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   490
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
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
      Indicator       =   0
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
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Or select from existing groups:"
      TextAlignment   =   0
      TextColor       =   &c666666FF
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
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   0
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
      Indicator       =   0
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
      Scope           =   0
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
      NoRowsMessage   =   "No groups assigned"
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
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
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   416
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDone
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Done"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   490
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
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   416
      Visible         =   True
      Width           =   90
      _mPanelIndex    =   -1
   End
End
#tag EndWebDialog

#tag WindowCode
	#tag Property, Flags = &h0
		AssignedGroups() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		GroupsChanged As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events txtNewGroup
	#tag Event
		Function KeyDown(key As String) As Boolean
		  ' ******************************************************************
		  ' txtNewGroup.KeyDown - Press Enter to add group
		  ' ******************************************************************
		  If key = &u0D Then  ' Enter key
		    If Me.Text.Trim <> "" Then
		      btnAddGroup.Pressed
		      Return True
		    End If
		  End If
		  
		  Return False
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnAddGroup
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnAddGroup.Pressed - Add group from text field or popup
		  ' ******************************************************************
		  Var selectedGroup As String
		  
		  ' Priority 1: Check text field
		  If txtNewGroup.Text.Trim <> "" Then
		    selectedGroup = txtNewGroup.Text.Trim
		    
		    ' Validate
		    If selectedGroup.Length < 2 Then
		      MessageBox("Group name must be at least 2 characters")
		      Return
		    End If
		    
		  ElseIf popAvailableGroups.SelectedRowIndex >= 0 Then
		    ' Priority 2: Use popup selection
		    selectedGroup = popAvailableGroups.RowTextAt(popAvailableGroups.SelectedRowIndex)
		    
		  Else
		    MessageBox("Please enter a group name or select from the list")
		    Return
		  End If
		  
		  ' Check if already assigned
		  For i As Integer = 0 To lstAssignedGroups.RowCount - 1
		    If lstAssignedGroups.CellTextAt(i, 0) = selectedGroup Then
		      MessageBox("This group is already assigned to this case")
		      Return
		    End If
		  Next
		  
		  ' Add to assigned list
		  lstAssignedGroups.AddRow(selectedGroup)
		  AssignedGroups.Add(selectedGroup)
		  GroupsChanged = True
		  
		  ' If new group, add to popup for future use
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
		  
		  ' Remove from list
		  lstAssignedGroups.RemoveRowAt(selectedRow)
		  
		  ' Remove from array
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
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
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
		Name="GroupsChanged"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
