#tag Module
Protected Module PasswordResetHelper
	#tag Method, Flags = &h0
		Function CleanupExpiredTokens() As Integer
		  ' Returns number of tokens deleted
		  Try
		    Var sql As String = "DELETE FROM password_reset_tokens WHERE expires_at < NOW() AND is_used = FALSE"
		    Session.DB.SQLExecute(sql)
		    Return Session.DB.RowsAffected
		  Catch e As DatabaseException
		    System.DebugLog("Error cleaning up expired tokens: " + e.Message)
		    Return 0
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreatePasswordResetToken(userID As Integer, ipAddress As String) As Dictionary
		  ' Returns dictionary with: success (Boolean), otp (String), token (String), error (String)
		  Var result As New Dictionary
		  
		  Try
		    ' Generate OTP and token
		    Var otp As String = EmailHelper.GenerateOTP
		    Var token As String = EmailHelper.GenerateSecureToken
		    
		    ' Calculate expiration (30 minutes from now)
		    Var expiresAt As DateTime = DateTime.Now
		    expiresAt = expiresAt.AddInterval(0, 0, 0, 0, 30, 0) ' Add 30 minutes
		    
		    ' Insert token into database
		    Var sql As String = _
		    "INSERT INTO password_reset_tokens (user_id, token, otp, expires_at, ip_address) " + _
		    "VALUES (?, ?, ?, ?, ?)"
		    
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    
		    ps.Bind(0, userID)
		    ps.Bind(1, token)
		    ps.Bind(2, otp)
		    ps.Bind(3, expiresAt.SQLDateTime)
		    ps.Bind(4, ipAddress)
		    
		    ps.SQLExecute
		    
		    result.Value("success") = True
		    result.Value("otp") = otp
		    result.Value("token") = token
		    
		  Catch e As DatabaseException
		    result.Value("success") = False
		    result.Value("error") = e.Message
		    System.DebugLog("Error creating password reset token: " + e.Message)
		  End Try
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResetPassword(tokenID As Integer, userID As Integer, newPassword As String) As Boolean
		  Try
		    ' Start transaction
		    Session.DB.BeginTransaction
		    
		    ' Update user password
		    Var updateUserSQL As String = "UPDATE users SET password_hash = SHA2(?, 256) WHERE user_id = ?"
		    
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(updateUserSQL)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps1.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    
		    ps1.Bind(0, newPassword)
		    ps1.Bind(1, userID)
		    
		    ps1.SQLExecute
		    
		    ' Mark token as used
		    Var updateTokenSQL As String = "UPDATE password_reset_tokens SET is_used = TRUE, used_at = NOW() WHERE token_id = ?"
		    
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(updateTokenSQL)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, tokenID)
		    
		    ps2.SQLExecute
		    
		    ' Commit transaction
		    Session.DB.CommitTransaction
		    
		    System.DebugLog("Password reset successfully for user ID: " + userID.ToString)
		    Return True
		    
		  Catch e As DatabaseException
		    Session.DB.RollbackTransaction
		    System.DebugLog("Error resetting password: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerifyOTP(email As String, otp As String) As Dictionary
		  ' Returns dictionary with: success (Boolean), userID (Integer), token (String), error (String)
		  Var result As New Dictionary
		  
		  Try
		    Var sql As String = _
		    "SELECT prt.token_id, prt.token, prt.user_id, prt.otp " + _
		    "FROM password_reset_tokens prt " + _
		    "INNER JOIN users u ON prt.user_id = u.user_id " + _
		    "WHERE u.email = ? AND prt.otp = ? AND prt.expires_at > NOW() AND prt.is_used = FALSE " + _
		    "ORDER BY prt.created_at DESC LIMIT 1"
		    
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    
		    ps.Bind(0, email.Trim)
		    ps.Bind(1, otp.Trim)
		    
		    Var rs As RowSet = ps.SQLSelect
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      result.Value("success") = True
		      result.Value("userID") = rs.Column("user_id").IntegerValue
		      result.Value("token") = rs.Column("token").StringValue
		      result.Value("tokenID") = rs.Column("token_id").IntegerValue
		    Else
		      result.Value("success") = False
		      result.Value("error") = "Invalid or expired OTP"
		    End If
		    
		  Catch e As DatabaseException
		    result.Value("success") = False
		    result.Value("error") = e.Message
		    System.DebugLog("Error verifying OTP: " + e.Message)
		  End Try
		  
		  Return result
		End Function
	#tag EndMethod


End Module
#tag EndModule
