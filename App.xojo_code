#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Opening(args() As String)
		  Var appFolder As FolderItem = SpecialFolder.Documents.Child("ECHO_score")
		  if not appFolder.Exists then appFolder.CreateFolder
		  
		  videosFolder = appFolder.Child("Videos")
		  if not videosFolder.Exists then videosFolder.CreateFolder
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EnsureAppFoldersExist()
		  // check app and video folders exist
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		VideosFolder As FolderItem
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
