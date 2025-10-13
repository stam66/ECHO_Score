-- =============================================================================
-- wc_UserAdmin WebContainer (PART 2 - Button Events)
-- Continued from Part 1
-- =============================================================================

' btnAddUser.Pressed Event
Sub Pressed()
  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
    MessageBox("Please fill all fields")
    Return
  End If
  
  Var sql As String = "INSERT INTO users (full_name, email, username, password_hash, is_admin, user_group) VALUES (?, ?, ?, SHA2(?, 256), ?, ?)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    
    ps.Bind(0, txtName.Text.Trim)
    ps.Bind(1, txtEmail.Text.Trim)
    ps.Bind(2, txtUsername.Text.Trim)
    ps.Bind(3, txtPassword.Text.Trim)
    ps.Bind(4, chkIsAdmin.Value)
    ps.Bind(5, cmbUserGroup.Text.Trim)
    
    ps.ExecuteSQL
    
    MessageBox("User added successfully!")
    ClearFields
    LoadUsers
    LoadUserGroups  ' Refresh groups in case new one was added
    
  Catch e As DatabaseException
    MessageBox("Error adding user: " + e.Message)
  End Try
End Sub

' btnUpdateUser.Pressed Event
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
    ' Update without changing password
    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, is_admin = ?, user_group = ? WHERE user_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      
      ps.Bind(0, txtName.Text.Trim)
      ps.Bind(1, txtEmail.Text.Trim)
      ps.Bind(2, txtUsername.Text.Trim)
      ps.Bind(3, chkIsAdmin.Value)
      ps.Bind(4, cmbUserGroup.Text.Trim)
      ps.Bind(5, userID)
      
      ps.ExecuteSQL
      
      MessageBox("User updated successfully!")
      LoadUsers
      LoadUserGroups
      
    Catch e As DatabaseException
      MessageBox("Error updating user: " + e.Message)
    End Try
  Else
    ' Update including password
    sql = "UPDATE users SET full_name = ?, email = ?, username = ?, password_hash = SHA2(?, 256), is_admin = ?, user_group = ? WHERE user_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      
      ps.Bind(0, txtName.Text.Trim)
      ps.Bind(1, txtEmail.Text.Trim)
      ps.Bind(2, txtUsername.Text.Trim)
      ps.Bind(3, txtPassword.Text.Trim)
      ps.Bind(4, chkIsAdmin.Value)
      ps.Bind(5, cmbUserGroup.Text.Trim)
      ps.Bind(6, userID)
      
      ps.ExecuteSQL
      
      MessageBox("User updated successfully!")
      LoadUsers
      LoadUserGroups
      
    Catch e As DatabaseException
      MessageBox("Error updating user: " + e.Message)
    End Try
  End If
End Sub

' btnDeleteUser.Pressed Event
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

' HandleDeleteUserConfirm Method
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

' btnFilterByGroup.Pressed Event
Sub Pressed()
  If cmbUserGroup.Text.Trim <> "" Then
    LoadUsers(cmbUserGroup.Text.Trim)
  End If
End Sub

' btnClearFilter.Pressed Event
Sub Pressed()
  LoadUsers("")
  cmbUserGroup.SelectedRowIndex = -1
End Sub

' btnBack.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * User groups are auto-generated (Specialty + Year + Quarter)
' * Can filter users by group
' * Password field optional when updating (leave blank to keep current)
' * Cannot delete own account (safety feature)
' * Groups are editable in ComboBox (can type custom value)
' =============================================================================