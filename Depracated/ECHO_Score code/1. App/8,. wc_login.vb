' =============================================================================
' wc_Login WebContainer
' User login screen
' =============================================================================

' Insert → WebContainer
' Name: wc_Login
' Super: wc_Base

' ******************************************************************
' Controls:
' ******************************************************************
' Label: lblTitle (text: "ECHOScore Login", Bold, Large Font)
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (PasswordField = True)
' PushButton: btnLogin (text: "Login")
' Label: lblForgotPassword (text: "Forgot Password?", Blue color, Underline)
' Label: lblError (text: "", Red color, Visible = False)

' ******************************************************************
' wc_Login.Opening Event
' ******************************************************************
Sub Opening()
  lblError.Text = ""
  lblError.Visible = False
  lblForgotPassword.TextColor = &c3498db
  lblForgotPassword.Underline = True
End Sub

' ******************************************************************
' btnLogin.Pressed Event
' ******************************************************************
Sub Pressed()
  If txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
    lblError.Text = "Please enter username and password"
    lblError.Visible = True
    Return
  End If
  
  Var sql As String = "SELECT user_id, full_name, email, is_admin FROM users WHERE username = ? AND password_hash = SHA2(?, 256)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    
    ps.Bind(0, txtUsername.Text.Trim)
    ps.Bind(1, txtPassword.Text.Trim)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      ' Store user session data
      Session.CurrentUserID = rs.Column("user_id").IntegerValue
      Session.CurrentUserName = rs.Column("full_name").StringValue
      Session.CurrentUserEmail = rs.Column("email").StringValue
      Session.IsAdmin = rs.Column("is_admin").BooleanValue
      
      ' Update last login timestamp
      Var updateSQL As String = "UPDATE users SET last_login = NOW() WHERE user_id = ?"
      Var updatePS As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
      updatePS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      updatePS.Bind(0, Session.CurrentUserID)
      updatePS.ExecuteSQL
      
      ' Navigate based on user role
      If Session.IsAdmin Then
        Var adminHome As New wc_AdminHome
        adminHome.ContainerID = "AdminHome"
        adminHome.Position = wc_Base.PositionEnum.TopLeft
        Session.Navigation.NavigateTo(adminHome)
      Else
        Var userHome As New wc_UserHome
        userHome.ContainerID = "UserHome"
        userHome.Position = wc_Base.PositionEnum.TopLeft
        Session.Navigation.NavigateTo(userHome)
      End If
    Else
      lblError.Text = "Invalid username or password"
      lblError.Visible = True
    End If
    
  Catch e As DatabaseException
    lblError.Text = "Database error: " + e.Message
    lblError.Visible = True
  End Try
End Sub

' ******************************************************************
' lblForgotPassword.MouseDown Event
' ******************************************************************
Sub MouseDown(x As Integer, y As Integer)
  #Pragma Unused x, y
  
  Var forgotPassword As New wc_ForgotPassword
  forgotPassword.ContainerID = "ForgotPassword"
  forgotPassword.Position = wc_Base.PositionEnum.Center
  Session.Navigation.NavigateTo(forgotPassword)
End Sub

' =============================================================================
' Usage:
' * Default admin credentials: username "admin", password "reject66"
' * Password is hashed with SHA2-256
' * Redirects to AdminHome or UserHome based on is_admin flag
' =============================================================================