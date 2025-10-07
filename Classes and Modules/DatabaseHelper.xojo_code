#tag Module
Protected Module DatabaseHelper
	#tag Method, Flags = &h0
		Function GetCaseProgress(userID as Integer) As Dictionary
		  ' Returns a dictionary with case_id as key and completion status
		  Var progress As New Dictionary
		  
		  Var sql As String = "SELECT case_id, is_completed FROM user_responses WHERE user_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, userID)
		    
		    Var rs As RowSet = ps.SQLSelect
		    
		    While Not rs.AfterLastRow
		      progress.Value(rs.Column("case_id").IntegerValue) = rs.Column("is_completed").BooleanValue
		      rs.MoveToNextRow
		    Wend
		  Catch e As DatabaseException
		    System.DebugLog("Error getting case progress: " + e.Message)
		  End Try
		  
		  Return progress
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VerifyConnection() As Boolean
		  Try
		    If Session.DB = Nil Then Return False
		    If Not Session.DB.IsConnected Then
		      Return Session.DB.Connect
		    End If
		    Return True
		  Catch
		    Return False
		  End Try
		End Function
	#tag EndMethod


End Module
#tag EndModule
