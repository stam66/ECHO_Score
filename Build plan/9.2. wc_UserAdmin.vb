' Insert → WebContainer
' Name: wc_UserAdmin
' Super: wc_Base

' *******************************************************************************
' Controls
' *******************************************************************************
' Label: lblTitle (text: "User Management", Bold)
' ListBox: lstUsers (4 columns: Name, Email, Username, Admin)
' Label: lblName (text: "Full Name:")
' TextField: txtName
' Label: lblEmail (text: "Email:")
' TextField: txtEmail
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (PasswordField = True)
' CheckBox: chkIsAdmin (text: "Admin User")
' PushButton: btnAddUser (text: "Add User")
' PushButton: btnUpdateUser (text: "Update User")
' PushButton: btnDeleteUser (text: "Delete User")
' PushButton: btnBack (text: "Back")


' *******************************************************************************
' wc_UserAdmin.opening event
' *******************************************************************************
Sub Opening()
  LoadUsers
  ClearFields
End Sub


' *******************************************************************************
' LoadUsers Method
' *******************************************************************************
Sub LoadUsers()
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


' *******************************************************************************
' ClearFields Method
' *******************************************************************************
Sub ClearFields()
  txtName.Text = ""
  txtEmail.Text = ""
  txtUsername.Text = ""
  txtPassword.Text = ""
  chkIsAdmin.Value = False
End Sub


' *******************************************************************************
' lstUsers.SelectionChanged Event
' *******************************************************************************
Sub SelectionChanged()
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


' *******************************************************************************
' btnAddUser.Pressed Event
' *******************************************************************************
Sub Pressed()
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


' *******************************************************************************
' btnUpdateUser.Pressed Event
' *******************************************************************************
Sub Pressed()
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


' *******************************************************************************
' btnDeleteUser.Pressed Event
' *******************************************************************************
Sub Pressed()
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


'********************************************************************************
''HandleDeleteUserConfirm Method - delegate for delete confirmation dialog
'********************************************************************************
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


' *******************************************************************************   
' btnBack.Pressed Event
' *******************************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub