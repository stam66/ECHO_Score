#tag Module
Protected Module DatabaseService
	#tag Method, Flags = &h0
		Function AuthenticateUser(email as String, password as String, db as MySQLCommunityServer) As User
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT primaryKey, name, email, role FROM users WHERE email = ? AND password_hash = SHA2(?, 256)", email, password)
		    If rs = Nil Or rs.RowCount = 0 Then Return Nil
		    
		    Var u As New User
		    u.ID = rs.Column("primaryKey").IntegerValue
		    u.Name = rs.Column("name").StringValue
		    u.Email = rs.Column("email").StringValue
		    u.Role = rs.Column("role").StringValue
		    Return u
		  Catch e As DatabaseException
		    System.DebugLog("Login error: " + e.Message)
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectToDatabase() As MySQLCommunityServer
		  var db as MySQLCommunityServer
		  db.Host = "127.0.0.1"
		  db.Port = 3306
		  db.DatabaseName = "ECHO_score"
		  db.UserName = "admin"
		  db.Password = "reject66"
		  
		  if db.connect then 
		    return db
		  else
		    System.Log(system.LogLevelCritical, "Unable to connect to database")
		    return nil
		  end If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreatePasswordReset(email as string, db as MySQLCommunityServer) As string
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT primaryKey FROM users WHERE email = ?", email)
		    If rs = Nil Or rs.RowCount = 0 Then Return ""
		    
		    Var userID As Integer = rs.Column("primaryKey").IntegerValue
		    Var token As String = GenerateToken
		    db.ExecuteSQL("INSERT INTO password_resets (user_id, token, expires_at) VALUES (?, ?, NOW() + INTERVAL 1 HOUR)", userID, token)
		    Return token
		  Catch e As DatabaseException
		    System.DebugLog("CreateReset error: " + e.Message)
		    Return ""
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateToken() As String
		  Var mb as MemoryBlock = Crypto.GenerateRandomBytes(16) // 128-bit
		  Return EncodeHex(mb)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCaseByID(id as Integer, db as MySQLCommunityServer) As EchoCase
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT * FROM cases WHERE primaryKey = ?", id)
		    If rs = Nil Or rs.RowCount = 0 Then Return Nil
		    
		    Var ec As New EchoCase
		    ec.ID = rs.Column("primaryKey").IntegerValue
		    ec.SerialNumber = rs.Column("serial_number").StringValue
		    ec.Description = rs.Column("description").StringValue
		    ec.VideoFileName = rs.Column("video_path").StringValue
		    
		    Var answers As New Dictionary
		    For Each field As String In Array("lv_size", "lv_function", "rv_size", "rv_function", "ao_stenosis", "ao_regurg", "mv_stenosis", "mv_regurg", "tv_stenosis", "tv_regurg", "pericardial", "ivc_abnormal", "requires_full_echo", "summary")
		      answers.Value(field) = rs.Column(field).Value
		    Next
		    ec.CorrectAnswers = answers
		    
		    Return ec
		  Catch e As DatabaseException
		    System.DebugLog("GetCaseByID error: " + e.Message)
		    Return Nil
		  End Try
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCaseBySerial(serial as string, db as MySQLCommunityServer) As EchoCase
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT * FROM cases WHERE serial_number = ?", serial)
		    If rs = Nil Or rs.RowCount = 0 Then Return Nil
		    Return GetCaseByID(rs.Column("primaryKey").IntegerValue, db)
		  Catch e As DatabaseException
		    System.DebugLog("GetCaseBySerial error: " + e.Message)
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResponsesForCase(caseID As Integer, db As MySQLCommunityServer) As RowSet
		  Try
		    Return db.SelectSQL("SELECT * FROM responses WHERE case_id = ?", caseID)
		  Catch e As DatabaseException
		    System.DebugLog("GetResponses error: " + e.Message)
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserByID(id as Integer, db as MySQLCommunityServer) As User
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT * FROM users WHERE primaryKey = ?", id)
		    If rs = Nil Or rs.RowCount = 0 Then Return Nil
		    
		    Var u As New User
		    u.ID = rs.Column("primaryKey").IntegerValue
		    u.Name = rs.Column("name").StringValue
		    u.Email = rs.Column("email").StringValue
		    u.Role = rs.Column("role").StringValue
		    u.Username = rs.Column("username").StringValue
		    Return u
		  Catch e As DatabaseException
		    System.DebugLog("GetUserByID error: " + e.Message)
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserByIUserName(username as string, db as MySQLCommunityServer) As User
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT * FROM users WHERE username = ?", username)
		    If rs = Nil Or rs.RowCount = 0 Then Return Nil
		    
		    Var u As New User
		    u.ID = rs.Column("primaryKey").IntegerValue
		    u.Name = rs.Column("name").StringValue
		    u.Email = rs.Column("email").StringValue
		    u.Role = rs.Column("role").StringValue
		    u.Username = rs.Column("username").StringValue
		    Return u
		  Catch e As DatabaseException
		    System.DebugLog("GetUserByID error: " + e.Message)
		    Return Nil
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetNewPassword(token as string, newPassword as string, db as MySQLCommunityServer) As Boolean
		  Try
		    Var rs As RowSet = db.SelectSQL("SELECT user_id FROM password_resets WHERE token = ? AND expires_at > NOW()", token)
		    If rs = Nil Or rs.RowCount = 0 Then Return False
		    
		    Var userID As Integer = rs.Column("user_id").IntegerValue
		    db.ExecuteSQL("UPDATE users SET password_hash = SHA2(?, 256) WHERE primaryKey = ?", newPassword, userID)
		    db.ExecuteSQL("DELETE FROM password_resets WHERE token = ?", token)
		    Return True
		  Catch e As DatabaseException
		    System.DebugLog("SetPassword error: " + e.Message)
		    Return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubmitResponse(userID As Integer, caseID As Integer, answers As Dictionary, score As Double, conclusion As String, db As MySQLCommunityServer)
		  Try
		    db.ExecuteSQL("REPLACE INTO responses (user_id, case_id, lv_size, lv_function, rv_size, rv_function, ao_stenosis, ao_regurg, mv_stenosis, mv_regurg, tv_stenosis, tv_regurg, pericardial, ivc_abnormal, requires_full_echo, conclusion, score, submitted_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())", _
		    userID, caseID, _
		    answers.Value("lv_size"), answers.Value("lv_function"), answers.Value("rv_size"), answers.Value("rv_function"), _
		    answers.Value("ao_stenosis"), answers.Value("ao_regurg"), answers.Value("mv_stenosis"), answers.Value("mv_regurg"), _
		    answers.Value("tv_stenosis"), answers.Value("tv_regurg"), answers.Value("pericardial"), answers.Value("ivc_abnormal"), _
		    answers.Value("requires_full_echo"), conclusion, score)
		  Catch e As DatabaseException
		    System.DebugLog("SubmitResponse error: " + e.Message)
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
