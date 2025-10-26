' =============================================================================
' wc_UserAdmin WebContainer - Complete Updated Version
' User management with group assignment and filtering
' =============================================================================

' Insert → WebContainer
' Name: wc_UserAdmin
' Super: wc_Base

' Properties:
Private mSelectedUserID As Integer = 0

' Controls:
' Label: lblTitle (text: "User Management", Bold, Large)

' USER LIST SECTION:
' Label: lblUsers (text: "Users:", Bold)
' ComboBox: cmbFilterGroup (text: "Filter by Group")
' ListBox: lstUsers (3 columns: Name, Username, Group)
' PushButton: btnRefresh (text: "Refresh")

' USER DETAILS SECTION:
' Label: lblUserDetails (text: "User Details:", Bold)
' Label: lblName (text: "Full Name:")
' TextField: txtName
' Label: lblEmail (text: "Email:")
' TextField: txtEmail
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (Password = True)
' Label: lblPasswordNote (text: "Leave blank to keep current password")
' Label: lblGroup (text: "User Group:")
' ComboBox: cmbUserGroup
' CheckBox: chkIsAdmin (text: "Administrator")

' ACTION BUTTONS:
' PushButton: btnAddUser (text: "Add User", Primary style)
' PushButton: btnUpdateUser (text: "Update User")
' PushButton: btnDeleteUser (text: "Delete User", Danger style)
' PushButton: btnClear (text: "Clear Form")

' wc_UserAdmin.Opening Event
Sub Opening()
  ContainerID = "UserAdmin"
  LoadUserGroups()
  LoadUsers("")
End Sub

' LoadUserGroups Method - Populate group filter and user group dropdown
Sub LoadUserGroups()
  cmbFilterGroup.RemoveAllRows
  cmbUserGroup.RemoveAllRows
  
  cmbFilterGroup.AddRow("All Groups")
  cmbFilterGroup.SelectedRowIndex = 0
  
  ' Get distinct groups from users and cases
  Var sql As String = "SELECT DISTINCT user_group FROM users WHERE user_group IS NOT NULL AND user_group <> '' UNION SELECT DISTINCT case_groups FROM cases WHERE case_groups IS NOT NULL AND case_groups <> '' ORDER BY 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    Var uniqueGroups() As String
    
    While rs <> Nil And Not rs.AfterLastRow
      Var groupText As String = rs.Column(0).StringValue
      
      ' Split comma-separated groups
      If groupText.Trim <> "" Then
        Var groups() As String = groupText.Split(",")
        For Each group As String In groups
          Var cleanGroup As String = group.Trim
          If cleanGroup <> "" Then
            ' Check if already added
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
    
    ' Add to both dropdowns
    For Each group As String In uniqueGroups
      cmbFilterGroup.AddRow(group)
      cmbUserGroup.AddRow(group)
    Next
    
    ' Add common groups to user group dropdown
    Var currentYear As Integer = DateTime.Now.Year
    Var quarters() As String = Array("Q1", "Q2", "Q3", "Q4")
    Var specialties() As String = Array("Cardiology", "ICU", "ED", "Medicine", "Surgery")
    
    For Each specialty As String In specialties
      For Each quarter As String In quarters
        Var groupName As String = specialty + " " + Str(currentYear) + " " + quarter
        ' Check if already added
        Var alreadyExists As Boolean = False
        For i As Integer = 0 To cmbUserGroup.RowCount - 1
          If cmbUserGroup.RowTextAt(i) = groupName Then
            alreadyExists = True
            Exit For i
          End If
        Next
        If Not alreadyExists Then
          cmbUserGroup.AddRow(groupName)
        End If
      Next
    Next
    
  Catch e As DatabaseException
    System.DebugLog("Error loading user groups: " + e.Message)
  End Try
End Sub

' LoadUsers Method - Load users with optional group filter
Sub LoadUsers(groupFilter As String)
  lstUsers.RemoveAllRows
  
  Var sql As String
  If groupFilter = "" Or groupFilter = "All Groups" Then
    sql = "SELECT user_id, full_name, username, user_group, is_admin FROM users ORDER BY full_name"
  Else
    sql = "SELECT user_id, full_name, username, user_group, is_admin FROM users WHERE user_group = ? ORDER BY full_name"
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If groupFilter <> "" And groupFilter <> "All Groups" Then
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(0, groupFilter)
    End If
    
    Var rs As RowSet = ps.SelectSQL
    
    While rs <> Nil And Not rs.AfterLastRow
      Var userName As String = rs.Column("full_name").StringValue
      Var username As String = rs.Column("username").StringValue
      Var userGroup As String = rs.Column("user_group").StringValue
      Var isAdmin As Boolean = rs.Column("is_admin").BooleanValue
      
      If isAdmin Then
        userName = userName + " (Admin)"
      End If
      
      lstUsers.AddRow(userName)
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 1) = username
      lstUsers.CellTextAt(lstUsers.LastAddedRowIndex, 2) = userGroup
      lstUsers.RowTagAt(lstUsers.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
    
  Catch e As DatabaseException
    MessageBox("Error loading users: " + e.Message)
  End Try
End Sub

' lstUsers.SelectionChanged Event
Sub SelectionChanged()
  If Me.SelectedRowIndex < 0 Then Return
  
  mSelectedUserID = Me.RowTagAt(Me.SelectedRowIndex)
  
  ' Load user details
  Var sql As String = "SELECT * FROM users WHERE user_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, mSelectedUserID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      txtName.Text = rs.Column("full_name").StringValue
      txtEmail.Text = rs.Column("email").StringValue
      txtUsername.Text = rs.Column("username").StringValue
      txtPassword.Text = "" ' Don't show password
      
      Var userGroup As String = rs.Column("user_group").StringValue
      ' Set group in dropdown
      For i As Integer = 0 To cmbUserGroup.RowCount - 1
        If cmbUserGroup.RowTextAt(i) = userGroup Then
          cmbUserGroup.SelectedRowIndex = i
          Exit For i
        End If
      Next
      
      chkIsAdmin.Value = rs.Column("is_admin").BooleanValue
    End If
    
  Catch e As DatabaseException
    MessageBox("Error loading user details: " + e.Message)
  End Try
End Sub

' cmbFilterGroup.SelectionChanged Event
Sub SelectionChanged()
  If Me.SelectedRowIndex < 0 Then Return
  
  Var selectedGroup As String = Me.RowTextAt(Me.SelectedRowIndex)
  LoadUsers(selectedGroup)
End Sub

' btnRefresh.Pressed Event
Sub Pressed()
  LoadUserGroups()
  Var selectedGroup As String = ""
  If cmbFilterGroup.SelectedRowIndex >= 0 Then
    selectedGroup = cmbFilterGroup.RowTextAt(cmbFilterGroup.SelectedRowIndex)
  End If
  LoadUsers(selectedGroup)
End Sub

' btnAddUser.Pressed Event
Sub Pressed()
  ' Validate inputs
  If txtName.Text.Trim = "" Or txtEmail.Text.Trim = "" Or txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
    MessageBox("Please fill all required fields (name, email, username, password)")
    Return
  End If
  
  ' Validate password strength
  If txtPassword.Text.Length < 8 Then
    MessageBox("Password must be at least 8 characters")
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
    
    MessageBox("User added successfully")
    btnClear.Pressed
    LoadUsers("")
    LoadUserGroups()
    
  Catch e As DatabaseException
    If e.Message.IndexOf("Duplicate entry") >= 0 Then
      MessageBox("Username or email already exists")
    Else
      MessageBox("Error adding user: " + e.Message)
    End If
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
  
  ' Check if trying to remove own admin privileges
  If userID = Session.CurrentUserID And Not chkIsAdmin.Value Then
    MessageBox("You cannot remove your own admin privileges")
    Return
  End If
  
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
      
      MessageBox("User updated successfully")
      LoadUsers("")
      LoadUserGroups()
      
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
      
      MessageBox("User updated successfully")
      LoadUsers("")
      LoadUserGroups()
      
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
  
  ' Prevent deleting own account
  If userID = Session.CurrentUserID Then
    MessageBox("You cannot delete your own account")
    Return
  End If
  
  Var d As New WebMessageDialog
  d.Title = "Confirm Delete"
  d.Message = "Are you sure you want to delete this user? This action cannot be undone."
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
      
      MessageBox("User deleted successfully")
      btnClear.Pressed
      LoadUsers("")
      LoadUserGroups()
      
    Catch e As DatabaseException
      MessageBox("Error deleting user: " + e.Message)
    End Try
  End Select
End Sub

' btnClear.Pressed Event
Sub Pressed()
  txtName.Text = ""
  txtEmail.Text = ""
  txtUsername.Text = ""
  txtPassword.Text = ""
  cmbUserGroup.SelectedRowIndex = -1
  chkIsAdmin.Value = False
  lstUsers.SelectedRowIndex = -1
  mSelectedUserID = 0
End Sub

' =============================================================================
' wc_UserAdmin Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. USER MANAGEMENT:
'    - Add new users with validation
'    - Update existing users (password optional)
'    - Delete users (with confirmation)
'    - Cannot delete own account
'    - Cannot remove own admin privileges
' 
' 2. GROUP MANAGEMENT:
'    - Auto-populated dropdown with existing groups
'    - Common groups pre-loaded (by specialty and quarter)
'    - Custom group entry supported
'    - Group filtering in user list
' 
' 3. VALIDATION:
'    - All required fields validated
'    - Minimum 8-character password
'    - Duplicate username/email detection
'    - Password optional when updating
' 
' 4. SECURITY:
'    - SHA2-256 password hashing
'    - Password never displayed
'    - Admin cannot delete own account
'    - Admin cannot remove own privileges
' 
' 5. USER INTERFACE:
'    - Three-column user list (Name, Username, Group)
'    - Group filter dropdown
'    - Clear form functionality
'    - Refresh button to reload groups
' 
' =============================================================================
