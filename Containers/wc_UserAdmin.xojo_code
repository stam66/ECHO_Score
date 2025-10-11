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
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      indicator       =   0
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
      Text            =   "User Management"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   199
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstUsers
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
      Height          =   534
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Name	Email	Username	Admin"
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
      Top             =   141
      Visible         =   True
      Width           =   702
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
      Left            =   748
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
      Top             =   128
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
      Left            =   748
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
      Top             =   167
      Visible         =   True
      Width           =   276
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
      Left            =   748
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
      Top             =   213
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
      Left            =   748
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
      Top             =   252
      Visible         =   True
      Width           =   276
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
      Left            =   748
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
      Top             =   298
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
      Left            =   748
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
      Top             =   337
      Visible         =   True
      Width           =   276
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
      Left            =   748
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
      Top             =   383
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
      Left            =   748
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
      Top             =   422
      Visible         =   True
      Width           =   276
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
      Left            =   748
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
      Top             =   482
      Value           =   False
      Visible         =   True
      Width           =   276
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAddUser
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add User"
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
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   82
      Visible         =   True
      Width           =   125
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
      Indicator       =   0
      Left            =   153
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
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   82
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
      Indicator       =   0
      Left            =   286
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   82
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnBack
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Back"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   419
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
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   82
      Visible         =   True
      Width           =   125
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
		  LoadUsers
		  ClearFields
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
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteUserConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  Select Case button
		  Case dialog.ActionButton
		    Var userID As Integer = lstUsers.RowTagAt(lstUsers.SelectedRowIndex)
		    Var sql As String = "DELETE FROM users WHERE user_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, userID)
		      
		      ps.ExecuteSQL
		      
		      MessageBox("User deleted successfully!")
		      ClearFields
		      LoadUsers
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting user: " + e.Message)
		    End Try
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadUsers()
		  ' *******************************************************************************
		  ' LoadUsers Method
		  ' *******************************************************************************
		  lstUsers.RemoveAllRows
		  
		  Var sql As String = "SELECT user_id, full_name, email, username, is_admin FROM users ORDER BY full_name"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    
		    While Not rs.AfterLastRow
		      lstUsers.AddRow(rs.Column("full_name").StringValue)
		      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 1) = rs.Column("email").StringValue
		      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 2) = rs.Column("username").StringValue
		      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 3) = If(rs.Column("is_admin").BooleanValue, "Yes", "No")
		      lstUsers.RowTagAt(lstUsers.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		  Catch e As DatabaseException
		    MessageBox("Error loading users: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lstUsers
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' *******************************************************************************
		  ' lstUsers.SelectionChanged Event
		  ' *******************************************************************************
		  If Me.SelectedRowIndex < 0 Then Return
		  
		  Var userID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
		  
		  Var sql As String = "SELECT full_name, email, username, is_admin FROM users WHERE user_id = ?"
		  
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
		    End If
		  Catch e As DatabaseException
		    MessageBox("Error loading user: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnAddUser.Pressed Event
		  ' *******************************************************************************
		  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
		    MessageBox("Please fill all fields")
		    Return
		  End If
		  
		  Var sql As String = "INSERT INTO users (full_name, email, username, password_hash, is_admin) VALUES (?, ?, ?, SHA2(?, 256), ?)"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    
		    ps.Bind(0, txtName.Text.Trim)
		    ps.Bind(1, txtEmail.Text.Trim)
		    ps.Bind(2, txtUsername.Text.Trim)
		    ps.Bind(3, txtPassword.Text.Trim)
		    ps.Bind(4, chkIsAdmin.Value)
		    
		    ps.ExecuteSQL
		    
		    MessageBox("User added successfully!")
		    ClearFields
		    LoadUsers
		    
		  Catch e As DatabaseException
		    MessageBox("Error adding user: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpdateUser
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnUpdateUser.Pressed Event
		  ' *******************************************************************************
		  If lstUsers.SelectedRowIndex < 0 Then
		    MessageBox("Please select a user to update")
		    Return
		  End If
		  
		  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Then
		    MessageBox("Please fill name, email, and username fields")
		    Return
		  End If
		  
		  Var userID As Integer = lstUsers.RowTagAt(lstUsers.SelectedRowIndex)
		  Var sql As String
		  
		  If txtPassword.Text.Trim = "" Then
		    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, is_admin = ? WHERE user_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      ps.Bind(0, txtName.Text.Trim)
		      ps.Bind(1, txtEmail.Text.Trim)
		      ps.Bind(2, txtUsername.Text.Trim)
		      ps.Bind(3, chkIsAdmin.Value)
		      ps.Bind(4, userID)
		      
		      ps.ExecuteSQL
		      
		      MessageBox("User updated successfully!")
		      LoadUsers
		      
		    Catch e As DatabaseException
		      MessageBox("Error updating user: " + e.Message)
		    End Try
		  Else
		    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, password_hash = SHA2(?, 256), is_admin = ? WHERE user_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      ps.Bind(0, txtName.Text.Trim)
		      ps.Bind(1, txtEmail.Text.Trim)
		      ps.Bind(2, txtUsername.Text.Trim)
		      ps.Bind(3, txtPassword.Text.Trim)
		      ps.Bind(4, chkIsAdmin.Value)
		      ps.Bind(5, userID)
		      
		      ps.ExecuteSQL
		      
		      MessageBox("User updated successfully!")
		      LoadUsers
		      
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
		    MessageBox("Please select a user to delete")
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
#tag Events btnBack
	#tag Event
		Sub Pressed()
		  Session.Navigation.NavigateBack
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
