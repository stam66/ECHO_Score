' =============================================================================
' wc_EmailConfig WebContainer
' =============================================================================

' Insert → WebContainer
' Name: wc_EmailConfig
' Super: wc_Base

' Controls:
' Label: lblTitle (text: "Email Configuration", Bold, Large)
' Label: lblSMTPServer (text: "SMTP Server:")
' TextField: txtSMTPServer
' Label: lblSMTPPort (text: "SMTP Port:")
' TextField: txtSMTPPort
' Label: lblUsername (text: "Username:")
' TextField: txtUsername
' Label: lblPassword (text: "Password:")
' TextField: txtPassword (Password = True)
' Label: lblFromEmail (text: "From Email:")
' TextField: txtFromEmail
' Label: lblFromName (text: "From Name:")
' TextField: txtFromName
' CheckBox: chkUseTLS (text: "Use TLS/SSL")
' PushButton: btnSave (text: "Save Configuration", Primary style)
' PushButton: btnTest (text: "Send Test Email")
' Label: lblTestEmail (text: "Test Email Address:")
' TextField: txtTestEmail

' wc_EmailConfig.Opening Event
Sub Opening()
  ContainerID = "EmailConfig"
  LoadEmailConfig()
End Sub

' LoadEmailConfig Method
Sub LoadEmailConfig()
  Try
    Var sql As String = "SELECT * FROM email_config ORDER BY config_id DESC LIMIT 1"
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    If rs <> Nil And Not rs.AfterLastRow Then
      txtSMTPServer.Text = rs.Column("smtp_server").StringValue
      txtSMTPPort.Text = Str(rs.Column("smtp_port").IntegerValue)
      txtUsername.Text = rs.Column("smtp_username").StringValue
      txtPassword.Text = rs.Column("smtp_password").StringValue
      txtFromEmail.Text = rs.Column("from_email").StringValue
      txtFromName.Text = rs.Column("from_name").StringValue
      chkUseTLS.Value = rs.Column("use_tls").BooleanValue
    Else
      ' Set defaults
      txtSMTPServer.Text = "smtp.gmail.com"
      txtSMTPPort.Text = "587"
      txtFromName.Text = "ECHOScore"
      chkUseTLS.Value = True
    End If
  Catch e As DatabaseException
    MessageBox("Error loading email configuration: " + e.Message)
  End Try
End Sub

' btnSave.Pressed Event
Sub Pressed()
  ' Validate inputs
  If txtSMTPServer.Text.Trim = "" Or txtSMTPPort.Text.Trim = "" Then
    MessageBox("Please enter SMTP server and port")
    Return
  End If
  
  If txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
    MessageBox("Please enter username and password")
    Return
  End If
  
  If txtFromEmail.Text.Trim = "" Or txtFromName.Text.Trim = "" Then
    MessageBox("Please enter from email and name")
    Return
  End If
  
  Try
    ' Check if config exists
    Var checkSQL As String = "SELECT config_id FROM email_config LIMIT 1"
    Var checkRS As RowSet = Session.DB.SelectSQL(checkSQL)
    Var configExists As Boolean = (checkRS <> Nil And Not checkRS.AfterLastRow)
    
    Var sql As String
    If configExists Then
      sql = "UPDATE email_config SET smtp_server=?, smtp_port=?, smtp_username=?, smtp_password=?, from_email=?, from_name=?, use_tls=?"
    Else
      sql = "INSERT INTO email_config (smtp_server, smtp_port, smtp_username, smtp_password, from_email, from_name, use_tls) VALUES (?,?,?,?,?,?,?)"
    End If
    
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    
    ps.Bind(0, txtSMTPServer.Text.Trim)
    ps.Bind(1, Val(txtSMTPPort.Text.Trim))
    ps.Bind(2, txtUsername.Text.Trim)
    ps.Bind(3, txtPassword.Text.Trim)
    ps.Bind(4, txtFromEmail.Text.Trim)
    ps.Bind(5, txtFromName.Text.Trim)
    ps.Bind(6, chkUseTLS.Value)
    
    ps.ExecuteSQL
    
    MessageBox("Email configuration saved successfully")
    
  Catch e As DatabaseException
    MessageBox("Error saving email configuration: " + e.Message)
  End Try
End Sub

' btnTest.Pressed Event
Sub Pressed()
  If txtTestEmail.Text.Trim = "" Then
    MessageBox("Please enter a test email address")
    Return
  End If
  
  ' Save current configuration first
  btnSave.Pressed
  
  ' Send test email
  If EmailHelper.TestEmailConfiguration(txtTestEmail.Text.Trim) Then
    MessageBox("Test email sent successfully! Check your inbox.")
  Else
    MessageBox("Failed to send test email. Please check your configuration.")
  End If
End Sub