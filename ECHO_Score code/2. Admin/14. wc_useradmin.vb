' =============================================================================
' wc_UserAdmin WebContainer
' User management with group support
' =============================================================================

' Insert → WebContainer
' Name: wc_UserAdmin
' Super: wc_Base

' ******************************************************************
' Controls:
' ******************************************************************
' Label: lblTitle (text: "User Management", Bold)
' ListBox: lstUsers (5 columns: Name, Email, Username, Admin, Group)
' Label: lblName (text: "Full Name:")
' TextField: txtName
' Label: lblEmail (text: "Email:")
' TextField: txtEmail
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (PasswordField = True)
' CheckBox: chkIsAdmin (text: "Admin User")
' Label: lblUserGroup (text: "User Group:")
' ComboBox: cmbUserGroup (editable)
' PushButton: btnAddUser (text: "Add User")
' PushButton: btnUpdateUser (text: "Update User")
' PushButton: btnDeleteUser (text: "Delete User")
' PushButton: btnFilterByGroup (text: "Filter by Group")
' PushButton: btnClearFilter (text: "Show All")
' PushButton: btnBack (text: "Back")

' ******************************************************************
' PROPERTIES
' ******************************************************************
Private mSelectedUserID As Integer = 0


' ******************************************************************
' wc_UserAdmin.Opening Event
' ******************************************************************
Sub Opening()
  LoadUsers
  LoadUserGroups
  ClearFields
End Sub

' ******************************************************************
' LoadUserGroups Method
' ******************************************************************
Sub LoadUserGroups()
  cmbUserGroup.RemoveAllRows
  
  ' Add common groups
  Var currentYear As Integer = DateTime.Now.Year
  Var quarters() As String = Array("Q1", "Q2", "Q3", "Q4")
  Var specialties() As String = Array("Cardiology", "ICU", "ED", "Medicine", "Surgery")
  
  For Each specialty As String In specialties
    For Each quarter As String In quarters
      cmbUserGroup.AddRow(specialty + " " + Str(currentYear) + " " + quarter)
    Next
  Next
  
  ' Also load existing groups from database
  Var sql As String = "SELECT DISTINCT user_group FROM users WHERE user_group IS NOT NULL ORDER BY user_group DESC"
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    While Not rs.AfterLastRow
      Var existingGroup As String = rs.Column("user_group").StringValue
      If existingGroup.Trim <> "" Then
        ' Add if not already in list
        Var found As Boolean = False
        For i As Integer = 0 To cmbUserGroup.RowCount - 1
          If cmbUserGroup.RowTextAt(i) = existingGroup Then
            found = True
            Exit For i
          End If
        Next
        If Not found Then
          cmbUserGroup.AddRow(existingGroup)
        End If
      End If
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    ' Ignore error
  End Try
End Sub

' ******************************************************************
' LoadUsers Method (with filter)
' ******************************************************************
Sub LoadUsers(filterGroup As String)
  lstUsers.RemoveAllRows
  
  Var sql As String
  If filterGroup = "" Then
    sql = "SELECT user_id, full_name, email, username, is_admin, user_group FROM users ORDER BY full_name"
  Else
    sql = "SELECT user_id, full_name, email, username, is_admin, user_group FROM users WHERE user_group = ? ORDER BY full_name"
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
      lstUsers.AddRow(rs.Column("full_name").StringValue)
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 1) = rs.Column("email").StringValue
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 2) = rs.Column("username").StringValue
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 3) = If(rs.Column("is_admin").BooleanValue, "Yes", "No")
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 4) = rs.Column("user_group").StringValue
      lstUsers.RowTagAt(lstUsers.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading users: " + e.Message)
  End Try
End Sub

' ******************************************************************
' ClearFields Method
' ******************************************************************
Sub ClearFields()
  txtName.Text = ""
  txtEmail.Text = ""
  txtUsername.Text = ""
  txtPassword.Text = ""
  chkIsAdmin.Value = False
  cmbUserGroup.SelectedRowIndex = -1
End Sub

' ******************************************************************
' lstUsers.SelectionChanged Event
' ******************************************************************
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then
    mSelectedUserID = 0
    ClearFields()
    Return
  End If
  
  Var userID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
  mSelectedUserID = userID  ' Store for later use
  
  Var sql As String = "SELECT full_name, email, username, is_admin, user_group FROM users WHERE user_id = ?"
  
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
      cmbUserGroup.Text = rs.Column("user_group").StringValue
    End If
  Catch e As DatabaseException
    MessageBox("Error loading user: " + e.Message)
  End Try
End Sub

' =============================================================================
' wc_UserAdmin WebContainer (PART 2 - Button Events)
' Continued from Part 1
' =============================================================================

' ******************************************************************
' btnAddUser.Pressed Event
' ******************************************************************
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
    LoadUsers("")  ' Reload all users
    LoadUserGroups  ' Refresh groups in case new one was added
    
  Catch e As DatabaseException
    MessageBox("Error adding user: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnUpdateUser.Pressed Event
' ******************************************************************
Sub Pressed()
  ' Check if a user is selected
  If mSelectedUserID = 0 Then
    MessageBox("Please select a user to update")
    Return
  End If
  
  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Then
    MessageBox("Please fill name, email, and username fields")
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
      ps.Bind(5, mSelectedUserID)
      
      ps.ExecuteSQL
      
      MessageBox("User updated successfully!")
      LoadUsers("")
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
      ps.Bind(6, mSelectedUserID)
      
      ps.ExecuteSQL
      
      MessageBox("User updated successfully!")
      LoadUsers("")
      LoadUserGroups
      
    Catch e As DatabaseException
      MessageBox("Error updating user: " + e.Message)
    End Try
  End If
End Sub

' ******************************************************************
' btnDeleteUser.Pressed Event
' ******************************************************************
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

' ******************************************************************
' HandleDeleteUserConfirm Method
' ******************************************************************
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
      LoadUsers("")  ' Reload all users
      
    Catch e As DatabaseException
      MessageBox("Error deleting user: " + e.Message)
    End Try
  End Select
End Sub

' ******************************************************************
' btnFilterByGroup.Pressed Event
' ******************************************************************
Sub Pressed()
  If cmbUserGroup.Text.Trim <> "" Then
    LoadUsers(cmbUserGroup.Text.Trim)
  End If
End Sub

' ******************************************************************
' btnClearFilter.Pressed Event
' ******************************************************************
Sub Pressed()
  LoadUsers("")  ' Show all users
  cmbUserGroup.SelectedRowIndex = -1
End Sub

' ******************************************************************
' btnBack.Pressed Event
' ******************************************************************
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