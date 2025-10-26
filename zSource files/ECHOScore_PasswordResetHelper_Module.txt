' =============================================================================
' PasswordResetHelper Module - Complete Updated Version
' Handles password reset token and OTP generation and validation
' =============================================================================

' Insert → Module
' Name: PasswordResetHelper

' GenerateToken Method - Generate secure random token
Function GenerateToken() As String
  Var crypto As New Crypto
  Var bytes As MemoryBlock = crypto.GenerateRandomBytes(32)
  Return EncodeHex(bytes)
End Function

' GenerateOTP Method - Generate 6-digit numeric OTP
Function GenerateOTP() As String
  Var r As New Random
  Var otp As Integer = r.InRange(100000, 999999)
  Return Format(otp, "000000")
End Function

' CreatePasswordResetRequest Method - Create new password reset request
Function CreatePasswordResetRequest(userID As Integer, ipAddress As String) As Dictionary
  Var result As New Dictionary
  
  Try
    ' Generate token and OTP
    Var token As String = GenerateToken()
    Var otp As String = GenerateOTP()
    
    ' Calculate expiration (15 minutes from now)
    Var expiresAt As DateTime = DateTime.Now
    expiresAt = expiresAt.AddInterval(0, 0, 0, 0, 15, 0)
    
    ' Insert into database
    Var sql As String = "INSERT INTO password_reset_tokens (user_id, token, otp, expires_at, ip_address) VALUES (?, ?, ?, ?, ?)"
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
    
    ps.ExecuteSQL
    
    result.Value("success") = True
    result.Value("token") = token
    result.Value("otp") = otp
    
  Catch e As DatabaseException
    System.DebugLog("Error creating password reset request: " + e.Message)
    result.Value("success") = False
    result.Value("error") = e.Message
  End Try
  
  Return result
End Function

' ValidateOTP Method - Validate OTP and return token if valid
Function ValidateOTP(userID As Integer, otp As String) As Dictionary
  Var result As New Dictionary
  
  Try
    ' Check for valid, non-expired, unused token with matching OTP
    Var sql As String = "SELECT token, expires_at FROM password_reset_tokens WHERE user_id = ? AND otp = ? AND is_used = FALSE AND expires_at > NOW() ORDER BY created_at DESC LIMIT 1"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    
    ps.Bind(0, userID)
    ps.Bind(1, otp)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      result.Value("success") = True
      result.Value("token") = rs.Column("token").StringValue
    Else
      result.Value("success") = False
      result.Value("error") = "Invalid or expired OTP"
    End If
    
  Catch e As DatabaseException
    System.DebugLog("Error validating OTP: " + e.Message)
    result.Value("success") = False
    result.Value("error") = e.Message
  End Try
  
  Return result
End Function

' ValidateToken Method - Validate token for password reset
Function ValidateToken(token As String) As Dictionary
  Var result As New Dictionary
  
  Try
    ' Check for valid, non-expired, unused token
    Var sql As String = "SELECT user_id, expires_at FROM password_reset_tokens WHERE token = ? AND is_used = FALSE AND expires_at > NOW()"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, token)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      result.Value("success") = True
      result.Value("user_id") = rs.Column("user_id").IntegerValue
    Else
      result.Value("success") = False
      result.Value("error") = "Invalid or expired token"
    End If
    
  Catch e As DatabaseException
    System.DebugLog("Error validating token: " + e.Message)
    result.Value("success") = False
    result.Value("error") = e.Message
  End Try
  
  Return result
End Function

' MarkTokenAsUsed Method - Mark token as used after password reset
Function MarkTokenAsUsed(token As String) As Boolean
  Try
    Var sql As String = "UPDATE password_reset_tokens SET is_used = TRUE, used_at = NOW() WHERE token = ?"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, token)
    
    ps.ExecuteSQL
    Return True
    
  Catch e As DatabaseException
    System.DebugLog("Error marking token as used: " + e.Message)
    Return False
  End Try
End Function

' CleanupExpiredTokens Method - Delete expired tokens (run periodically)
Sub CleanupExpiredTokens()
  Try
    Var sql As String = "DELETE FROM password_reset_tokens WHERE expires_at < NOW() OR (is_used = TRUE AND used_at < DATE_SUB(NOW(), INTERVAL 1 DAY))"
    Session.DB.ExecuteSQL(sql)
    System.DebugLog("Expired password reset tokens cleaned up")
  Catch e As DatabaseException
    System.DebugLog("Error cleaning up tokens: " + e.Message)
  End Try
End Sub

' GetUserByEmail Method - Get user ID and name by email
Function GetUserByEmail(email As String) As Dictionary
  Var result As New Dictionary
  
  Try
    Var sql As String = "SELECT user_id, full_name FROM users WHERE email = ?"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, email)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      result.Value("success") = True
      result.Value("user_id") = rs.Column("user_id").IntegerValue
      result.Value("full_name") = rs.Column("full_name").StringValue
    Else
      result.Value("success") = False
      result.Value("error") = "Email not found"
    End If
    
  Catch e As DatabaseException
    System.DebugLog("Error getting user by email: " + e.Message)
    result.Value("success") = False
    result.Value("error") = e.Message
  End Try
  
  Return result
End Function

' ResetPassword Method - Update user password
Function ResetPassword(userID As Integer, newPassword As String) As Boolean
  Try
    Var sql As String = "UPDATE users SET password_hash = SHA2(?, 256) WHERE user_id = ?"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, newPassword)
    ps.Bind(1, userID)
    
    ps.ExecuteSQL
    Return True
    
  Catch e As DatabaseException
    System.DebugLog("Error resetting password: " + e.Message)
    Return False
  End Try
End Function

' =============================================================================
' PasswordResetHelper Module Change Summary:
' =============================================================================
' 
' KEY FEATURES:
' 
' 1. SECURE TOKEN GENERATION:
'    - GenerateToken() creates 64-character hex token
'    - Uses Crypto.GenerateRandomBytes() for cryptographic security
'    - Tokens are unique and unpredictable
' 
' 2. OTP GENERATION:
'    - GenerateOTP() creates 6-digit numeric code
'    - Easy for users to type
'    - Format ensures leading zeros (e.g., "012345")
' 
' 3. PASSWORD RESET WORKFLOW:
'    - CreatePasswordResetRequest() creates new reset request
'    - ValidateOTP() checks OTP and returns token
'    - ValidateToken() checks token before password reset
'    - MarkTokenAsUsed() prevents reuse
'    - ResetPassword() updates user password
' 
' 4. SECURITY FEATURES:
'    - 15-minute expiration for tokens
'    - One-time use tokens
'    - IP address tracking
'    - Automatic cleanup of expired tokens
' 
' 5. USER LOOKUP:
'    - GetUserByEmail() finds user by email address
'    - Returns user_id and full_name for email personalization
' 
' =============================================================================
' Complete Password Reset Flow:
' =============================================================================
' 
' STEP 1 - User requests password reset (wc_ForgotPassword):
'   Var userInfo As Dictionary = PasswordResetHelper.GetUserByEmail(txtEmail.Text)
'   If userInfo.Value("success") Then
'     Var userID As Integer = userInfo.Value("user_id")
'     Var userName As String = userInfo.Value("full_name")
'     
'     Var resetInfo As Dictionary = PasswordResetHelper.CreatePasswordResetRequest(userID, Request.RemoteAddress)
'     If resetInfo.Value("success") Then
'       Var otp As String = resetInfo.Value("otp")
'       EmailHelper.SendPasswordResetEmail(txtEmail.Text, userName, otp)
'       ' Navigate to OTP entry screen
'     End If
'   End If
' 
' STEP 2 - User enters OTP (wc_EnterOTP):
'   Var result As Dictionary = PasswordResetHelper.ValidateOTP(mUserID, txtOTP.Text)
'   If result.Value("success") Then
'     Var token As String = result.Value("token")
'     ' Navigate to new password screen with token
'   Else
'     MessageBox("Invalid or expired OTP")
'   End If
' 
' STEP 3 - User sets new password (wc_NewPassword):
'   Var result As Dictionary = PasswordResetHelper.ValidateToken(mToken)
'   If result.Value("success") Then
'     Var userID As Integer = result.Value("user_id")
'     
'     If PasswordResetHelper.ResetPassword(userID, txtNewPassword.Text) Then
'       PasswordResetHelper.MarkTokenAsUsed(mToken)
'       MessageBox("Password reset successfully")
'       ' Navigate to login
'     End If
'   End If
' 
' =============================================================================
' Maintenance:
' =============================================================================
' 
' CLEANUP EXPIRED TOKENS (run daily):
'   ' Add to a Timer or scheduled task
'   PasswordResetHelper.CleanupExpiredTokens()
' 
' =============================================================================
' Notes:
' =============================================================================
' 
' 1. OTP expires in 15 minutes for security
' 2. Tokens are one-time use only
' 3. IP address tracking helps detect abuse
' 4. SHA2-256 hashing for passwords
' 5. All methods return Dictionary with success/error info
' 6. Debug logging helps troubleshoot issues
' 
' =============================================================================
