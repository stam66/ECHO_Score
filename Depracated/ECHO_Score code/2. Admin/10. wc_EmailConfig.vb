' =============================================================================
' wc_EmailConfig WebContainer
' SMTP email configuration management
' =============================================================================

' Insert → WebContainer
' Name: wc_EmailConfig
' Super: wc_Base

' ******************************************************************
' Controls:
' ******************************************************************
' Label: lblTitle (text: "Email Configuration", Bold)
' Label: lblSMTPServer (text: "SMTP Server:")
' TextField: txtSMTPServer
' Label: lblSMTPPort (text: "SMTP Port:")
' TextField: txtSMTPPort
' Label: lblSMTPUsername (text: "SMTP Username:")
' TextField: txtSMTPUsername
' Label: lblSMTPPassword (text: "SMTP Password:")
' TextField: txtSMTPPassword (PasswordField = True)
' Label: lblFromEmail (text: "From Email:")
' TextField: txtFromEmail
' Label: lblFromName (text: "From Name:")
' TextField: txtFromName
' CheckBox: chkUseTLS (text: "Use TLS")
' PushButton: btnSave (text: "Save Configuration")
' PushButton: btnTestEmail (text: "Send Test Email")
' PushButton: btnBack (text: "Back")
' Label: lblMessage (text: "", Visible = False)

' ******************************************************************
' wc_EmailConfig.Opening Event
' ******************************************************************
Sub Opening()
  LoadEmailConfig
  lblMessage.Visible = False
End Sub

' ******************************************************************
' LoadEmailConfig Method
' ******************************************************************
Sub LoadEmailConfig()
  Var sql As String = "SELECT * FROM email_config LIMIT 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    If rs <> Nil And Not rs.AfterLastRow Then
      txtSMTPServer.Text = rs.Column("smtp_server").StringValue
      txtSMTPPort.Text = Str(rs.Column("smtp_port").IntegerValue)
      txtSMTPUsername.Text = rs.Column("smtp_username").StringValue
      txtSMTPPassword.Text = rs.Column("smtp_password").StringValue
      txtFromEmail.Text = rs.Column("from_email").StringValue
      txtFromName.Text = rs.Column("from_name").StringValue
      chkUseTLS.Value = rs.Column("use_tls").BooleanValue
    End If
  Catch e As DatabaseException
    ShowMessage("Error loading email configuration: " + e.Message, False)
  End Try
End Sub

' ******************************************************************
' ShowMessage Method
' ******************************************************************
Sub ShowMessage(msg As String, isSuccess As Boolean)
  lblMessage.Text = msg
  lblMessage.TextColor = If(isSuccess, &c27ae60, &ce74c3c)
  lblMessage.Visible = True
End Sub

' ******************************************************************
' btnSave.Pressed Event
' ******************************************************************
Sub Pressed()
  If txtSMTPServer.Text.Trim = "" Or txtSMTPPort.Text.Trim = "" Or txtSMTPUsername.Text.Trim = "" Or txtFromEmail.Text.Trim = "" Then
    ShowMessage("Please fill all required fields", False)
    Return
  End If
  
  Var checkSQL As String = "SELECT config_id FROM email_config LIMIT 1"
  Var configExists As Boolean = False
  
  Try
    Var checkRS As RowSet = Session.DB.SelectSQL(checkSQL)
    configExists = (checkRS <> Nil And Not checkRS.AfterLastRow)
  Catch e As DatabaseException
    ShowMessage("Error checking config: " + e.Message, False)
    Return
  End Try
  
  Var sql As String
  
  If configExists Then
    sql = "UPDATE email_config SET smtp_server=?, smtp_port=?, smtp_username=?, smtp_password=?, from_email=?, from_name=?, use_tls=? WHERE config_id=1"
  Else
    sql = "INSERT INTO email_config (smtp_server, smtp_port, smtp_username, smtp_password, from_email, from_name, use_tls) VALUES (?,?,?,?,?,?,?)"
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, txtSMTPServer.Text.Trim)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(1, Val(txtSMTPPort.Text.Trim))
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(2, txtSMTPUsername.Text.Trim)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(3, txtSMTPPassword.Text.Trim)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(4, txtFromEmail.Text.Trim)
    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(5, txtFromName.Text.Trim)
    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(6, chkUseTLS.Value)
    
    ps.ExecuteSQL
    
    ShowMessage("Email configuration saved successfully!", True)
    
  Catch e As DatabaseException
    ShowMessage("Error saving email configuration: " + e.Message, False)
  End Try
End Sub

' ******************************************************************
' btnTestEmail.Pressed Event
' ******************************************************************
Sub Pressed()
  If Session.CurrentUserEmail = "" Then
    ShowMessage("No email address available for test", False)
    Return
  End If
  
  ShowMessage("Sending test email...", True)
  
  If EmailHelper.SendPasswordResetEmail(Session.CurrentUserEmail, Session.CurrentUserName, "123456", "https://test.com") Then
    ShowMessage("Test email sent successfully! Check your inbox.", True)
  Else
    ShowMessage("Failed to send test email. Please check your configuration.", False)
  End If
End Sub

' ******************************************************************
' btnBack.Pressed Event
' ******************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * Configure SMTP settings for password reset emails
' * For Gmail, use App Password (not regular password)
' * Test button sends sample email to current admin user
' * Port 587 is standard for TLS/STARTTLS
' * Port 465 for SSL (less common)
' * Port 25 for unencrypted (not recommended)
' =============================================================================