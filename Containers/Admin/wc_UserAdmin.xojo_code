#tag WebContainerControl
Begin wc_base wc_UserAdmin
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
   Begin WebListBox lstUsers
      AllowRowReordering=   False
      ColumnCount     =   6
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   563
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Name	Email	Username	Admin	Group	Active"
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
      Top             =   79
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblName
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
      Left            =   774
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
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Full Name"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtName
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
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
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
      Top             =   105
      Visible         =   True
      Width           =   249
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblEmail
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
      Left            =   774
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
      Text            =   "Email"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   151
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtEmail
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
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   190
      Visible         =   True
      Width           =   249
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblUsername
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
      Left            =   774
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
      Text            =   "Username"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   236
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtUsername
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
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
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
      Top             =   275
      Visible         =   True
      Width           =   249
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblPassword
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
      Left            =   774
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
      Text            =   "Password"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   321
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtPassword
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   9
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   360
      Visible         =   True
      Width           =   249
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkIsAdmin
      Caption         =   "Admin User"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   420
      Value           =   False
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAddUser
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "New User"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   8
      Left            =   750
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
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   143
      _mPanelIndex    =   -1
   End
   Begin WebButton btnUpdateUser
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Update User"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   604
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteUser
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete User"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   907
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   604
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblUserGroup
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
      Left            =   774
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
      TabIndex        =   15
      TabStop         =   True
      Text            =   "Group"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   476
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebCombobox cmbUserGroup
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FilteringMode   =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   774
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   0
      SelectedRowIndex=   -1
      SelectedRowText =   ""
      TabIndex        =   16
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   515
      Visible         =   True
      Width           =   202
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblDisplayedMessage
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   14.0
      Height          =   31
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   19
      TabStop         =   True
      Text            =   "Message"
      TextAlignment   =   0
      TextColor       =   &c0096FF00
      Tooltip         =   ""
      Top             =   657
      Underline       =   False
      Visible         =   False
      Width           =   702
      _mPanelIndex    =   -1
   End
   Begin WebButton btnSaveNewUser
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save New User"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   8
      Left            =   901
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
      TabIndex        =   20
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   143
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popGroupFilter
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
      Scope           =   0
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   21
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   272
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkIsActive
      Caption         =   "Active User"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   907
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   22
      TabStop         =   True
      Tooltip         =   ""
      Top             =   420
      Value           =   False
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnManageGroups
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "+"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      Indicator       =   0
      Left            =   984
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   23
      TabStop         =   True
      Tooltip         =   ""
      Top             =   515
      Visible         =   True
      Width           =   40
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_UserAdmin.opening event
		  ' *******************************************************************************
		  LoadUsers("")
		  LoadUserGroups
		  popGroupFilter.SelectedRowIndex = 0
		  LoadUsers(popGroupFilter.RowTextAt(0))
		  ClearFields
		  
		  Self.EnableBackButton = True
		  Self.EnableLogoutButton = True
		  Self.SectionTitle = "Manage Users"
		  
		  UpdateNavigation // update shell page data
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' Save the currently selected group NAME (not index)
		  Var selectedGroupName As String = ""
		  
		  If popGroupFilter.SelectedRowIndex >= 0 Then
		    selectedGroupName = popGroupFilter.RowTextAt(popGroupFilter.SelectedRowIndex)
		  End If
		  
		  ' Refresh the groups list
		  LoadUserGroups()
		  
		  ' Restore the selection by finding the group name
		  If selectedGroupName <> "" Then
		    For i As Integer = 0 To popGroupFilter.RowCount - 1
		      If popGroupFilter.RowTextAt(i) = selectedGroupName Then
		        popGroupFilter.SelectedRowIndex = i
		        
		        ' Manually reload users for this group
		        If selectedGroupName = "All Groups" Then
		          LoadUsers("")
		        Else
		          LoadUsers(selectedGroupName)
		        End If
		        
		        Exit For i
		      End If
		    Next
		  Else
		    ' No selection - default to "All Groups"
		    popGroupFilter.SelectedRowIndex = 0
		    LoadUsers("")
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearFields()
		  ' *******************************************************************************
		  ' ClearFields Method
		  ' *******************************************************************************
		  txtName.Text = ""
		  txtEmail.Text = ""
		  txtUsername.Text = ""
		  txtPassword.Text = ""
		  chkIsAdmin.Value = False
		  cmbUserGroup.SelectedRowIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserName() As String
		  var username as string
		  var words() as string = txtName.Text.Trim.Split(" ")
		  
		  if words.Count  = 0 then 
		    return ""
		  end If
		  
		  if words.Count = 1 then 
		    username = words(0)
		  else
		    username = words(0).Left(1).Uppercase + words(words.LastIndex).Titlecase
		  end if
		  
		  var x as integer = 1
		  var i as integer = 0
		  While x = 1
		    var sql as string = "SELECT COUNT(username) as UserNameCount from users where username = ?" 
		    var ps as MySQLPreparedStatement =  Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, username)
		    var rs as rowset = ps.SelectSQL
		    if rs <> nil then
		      if rs.Column("UserNameCount").IntegerValue > 0 then
		        i = i+1
		        username = username + i.ToString
		      else
		        return username
		      end if
		    else 
		      return username
		    end If
		  Wend
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteUserConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  ' *******************************************************************************
		  ' HandleDeleteUserConfirm Method
		  '   Parameters: dialog As WebMessageDialog, button As WebMessageDialogButton
		  ' *******************************************************************************
		  Select Case button
		  Case dialog.ActionButton
		    Var userID As Integer = lstUsers.RowTagAt(lstUsers.SelectedRowIndex)
		    Var sql As String = "DELETE FROM users WHERE user_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, userID)
		      
		      ps.ExecuteSQL
		      
		      session.DisplayMessage("User deleted successfully!", self.lblDisplayedMessage)
		      ClearFields
		      LoadUsers("")
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting user: " + e.Message)
		    End Try
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleGroupsChanged(sender As dlg_ManageAvailableGroups)
		  ' Save current selection
		  Var selectedGroupName As String = ""
		  
		  If popGroupFilter.SelectedRowIndex >= 0 Then
		    selectedGroupName = popGroupFilter.RowTextAt(popGroupFilter.SelectedRowIndex)
		  End If
		  
		  ' Refresh groups
		  LoadUserGroups()
		  
		  ' Restore selection
		  If selectedGroupName <> "" Then
		    For i As Integer = 0 To popGroupFilter.RowCount - 1
		      If popGroupFilter.RowTextAt(i) = selectedGroupName Then
		        popGroupFilter.SelectedRowIndex = i
		        
		        If selectedGroupName = "All Groups" Then
		          LoadUsers("")
		        Else
		          LoadUsers(selectedGroupName)
		        End If
		        
		        Exit For i
		      End If
		    Next
		  Else
		    ' Default to "All Groups"
		    popGroupFilter.SelectedRowIndex = 0
		    LoadUsers("")
		  End If
		  
		  System.DebugLog("Groups refreshed after change")
		  
		  ' You can use 'sender' if you need to access the dialog that raised the event
		  ' But in this case we don't need it
		  #Pragma Unused sender
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadUserGroups()
		  ' *******************************************************************************
		  ' LoadUserGroups Method
		  ' Load groups from available_groups table, not just from assigned users
		  ' *******************************************************************************
		  cmbUserGroup.RemoveAllRows
		  popGroupFilter.RemoveAllRows
		  
		  ' Add "All" as first option in filter
		  popGroupFilter.AddRow("All Groups")
		  
		  ' Load groups from available_groups table
		  ' Var sql As String = "SELECT group_name FROM available_groups ORDER BY group_name"
		  Var sql As String = "SELECT group_name FROM available_groups ORDER BY created_date DESC"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    
		    While Not rs.AfterLastRow
		      Var groupName As String = rs.Column("group_name").StringValue
		      If groupName.Trim <> "" Then
		        ' Add to cmbUserGroup
		        cmbUserGroup.AddRow(groupName)
		        
		        ' Add to popGroupFilter
		        popGroupFilter.AddRow(groupName)
		      End If
		      
		      rs.MoveToNextRow
		    Wend
		    
		    System.DebugLog("Loaded " + Str(cmbUserGroup.RowCount) + " groups from available_groups table")
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading groups: " + e.Message)
		  End Try
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadUsers(filterGroup as String)
		  ' *******************************************************************************
		  ' LoadUsers Method
		  ' *******************************************************************************
		  lstUsers.RemoveAllRows
		  
		  // ---- Choose base colours based on dark / light mode -----------------
		  Var darkMode As Boolean = session.IsDarkMode
		  Var activeStyle   As New WebStyle
		  Var inactiveStyle As New WebStyle
		  
		  activeStyle.ForegroundColor = if(darkMode, color.White, color.Black)
		  inactiveStyle.ForegroundColor = color.LightGray
		  
		  Var sql As String
		  If filterGroup = "" Then
		    sql = "SELECT user_id, full_name, email, username, is_admin, is_active, user_group FROM users ORDER BY full_name"
		  Else
		    sql = "SELECT user_id, full_name, email, username, is_admin, is_active, user_group FROM users WHERE user_group = ? ORDER BY full_name"
		  End If
		  
		  Try
		    Var rs As RowSet
		    If filterGroup = "" Then
		      rs = Session.DB.SelectSQL(sql)
		    Else
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(0, filterGroup)
		      rs = ps.SelectSQL
		    End If
		    
		    While Not rs.AfterLastRow
		      ' Add empty row first
		      lstUsers.AddRow()  // CORRECT: No parameters!
		      Var rowIdx As Integer = lstUsers.LastAddedRowIndex
		      
		      ' Read data
		      Var fullName As String = rs.Column("full_name").StringValue
		      Var email As String = rs.Column("email").StringValue
		      Var username As String = rs.Column("username").StringValue
		      Var isAdmin As Boolean = rs.Column("is_admin").BooleanValue
		      Var isActive As Boolean = rs.Column("is_active").BooleanValue
		      Var userGroup As String = rs.Column("user_group").StringValue
		      Var userId As Integer = rs.Column("user_id").IntegerValue
		      
		      ' Store primary key
		      lstUsers.RowTagAt(rowIdx) = userId
		      
		      ' Choose style
		      Var cellStyle As WebStyle = If(isActive, activeStyle, inactiveStyle)
		      
		      ' Apply styled text to every column
		      lstUsers.CellValueAt(rowIdx, 0) = New WebListBoxStyleRenderer(cellStyle, fullName)
		      lstUsers.CellValueAt(rowIdx, 1) = New WebListBoxStyleRenderer(cellStyle, email)
		      lstUsers.CellValueAt(rowIdx, 2) = New WebListBoxStyleRenderer(cellStyle, username)
		      lstUsers.CellValueAt(rowIdx, 3) = New WebListBoxStyleRenderer(cellStyle, If(isAdmin, "Yes", "No"))
		      lstUsers.CellValueAt(rowIdx, 4) = New WebListBoxStyleRenderer(cellStyle, userGroup)
		      lstUsers.CellValueAt(rowIdx, 5) = New WebListBoxStyleRenderer(cellStyle, If(isActive, "Active", "Inactive"))
		      
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading users: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSelectedUserID As Integer = 0
	#tag EndProperty


#tag EndWindowCode

#tag Events lstUsers
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' *******************************************************************************
		  ' lstUsers.SelectionChanged Event
		  ' *******************************************************************************
		  #Pragma Unused rows
		  
		  If Me.SelectedRowIndex < 0 Then
		    mSelectedUserID = 0
		    ClearFields()
		    Return
		  End If
		  
		  btnSaveNewUser.Enabled = False
		  btnUpdateUser.Enabled = True
		  btnDeleteUser.Enabled = True
		  
		  Var userID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
		  mSelectedUserID = userID  ' Store for later use
		  
		  Var sql As String = "SELECT full_name, email, username, is_admin, is_active, user_group FROM users WHERE user_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, userID)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      txtName.Text = rs.Column("full_name").StringValue
		      txtEmail.Text = rs.Column("email").StringValue
		      txtUsername.Text = rs.Column("username").StringValue
		      txtPassword.Text = ""
		      chkIsAdmin.Value = rs.Column("is_admin").BooleanValue
		      chkIsActive.Value = rs.Column("is_active").BooleanValue 
		      cmbUserGroup.Text = rs.Column("user_group").StringValue
		    End If
		  Catch e As DatabaseException
		    MessageBox("Error loading user: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtName
	#tag Event
		Sub TextChanged()
		  txtUsername.Text = GetUserName
		  
		  
		  btnSaveNewUser.Enabled = (lstUsers.SelectedRowIndex = -1 and txtName.Text.Trim <> "" and txtEmail.Text.Trim <> ""  )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtEmail
	#tag Event
		Sub TextChanged()
		  btnSaveNewUser.Enabled = (lstUsers.SelectedRowIndex = -1 and txtName.Text.Trim <> "" and txtEmail.Text.Trim <> ""  )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtUsername
	#tag Event
		Sub TextChanged()
		  btnSaveNewUser.Enabled = (lstUsers.SelectedRowIndex = -1 and txtName.Text.Trim <> "" and txtEmail.Text.Trim <> ""  )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnAddUser.Pressed Event
		  ' *******************************************************************************
		  lstUsers.SelectedRowIndex = -1
		  txtName.SetFocus
		  btnUpdateUser.Enabled = False
		  btnDeleteUser.Enabled = False
		  chkIsActive.Value = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpdateUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnUpdateUser.Pressed Event
		  ' *******************************************************************************
		  ' Check if a user is selected
		  If mSelectedUserID = 0 Then
		    ' MessageBox("Please select a user to update")
		    session.DisplayMessage("Please select a user to update.", self.lblDisplayedMessage)
		    Return
		  End If
		  
		  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Then
		    session.DisplayMessage("Please fill name, email, and username fields", self.lblDisplayedMessage)
		    Return
		  End If
		  
		  ' Check if username is already taken by ANOTHER user
		  Var checkUsernameSQL As String = "SELECT user_id FROM users WHERE username = ? AND user_id <> ?"
		  
		  Try
		    Var checkPS As MySQLPreparedStatement = Session.DB.Prepare(checkUsernameSQL)
		    checkPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    checkPS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    checkPS.Bind(0, txtUsername.Text.Trim)
		    checkPS.Bind(1, mSelectedUserID)
		    
		    Var checkRS As RowSet = checkPS.SelectSQL
		    
		    If checkRS <> Nil And Not checkRS.AfterLastRow Then
		      MessageBox("Username '" + txtUsername.Text.Trim + "' is already taken by another user.")
		      Return
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error checking username: " + e.Message)
		    Return
		  End Try
		  
		  ' Check if email is already taken by ANOTHER user
		  Var checkEmailSQL As String = "SELECT user_id FROM users WHERE email = ? AND user_id <> ?"
		  
		  Try
		    Var checkEmailPS As MySQLPreparedStatement = Session.DB.Prepare(checkEmailSQL)
		    checkEmailPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    checkEmailPS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    checkEmailPS.Bind(0, txtEmail.Text.Trim)
		    checkEmailPS.Bind(1, mSelectedUserID)
		    
		    Var checkEmailRS As RowSet = checkEmailPS.SelectSQL
		    
		    If checkEmailRS <> Nil And Not checkEmailRS.AfterLastRow Then
		      MessageBox("Email '" + txtEmail.Text.Trim + "' is already taken by another user.")
		      Return
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error checking email: " + e.Message)
		    Return
		  End Try
		  
		  ' Proceed with the update
		  Var sql As String
		  
		  If txtPassword.Text.Trim = "" Then
		    ' Update without changing password
		    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, is_admin = ?, is_active = ?, user_group = NULLIF(?, '') WHERE user_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      ps.Bind(0, txtName.Text.Trim)
		      ps.Bind(1, txtEmail.Text.Trim)
		      ps.Bind(2, txtUsername.Text.Trim)
		      ps.Bind(3, chkIsAdmin.Value)
		      ps.Bind(4, chkIsActive.Value)
		      ps.Bind(5, cmbUserGroup.Text.Trim)
		      ps.Bind(6, mSelectedUserID)
		      
		      ps.ExecuteSQL
		      
		      session.DisplayMessage("User updated successfully!", self.lblDisplayedMessage)
		      LoadUsers("")
		      LoadUserGroups
		      
		    Catch e As DatabaseException
		      MessageBox("Error updating user: " + e.Message)
		    End Try
		    
		  Else
		    ' Update including password
		    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, password_hash = SHA2(?, 256), is_admin = ?, is_active = ?, user_group = NULLIF(?, '') WHERE user_id = ?"

		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_LONG)

		      ps.Bind(0, txtName.Text.Trim)
		      ps.Bind(1, txtEmail.Text.Trim)
		      ps.Bind(2, txtUsername.Text.Trim)
		      ps.Bind(3, txtPassword.Text.Trim)
		      ps.Bind(4, chkIsAdmin.Value)
		      ps.Bind(5, chkIsActive.Value)
		      ps.Bind(6, cmbUserGroup.Text.Trim)
		      ps.Bind(7, mSelectedUserID)
		      
		      ps.ExecuteSQL
		      
		      session.DisplayMessage("User updated successfully!", self.lblDisplayedMessage)
		      LoadUsers("")
		      LoadUserGroups
		      
		    Catch e As DatabaseException
		      MessageBox("Error updating user: " + e.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnDeleteUser.Pressed Event
		  ' *******************************************************************************
		  If lstUsers.SelectedRowIndex < 0 Then
		    session.DisplayMessage("Please select a user to delete", self.lblDisplayedMessage)
		    Return
		  End If
		  
		  Var userID As Integer = lstUsers.RowTagAt(lstUsers.SelectedRowIndex)
		  
		  If userID = Session.CurrentUserID Then
		    MessageBox("You cannot delete your own account")
		    Return
		  End If
		  
		  Var d As New WebMessageDialog
		  d.Title = "Confirm Delete"
		  d.Message = "Are you sure you want to delete this user? This will also delete all their test responses. This action cannot be undone."
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Caption = "Cancel"
		  d.CancelButton.Visible = True
		  
		  AddHandler d.ButtonPressed, AddressOf HandleDeleteUserConfirm
		  d.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveNewUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnSaveNewUser.Pressed Event
		  ' *******************************************************************************
		  
		  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
		    MessageBox("Please fill all fields")
		    Return
		  End If
		  
		  Var sql As String = "INSERT INTO users (full_name, email, username, password_hash, is_admin, is_active, user_group) VALUES (?, ?, ?, SHA2(?, 256), ?, ?, NULLIF(?, ''))"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    
		    ps.Bind(0, txtName.Text.Trim)
		    ps.Bind(1, txtEmail.Text.Trim)
		    ps.Bind(2, txtUsername.Text.Trim)
		    ps.Bind(3, txtPassword.Text.Trim)
		    ps.Bind(4, chkIsAdmin.Value)
		    ps.Bind(5, chkIsActive.Value)
		    ps.Bind(6, cmbUserGroup.Text.Trim)
		    
		    ps.ExecuteSQL
		    
		    session.DisplayMessage("User added successfully!", self.lblDisplayedMessage)
		    ClearFields
		    LoadUsers("")
		    LoadUserGroups  ' Refresh groups in case new one was added
		    
		  Catch e As DatabaseException
		    MessageBox("Error adding user: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popGroupFilter
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  ' *******************************************************************************
		  ' popGroupFilter.SelectionChanged Event
		  ' *******************************************************************************
		  #Pragma Unused item
		  
		  If Me.SelectedRowIndex = 0 Then
		    ' "All Groups" selected
		    LoadUsers("")
		  Else
		    ' Specific group selected
		    LoadUsers(Me.RowTextAt(Me.SelectedRowIndex))
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnManageGroups
	#tag Event
		Sub Pressed()
		  Var groupDlg As New dlg_ManageAvailableGroups
		  
		  'Add handler to refresh when groups change
		  AddHandler groupDlg.GroupsChanged, AddressOf HandleGroupsChanged
		  
		  groupDlg.Show
		  WebTimer.CallLater(4000, AddressOf LoadUserGroups)
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
