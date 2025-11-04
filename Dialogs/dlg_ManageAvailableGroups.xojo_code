#tag WebPage
Begin WebDialog dlg_ManageAvailableGroups
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   550
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
   Width           =   820
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
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
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Manage the master list of available groups. These groups appear in the selection menu."
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   780
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstAvailableGroups
      AllowRowReordering=   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   28
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   380
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Group Name	Category	Order	Active"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   60
      Visible         =   True
      Width           =   583
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblGroupName
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   611
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
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Group Name:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   60
      Underline       =   False
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtGroupName
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   "Enter group name..."
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   611
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
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   85
      Visible         =   True
      Width           =   189
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblCategory
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   611
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
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Category:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   133
      Underline       =   False
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popCategory
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Year-Quarter\nSpecialty\nCustom\nOther"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   611
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   0
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   158
      Visible         =   True
      Width           =   189
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblOrder
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   611
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
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Dsiplay Order:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   206
      Underline       =   False
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtOrder
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   3
      Height          =   38
      Hint            =   "0-9999"
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   611
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
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   231
      Visible         =   True
      Width           =   189
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkActive
      Caption         =   "Active (visible to users)"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   611
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   279
      Value           =   False
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAdd
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add New"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   611
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
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebButton btnUpdate
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Update Selected"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   611
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   366
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDelete
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Selected"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   611
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   412
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblStatus
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
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
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Text            =   "Display Order:"
      TextAlignment   =   0
      TextColor       =   &c66666600
      Tooltip         =   ""
      Top             =   450
      Underline       =   False
      Visible         =   True
      Width           =   500
      _mPanelIndex    =   -1
   End
   Begin WebButton btnClose
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Close"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   700
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   492
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' Initialise dialog
		  LoadAvailableGroupsList
		  ClearForm
		  
		  
		  ' Configure list columns
		  lstAvailableGroups.ColumnTypeAt(0) = WebListBox.CellTypes.TextField  ' Group Name
		  lstAvailableGroups.ColumnTypeAt(1) = WebListBox.CellTypes.TextField  ' Category
		  lstAvailableGroups.ColumnTypeAt(2) = WebListBox.CellTypes.TextField  ' Order
		  lstAvailableGroups.ColumnTypeAt(3) = WebListBox.CellTypes.CheckBox   ' Active
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearForm()
		  txtGroupName.Text = ""
		  popCategory.SelectedRowIndex = 0
		  txtOrder.Text = "0"
		  chkActive.Value = True
		  SelectedGroupID = -1
		  btnUpdate.Enabled = False
		  btnDelete.Enabled = False
		  lstAvailableGroups.SelectedRowIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  #Pragma Unused dialog
		  
		  ' Handle confirmation when group is not in use
		  If button.Caption = "Delete" Then
		    PerformDelete
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteInUseChoice(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  #Pragma Unused dialog
		  
		  ' Handle choice when group is in use
		  Var groupName As String = txtGroupName.Text.Trim
		  
		  If button.Caption = "Deactivate" Then
		    ' Soft delete - just deactivate
		    Var updateSQL As String = "UPDATE available_groups SET is_active = FALSE WHERE group_id = ?"
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, SelectedGroupID)
		      ps.ExecuteSQL
		      
		      GroupsModified = True
		      lblStatus.Text = "Group deactivated: " + groupName
		      LoadAvailableGroupsList
		      ClearForm
		      
		    Catch e As DatabaseException
		      MessageBox("Error deactivating group: " + e.Message)
		    End Try
		    
		  ElseIf button.Caption = "Force Delete" Then
		    ' Hard delete even though in use
		    PerformDelete
		    
		    ' Else Cancel - do nothing
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadAvailableGroupsList()
		  lstAvailableGroups.RemoveAllRows
		  
		  Var sql As String = "SELECT group_id, group_name, group_category, display_order, is_active FROM available_groups ORDER BY display_order, group_name"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    
		    While Not rs.AfterLastRow
		      Var groupID As Integer = rs.Column("group_id").IntegerValue
		      Var groupName As String = rs.Column("group_name").StringValue
		      Var category As String = rs.Column("group_category").StringValue
		      Var displayOrder As Integer = rs.Column("display_order").IntegerValue
		      Var isActive As Boolean = rs.Column("is_active").BooleanValue
		      
		      ' Add row with text columns
		      lstAvailableGroups.AddRow(groupName, category, Str(displayOrder))
		      
		      ' Store ID in row tag
		      Var rowIndex As Integer = lstAvailableGroups.LastAddedRowIndex
		      lstAvailableGroups.RowTagAt(rowIndex) = groupID
		      
		      ' Set checkbox value using the CORRECT method
		      lstAvailableGroups.CellCheckboxValueAt(rowIndex, 3) = isActive
		      
		      rs.MoveToNextRow
		    Wend
		    
		    lblStatus.Text = "Loaded " + Str(lstAvailableGroups.RowCount) + " groups"
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading groups: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformDelete()
		  ' Actually delete the group from database
		  Var groupName As String = txtGroupName.Text.Trim
		  Var sql As String = "DELETE FROM available_groups WHERE group_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, SelectedGroupID)
		    ps.ExecuteSQL
		    
		    GroupsModified = True
		    lblStatus.Text = "Group deleted: " + groupName
		    LoadAvailableGroupsList
		    ClearForm
		    
		  Catch e As DatabaseException
		    MessageBox("Error deleting group: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		GroupsModified As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentDialog As dlg_ManageGroups
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedGroupID As Integer = -1
	#tag EndProperty


#tag EndWindowCode

#tag Events lstAvailableGroups
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  #Pragma Unused rows
		  
		  If Me.SelectedRowIndex >= 0 Then
		    ' Load selected group into form
		    SelectedGroupID = Me.RowTagAt(Me.SelectedRowIndex)
		    txtGroupName.Text = Me.CellTextAt(Me.SelectedRowIndex, 0)
		    
		    ' Set category popup
		    Var category As String = Me.CellTextAt(Me.SelectedRowIndex, 1)
		    For i As Integer = 0 To popCategory.RowCount - 1
		      If popCategory.RowTextAt(i) = category Then
		        popCategory.SelectedRowIndex = i
		        Exit For i
		      End If
		    Next
		    
		    txtOrder.Text = Me.CellTextAt(Me.SelectedRowIndex, 2)
		    chkActive.Value = Me.CellValueAt(Me.SelectedRowIndex, 3)
		    
		    ' Enable edit/delete buttons
		    btnUpdate.Enabled = True
		    btnDelete.Enabled = True
		    lblStatus.Text = "Selected: " + Me.CellTextAt(Me.SelectedRowIndex, 0)
		  Else
		    ClearForm
		    btnUpdate.Enabled = False
		    btnDelete.Enabled = False
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer, value As Variant)
		  Var groupID As Integer = Me.RowTagAt(row)
		  
		  ' Handle checkbox (column 3)
		  If column = 3 Then
		    Var isActive As Boolean = value.BooleanValue
		    
		    ' Update database
		    Var sql As String = "UPDATE available_groups SET is_active = ? WHERE group_id = ?"
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.Bind(0, If(isActive, 1, 0))
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(1, groupID)
		      ps.ExecuteSQL
		      
		      GroupsModified = True
		      lblStatus.Text = "Group " + If(isActive, "activated", "deactivated")
		      
		      ' Notify parent dialog
		      If ParentDialog <> Nil Then
		        ParentDialog.ReloadAvailableGroups
		      End If
		      
		    Catch e As DatabaseException
		      MessageBox("Error updating active status: " + e.Message)
		      Me.CellCheckboxValueAt(row, column) = Not isActive
		    End Try
		    
		    ' Handle text fields (columns 0, 1, 2)
		  ElseIf column >= 0 And column <= 2 Then
		    Var newValue As String = value.StringValue.Trim
		    
		    ' Validate group name
		    If column = 0 And newValue = "" Then
		      MessageBox("Group name cannot be empty")
		      LoadAvailableGroupsList  ' Reload to revert change
		      Return
		    End If
		    
		    ' Validate order
		    If column = 2 Then
		      Var orderValue As Integer = Val(newValue)
		      If orderValue < 0 Then orderValue = 0
		      newValue = Str(orderValue)
		    End If
		    
		    ' Update database
		    Var sql As String
		    Select Case column
		    Case 0
		      sql = "UPDATE available_groups SET group_name = ? WHERE group_id = ?"
		    Case 1
		      sql = "UPDATE available_groups SET group_category = ? WHERE group_id = ?"
		    Case 2
		      sql = "UPDATE available_groups SET display_order = ? WHERE group_id = ?"
		    End Select
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      
		      If column = 2 Then
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.Bind(0, Val(newValue))
		      Else
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.Bind(0, newValue)
		      End If
		      
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(1, groupID)
		      ps.ExecuteSQL
		      
		      GroupsModified = True
		      lblStatus.Text = "Group updated"
		      
		      ' Update the cell display
		      Me.CellTextAt(row, column) = newValue
		      
		      ' Notify parent dialog to reload popup
		      If ParentDialog <> Nil Then
		        ParentDialog.ReloadAvailableGroups
		      End If
		      
		      ' Reload list to reflect new sort order if display_order changed
		      If column = 2 Then
		        LoadAvailableGroupsList
		      End If
		      
		    Catch e As DatabaseException
		      MessageBox("Error updating group: " + e.Message)
		      LoadAvailableGroupsList  ' Reload to revert change
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAdd
	#tag Event
		Sub Pressed()
		  ' Validate input
		  If txtGroupName.Text.Trim = "" Then
		    MessageBox("Please enter a group name")
		    txtGroupName.SetFocus
		    Return
		  End If
		  
		  Var groupName As String = txtGroupName.Text.Trim
		  Var category As String = ""
		  If popCategory.SelectedRowIndex >= 0 Then
		    category = popCategory.RowTextAt(popCategory.SelectedRowIndex)
		  End If
		  
		  Var displayOrder As Integer = Val(txtOrder.Text)
		  If displayOrder < 0 Then displayOrder = 0
		  
		  ' Check for duplicate
		  Var sql As String = "SELECT COUNT(*) FROM available_groups WHERE group_name = ?"
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, groupName)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs.ColumnAt(0).IntegerValue > 0 Then
		      MessageBox("A group with this name already exists")
		      Return
		    End If
		  Catch e As DatabaseException
		    MessageBox("Error checking for duplicate: " + e.Message)
		    Return
		  End Try
		  
		  ' Insert new group
		  sql = "INSERT INTO available_groups (group_name, group_category, display_order, is_active, created_by) VALUES (?, ?, ?, ?, ?)"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, groupName)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(1, category)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(2, displayOrder)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(3, If(chkActive.Value, 1, 0))
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(4, Session.CurrentUserID)  ' Or use appropriate user ID
		    
		    ps.ExecuteSQL
		    
		    GroupsModified = True
		    lblStatus.Text = "Group added: " + groupName
		    LoadAvailableGroupsList
		    ClearForm
		    
		  Catch e As DatabaseException
		    MessageBox("Error adding group: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpdate
	#tag Event
		Sub Pressed()
		  If SelectedGroupID < 0 Then
		    MessageBox("Please select a group to update")
		    Return
		  End If
		  
		  ' Validate input
		  If txtGroupName.Text.Trim = "" Then
		    MessageBox("Please enter a group name")
		    txtGroupName.SetFocus
		    Return
		  End If
		  
		  Var groupName As String = txtGroupName.Text.Trim
		  Var category As String = ""
		  If popCategory.SelectedRowIndex >= 0 Then
		    category = popCategory.RowTextAt(popCategory.SelectedRowIndex)
		  End If
		  
		  Var displayOrder As Integer = Val(txtOrder.Text)
		  If displayOrder < 0 Then displayOrder = 0
		  
		  ' Update group
		  Var sql As String = "UPDATE available_groups SET group_name = ?, group_category = ?, display_order = ?, is_active = ? WHERE group_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, groupName)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(1, category)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(2, displayOrder)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(3, If(chkActive.Value, 1, 0))
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(4, SelectedGroupID)
		    
		    ps.ExecuteSQL
		    
		    GroupsModified = True
		    lblStatus.Text = "Group updated: " + groupName
		    LoadAvailableGroupsList
		    
		  Catch e As DatabaseException
		    MessageBox("Error updating group: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDelete
	#tag Event
		Sub Pressed()
		  If SelectedGroupID < 0 Then
		    MessageBox("Please select a group to delete")
		    Return
		  End If
		  
		  Var groupName As String = txtGroupName.Text.Trim
		  
		  ' Check if group is in use
		  Var checkSQL As String = "SELECT COUNT(*) as use_count FROM cases WHERE FIND_IN_SET(?, REPLACE(case_groups, ', ', ',')) > 0"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(checkSQL)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, groupName)
		    Var rs As RowSet = ps.SelectSQL
		    
		    Var useCount As Integer = rs.ColumnAt(0).IntegerValue
		    
		    If useCount > 0 Then
		      ' Group is in use - offer to deactivate instead
		      Var d As New WebMessageDialog
		      d.Title = "Group In Use"
		      d.Message = "This group is currently assigned to " + Str(useCount) + " case(s)." + EndOfLine + EndOfLine + "Do you want to deactivate it instead of deleting?"
		      d.ActionButton.Caption = "Deactivate"
		      d.CancelButton.Caption = "Cancel"
		      d.CancelButton.Visible = True
		      d.AlternateActionButton.Caption = "Force Delete"
		      d.AlternateActionButton.Visible = True
		      
		      AddHandler d.ButtonPressed, AddressOf HandleDeleteInUseChoice
		      d.Show
		      
		    Else
		      ' Group not in use - simple confirmation
		      Var d As New WebMessageDialog
		      d.Title = "Confirm Delete"
		      d.Message = "Are you sure you want to permanently delete '" + groupName + "'?"
		      d.ActionButton.Caption = "Delete"
		      d.CancelButton.Caption = "Cancel"
		      d.CancelButton.Visible = True
		      
		      AddHandler d.ButtonPressed, AddressOf HandleDeleteConfirm
		      d.Show
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error checking group usage: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Pressed()
		  If GroupsModified And ParentDialog <> Nil Then
		    ParentDialog.ReloadAvailableGroups
		  End If
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
