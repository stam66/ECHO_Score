#tag Class
Protected Class Session
Inherits WebSession
#tag Session
  interruptmessage=We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect.
  disconnectmessage=You have been disconnected from this application.
  confirmmessage=
  AllowTabOrderWrap=True
  ColorMode=0
  SendEventsInBatches=False
#tag EndSession
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' Session.opening event
		  ' *******************************************************************************
		  
		  ' Initialize database connection
		  DB = New MySQLCommunityServer
		  DB.Host = "127.0.0.1"
		  DB.Port = 3306
		  DB.DatabaseName = "echoscore"
		  DB.UserName = "admin"
		  DB.Password = "reject66"  ' UPDATE THIS
		  
		  Try
		    If Not DB.Connect Then
		      MessageBox("Database connection failed: " + DB.ErrorMessage)
		      Return
		    End If
		    
		    System.DebugLog("Database connected successfully")
		    
		  Catch e As RuntimeException
		    MessageBox("Database error: " + e.Message)
		    Return
		  End Try
		  
		  ' Ensure CaseVideos folder exists
		  Var videoFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
		  If Not videoFolder.Exists Then
		    videoFolder.CreateFolder
		    System.DebugLog("Created CaseVideos folder: " + videoFolder.NativePath)
		  End If
		  
		  ' Initialize main shell and navigation
		  MainShell = New wp_MainShell
		  MainShell.Show
		  Navigation = New WebNavigationManager(MainShell)
		  
		  ' Navigate to login screen
		  Var w As New wc_Login
		  w.ContainerID = "Login"
		  w.Position = wc_Base.PositionEnum.Center
		  Navigation.NavigateTo(w)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ServeVideo(filename As String) As WebFile
		  ' *******************************************************************************
		  ' Method: ServeVideo
		  '   Parameters: filename As String
		  '   Return Type: WebFile
		  ' *******************************************************************************
		  
		  Try
		    Var videoFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
		    
		    System.DebugLog("Video folder path: " + videoFolder.NativePath)
		    System.DebugLog("Video folder exists: " + If(videoFolder.Exists, "YES", "NO"))
		    
		    If Not videoFolder.Exists Then
		      System.DebugLog("CaseVideos folder does not exist")
		      Return Nil
		    End If
		    
		    Var videoFile As FolderItem = videoFolder.Child(filename)
		    System.DebugLog("Looking for video: " + videoFile.NativePath)
		    System.DebugLog("Video file exists: " + If(videoFile.Exists, "YES", "NO"))
		    
		    If Not videoFile.Exists Then
		      System.DebugLog("Video file not found: " + filename)
		      Return Nil
		    End If
		    
		    System.DebugLog("Video file size: " + Str(videoFile.Length) + " bytes")
		    
		    ' Read file contents into MemoryBlock
		    Var stream As BinaryStream = BinaryStream.Open(videoFile)
		    Var videoData As MemoryBlock = stream.Read(stream.Length)
		    stream.Close
		    
		    ' Create WebFile for streaming
		    Var wf As New WebFile
		    wf.Data = videoData 
		    wf.MIMEType = "video/mp4"
		    wf.Filename = filename
		    wf.ForceDownload = False
		    
		    System.DebugLog("WebFile URL: " + wf.URL)
		    
		    Return wf
		    
		  Catch e As IOException
		    System.DebugLog("Error serving video: " + e.Message)
		    Return Nil
		  End Try
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentUserEmail As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentUserID As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentUserName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DB As MySQLCommunityServer
	#tag EndProperty

	#tag Property, Flags = &h0
		IsAdmin As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		MainShell As wp_MainShell
	#tag EndProperty

	#tag Property, Flags = &h0
		Navigation As WebNavigationManager
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Hashtag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageRightToLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleFactor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserTimeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_baseurl"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue="You have been disconnected from this application."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InterruptionMessage"
			Visible=true
			Group="Behavior"
			InitialValue="We are having trouble communicating with the server. Please wait a moment while we attempt to reconnect."
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_LastMessageTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabOrderWrap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmDisconnectMessage"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Platform"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClientWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColorMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="WebSession.ColorModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Auto"
				"1 - Light"
				"2 - Dark"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserPrefersDarkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendEventsInBatches"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DB"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="MySQLCommunityServer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentUserID"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentUserName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsAdmin"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentUserEmail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
