' =============================================================================
' wc_Login WebContainer - Complete Updated Version
' User authentication with SHA2-256 password hashing
' =============================================================================

' Insert → WebContainer
' Name: wc_Login
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "ECHOScore Login", Bold, Large)
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (Password = True)
' PushButton: btnLogin (text: "Login", Primary style)
' WebLink: lnkForgotPassword (text: "Forgot Password?")

' wc_Login.Opening Event
Sub Opening()
  ContainerID = "Login"
  txtUsername.SetFocus
End Sub

' btnLogin.Pressed Event
Sub Pressed()
  If txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
    MessageBox("Please enter username and password")
    Return
  End If
  
  Var sql As String = "SELECT user_id, full_name, is_admin, user_group FROM users WHERE username = ? AND password_hash = SHA2(?, 256)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    
    ps.Bind(0, txtUsername.Text.Trim)
    ps.Bind(1, txtPassword.Text)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      ' Login successful
      Session.CurrentUserID = rs.Column("user_id").IntegerValue
      Session.CurrentUsername = txtUsername.Text.Trim
      Session.IsAdmin = rs.Column("is_admin").BooleanValue
      Session.UserGroup = rs.Column("user_group").StringValue
      
      ' Update last login time
      Var updateSQL As String = "UPDATE users SET last_login = NOW() WHERE user_id = ?"
      Var psUpdate As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
      psUpdate.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psUpdate.Bind(0, Session.CurrentUserID)
      psUpdate.ExecuteSQL
      
      System.DebugLog("User logged in: " + Session.CurrentUsername + " (Admin: " + Str(Session.IsAdmin) + ")")
      
      ' Navigate to appropriate home screen
      If Session.IsAdmin Then
        Var adminHome As New wc_AdminHome
        adminHome.ContainerID = "AdminHome"
        Session.Navigation.NavigateTo(adminHome)
      Else
        Var userHome As New wc_UserHome
        userHome.ContainerID = "UserHome"
        Session.Navigation.NavigateTo(userHome)
      End If
      
    Else
      MessageBox("Invalid username or password")
      txtPassword.Text = ""
      txtPassword.SetFocus
    End If
    
  Catch e As DatabaseException
    MessageBox("Login error: " + e.Message)
  End Try
End Sub

' txtPassword.TextChanged Event
Sub TextChanged()
  ' Allow Enter key to submit
End Sub

' txtPassword.KeyPressed Event (if supported)
Sub KeyPressed(key As String)
  If key = Chr(13) Then ' Enter key
    btnLogin.Pressed
  End If
End Sub

' lnkForgotPassword.Pressed Event
Sub Pressed()
  Var forgotPassword As New wc_ForgotPassword
  forgotPassword.ContainerID = "ForgotPassword"
  Session.Navigation.NavigateTo(forgotPassword)
End Sub

' =============================================================================
' wc_Login Change Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. AUTHENTICATION:
'    - SHA2-256 password hashing (matches database)
'    - Username and password validation
'    - Trimming whitespace from inputs
' 
' 2. SESSION MANAGEMENT:
'    - Sets Session.CurrentUserID
'    - Sets Session.CurrentUsername
'    - Sets Session.IsAdmin
'    - Sets Session.UserGroup (for case filtering)
' 
' 3. LAST LOGIN TRACKING:
'    - Updates users.last_login timestamp
'    - Helps with user activity monitoring
' 
' 4. ROLE-BASED NAVIGATION:
'    - Admins → wc_AdminHome
'    - Students → wc_UserHome
' 
' 5. PASSWORD RESET:
'    - Link to wc_ForgotPassword
'    - Starts password reset flow
' 
' 6. USER EXPERIENCE:
'    - Auto-focus on username field
'    - Enter key submits login
'    - Clear password on failed login
'    - User-friendly error messages
' 
' =============================================================================
' Control Layout:
' =============================================================================
' 
' lblTitle:
'   Position: Centered, top of container
'   Font: Bold, 24pt
'   Text: "ECHOScore Login"
' 
' lblUsername:
'   Position: Left-aligned
'   Text: "Username:"
' 
' txtUsername:
'   Position: Below lblUsername
'   Width: 300px
' 
' lblPassword:
'   Position: Below txtUsername
'   Text: "Password:"
' 
' txtPassword:
'   Position: Below lblPassword
'   Width: 300px
'   Password: True (shows bullets)
' 
' btnLogin:
'   Position: Below txtPassword, centered
'   Width: 150px
'   Style: Primary
'   Text: "Login"
' 
' lnkForgotPassword:
'   Position: Below btnLogin, centered
'   Text: "Forgot Password?"
'   Style: Link
' 
' =============================================================================
' Security Notes:
' =============================================================================
' 
' 1. Passwords are NEVER stored in plain text
' 2. SHA2-256 hashing matches database schema
' 3. Login attempts should be rate-limited in production
' 4. Consider adding CAPTCHA for brute-force protection
' 5. Password field uses bullets to hide input
' 6. Failed login doesn't reveal if username or password was wrong
' 
' =============================================================================
' Testing:
' =============================================================================
' 
' Default Admin Account:
'   Username: admin
'   Password: reject66
' 
' Add Test Student Account:
'   INSERT INTO users (full_name, email, username, password_hash, is_admin, user_group)
'   VALUES ('Test Student', 'student@test.com', 'student', SHA2('password', 256), 0, 'Cardiology 2025 Q1');
' 
' =============================================================================
