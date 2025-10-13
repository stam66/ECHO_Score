-- =============================================================================
-- wc_UserAdmin WebContainer
-- User management with group support
-- =============================================================================

' Insert → WebContainer
' Name: wc_UserAdmin
' Super: wc_Base

' Controls:
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

' wc_UserAdmin.Opening Event
Sub Opening()
  LoadUsers
  LoadUserGroups
  ClearFields
End Sub

' LoadUserGroups Method
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

' LoadUsers Method (with optional filter)
Sub LoadUsers(Optional filterGroup As String = "")
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

' ClearFields Method
Sub ClearFields()
  txtName.Text = ""
  txtEmail.Text = ""
  txtUsername.Text = ""
  txtPassword.Text = ""
  chkIsAdmin.Value = False
  cmbUserGroup.SelectedRowIndex = -1
End Sub

' lstUsers.SelectionChanged Event
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then Return
  
  Var userID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
  
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

' Continue in next artifact for button events...
' =============================================================================