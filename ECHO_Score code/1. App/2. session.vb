' =============================================================================
' Session Class
' Manages global application state and database connection
' =============================================================================

' ******************************************************************
' Properties:
' ******************************************************************
Public MainShell As wp_MainShell
Public Navigation As WebNavigationManager
Public CurrentUserID As Integer = 0
Public CurrentUserName As String = ""
Public CurrentUserEmail As String = ""
Public IsAdmin As Boolean = False
Public DB As MySQLCommunityServer
Public LastCreatedCaseGroup As String = ""
Public CurrentVideoFile As WebFile  ' Holds the currently served video file to keep it alive

' ******************************************************************
' Session.Opening Event
' ******************************************************************
Sub Opening(args() As String)
  #Pragma Unused args
  
  ' Initialize database connection
  DB = New MySQLCommunityServer
  DB.Host = "127.0.0.1"
  DB.Port = 3306
  DB.DatabaseName = "echoscore"
  DB.UserName = "root"
  DB.Password = "your_mysql_root_password"  ' UPDATE THIS
  
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

' *******************************************************************************
' Method: ServeVideo
'   Parameters: filename As String
'   Return Type: WebFile
' *******************************************************************************
Function ServeVideo(filename As String) As WebFile
  Var videoFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
  System.DebugLog("Video folder path: " + videoFolder.NativePath)
  
  If Not videoFolder.Exists Then
    System.DebugLog("Video folder does not exist")
    Return Nil
  End If
  
  System.DebugLog("Video folder exists: YES")
  
  Var videoFile As FolderItem = videoFolder.Child(filename)
  System.DebugLog("Looking for video: " + videoFile.NativePath)
  
  If Not videoFile.Exists Then
    System.DebugLog("Video file does not exist")
    Return Nil
  End If
  
  System.DebugLog("Video file exists: YES")
  System.DebugLog("Video file size: " + Str(videoFile.Length) + " bytes")
  
  Try
    Var bs As BinaryStream = BinaryStream.Open(videoFile)
    Var fileSize As Int64 = videoFile.Length
    Var videoData As MemoryBlock = bs.Read(fileSize)
    bs.Close
    
    ' Create WebFile and store it in Session to keep it alive
    CurrentVideoFile = New WebFile
    CurrentVideoFile.Data = videoData
    CurrentVideoFile.Filename = filename
    CurrentVideoFile.MIMEType = "video/mp4"
    CurrentVideoFile.ForceDownload = False
    
    System.DebugLog("WebFile URL: " + CurrentVideoFile.URL)
    System.DebugLog("WebFile data size: " + Str(CurrentVideoFile.Data.Size) + " bytes")
    
    Return CurrentVideoFile
    
  Catch e As IOException
    System.DebugLog("Error reading video file: " + e.Message)
    Return Nil
  End Try
End Function


' =============================================================================
' Notes:
' * Update DB.Password with your actual MySQL root password
' * Videos are stored in Documents/CaseVideos/
' * ServeVideo method creates browser-accessible URLs for video playback
' * Navigation system uses WebNavigationManager for container management
' =============================================================================