#tag Class
Protected Class EchoCase
	#tag Method, Flags = &h0
		Sub LoadVideos(db As MySQLCommunityServer)
		  
		  Videos.RemoveAll
		  
		  Var rs As RowSet = db.SelectSQL("SELECT filename, label, description FROM videos WHERE case_id = ?", ID)
		  If rs = Nil Then Return
		  
		  For Each row As DatabaseRow In rs
		    Var v As New CaseVideo
		    v.VideoFile = App.VideosFolder.Child(row.Column("filename").StringValue)
		    v.Label = row.Column("label").StringValue
		    v.Description = row.Column("description").StringValue
		    Videos.Add(v)
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CorrectAnswers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialNumber As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VideoFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Videos() As CaseVideo
	#tag EndProperty


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
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
