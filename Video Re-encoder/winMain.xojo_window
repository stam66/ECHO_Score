#tag DesktopWindow
Begin DesktopWindow winMain
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   False
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   500
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   746973183
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   False
   Title           =   "Video Re-Encoder for ECHOScore"
   Type            =   0
   Visible         =   True
   Width           =   700
   Begin DesktopButton btnBrowse
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Browse..."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   570
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin DesktopButton btnProcess
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Process"
      Default         =   True
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   95
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
   Begin DesktopTextArea txtStatus
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   340
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   660
   End
   Begin DesktopButton btnClear
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   627
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   95
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   53
   End
   Begin DesktopProgressBar prgBatch
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   100
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   475
      Transparent     =   False
      Value           =   50.0
      Visible         =   False
      Width           =   660
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopLabel lblInstruction
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Click browse or drag/drop a file or folder and then click the Process button"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   40
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   540
   End
   Begin DesktopTextField txtFilePath
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Drop file/folder here or click Browse..."
      Index           =   -2147483648
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   540
   End
   Begin DesktopLabel lblInfo
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Processed files are saved to new folder folderName_reencoded at same level as the containing folder"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   588
   End
   Begin DesktopButton Button1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Button"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   404
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As DragItem.Types)
		  #Pragma Unused action
		  
		  ' Handle drag and drop
		  If obj.FolderItemAvailable Then
		    Var item As FolderItem = obj.FolderItem
		    
		    If item = Nil Then Return
		    
		    mInputPath = item.NativePath
		    txtFilePath.text = mInputPath
		    btnProcess.Enabled = True
		    
		    If item.IsFolder Then
		      ' Folder dropped
		      UpdateStatus("Dropped folder: " + item.Name + EndOfLine)
		    Else
		      ' File dropped - check if it's a video
		      If IsVideoFile(item.Name) Then
		        UpdateStatus("Dropped: " + item.Name + EndOfLine)
		      Else
		        UpdateStatus("Not a video file" + EndOfLine)
		        btnProcess.Enabled = False
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  ' Find FFmpeg on system startup
		  mFFmpegPath = FindFFmpeg()
		  
		  If mFFmpegPath = "" Then
		    MessageBox("FFmpeg not found. Please install FFmpeg first." + EndOfLine + EndOfLine + _
		    "Mac: brew install ffmpeg" + EndOfLine + _
		    "Download: https://ffmpeg.org/download.html")
		    Self.Close
		    Return
		  End If
		  
		  If Not TestFFmpeg(mFFmpegPath) Then
		    MessageBox("FFmpeg found but cannot execute. Check permissions.")
		    Self.Close
		    Return
		  End If
		  
		  txtStatus.text = "FFmpeg: " + mFFmpegPath + EndOfLine + "Ready to encode" + EndOfLine
		  lblInfo.Visible = False
		  prgBatch.Visible = False
		  mProcessingCount = 0
		  mSuccessCount = 0
		  mFailCount = 0
		  
		  ' Enable drag and drop for files
		  ' Note: This will accept both files AND folders since folders are FolderItems too
		  Self.AcceptFileDrop("")  ' Empty string accepts all file types
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EncodeFile(inputFile As FolderItem, outputFolder As FolderItem)
		  mProcessingCount = mProcessingCount + 1
		  
		  ' Use original filename in the output folder
		  Var outputPath As String = outputFolder.NativePath + "/" + inputFile.Name
		  Var outputFile As FolderItem = New FolderItem(outputPath, FolderItem.PathModes.Native)
		  
		  ' Check if already exists
		  If outputFile.Exists Then
		    UpdateStatus("SKIP - " + inputFile.Name + " (already exists)" + EndOfLine)
		    mFailCount = mFailCount + 1
		    Return
		  End If
		  
		  UpdateStatus(inputFile.Name + "... ")
		  
		  ' Build FFmpeg command
		  Var cmd As String = mFFmpegPath + " -i """ + inputFile.NativePath + """" + _
		  " -c:v libx264 -profile:v baseline -level 3.0" + _
		  " -pix_fmt yuv420p -r 30" + _
		  " -movflags +faststart" + _
		  " -y """ + outputPath + """"
		  
		  ' Execute FFmpeg
		  Var sh As New Shell
		  sh.Execute(cmd)
		  
		  ' Check if output was created
		  Var checkOutput As FolderItem = New FolderItem(outputPath, FolderItem.PathModes.Native)
		  If checkOutput <> Nil And checkOutput.Exists Then
		    Var sizeMB As Double = checkOutput.Length / 1024.0 / 1024.0
		    UpdateStatus("✓ (" + Str(sizeMB) + " MB)" + EndOfLine)
		    mSuccessCount = mSuccessCount + 1
		  Else
		    UpdateStatus("✗ FAILED" + EndOfLine)
		    mFailCount = mFailCount + 1
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EncodeFolder(folder As FolderItem)
		  UpdateStatus("Processing folder: " + folder.Name + EndOfLine)
		  
		  ' Get all video files
		  Var videoFiles() As FolderItem = GetVideoFiles(folder)
		  
		  If videoFiles.Count = 0 Then
		    UpdateStatus("  No video files found" + EndOfLine)
		    Return
		  End If
		  
		  ' Create output folder as sibling to input folder
		  Var parentFolder As FolderItem = folder.Parent
		  Var outputFolderName As String = folder.Name + "_reencoded"
		  Var outputFolder As FolderItem = parentFolder.Child(outputFolderName)
		  
		  ' Create the output folder if it doesn't exist
		  If Not outputFolder.Exists Then
		    Try
		      outputFolder.CreateFolder
		      UpdateStatus("  Created output folder: " + outputFolder.NativePath + EndOfLine)
		    Catch e As IOException
		      UpdateStatus("  ERROR: Could not create output folder" + EndOfLine)
		      Return
		    End Try
		  Else
		    UpdateStatus("  Using existing folder: " + outputFolder.NativePath + EndOfLine)
		  End If
		  
		  mTotalFiles = videoFiles.Count
		  UpdateStatus("  Found " + Str(videoFiles.Count) + " video file(s)" + EndOfLine + EndOfLine)
		  
		  ' Show and setup progress bar
		  prgBatch.Visible = True
		  prgBatch.MaximumValue = mTotalFiles
		  prgBatch.Value = 0
		  
		  Var currentFile As Integer = 0
		  
		  For Each videoFile As FolderItem In videoFiles
		    currentFile = currentFile + 1
		    
		    ' Update progress
		    prgBatch.Value = currentFile
		    
		    ' Update status with current file number
		    UpdateStatus("File " + Str(currentFile) + " of " + Str(mTotalFiles) + ": ")
		    
		    ' Encode the file to output folder
		    EncodeFile(videoFile, outputFolder)
		  Next
		  
		  ' Hide progress bar when done
		  prgBatch.Visible = False
		  
		  UpdateStatus(EndOfLine + "All files saved to: " + outputFolder.NativePath + EndOfLine)
		  
		  ShowSummary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFFmpeg() As String
		  ' Try common FFmpeg locations
		  Var locations() As String
		  locations.Add("/opt/homebrew/bin/ffmpeg")  ' Apple Silicon
		  locations.Add("/usr/local/bin/ffmpeg")     ' Intel Mac
		  locations.Add("C:\Program Files\ffmpeg\bin\ffmpeg.exe")  ' Windows
		  locations.Add("C:\ffmpeg\bin\ffmpeg.exe")
		  
		  For Each path As String In locations
		    Var f As FolderItem = New FolderItem(path, FolderItem.PathModes.Native)
		    If f <> Nil And f.Exists Then
		      Return path
		    End If
		  Next
		  
		  ' Try using 'which' on Mac/Linux
		  #If TargetMacOS Or TargetLinux Then
		    Var sh As New Shell
		    sh.Execute("which ffmpeg")
		    Var result As String = sh.Result.Trim
		    If result <> "" Then
		      Var f As FolderItem = New FolderItem(result, FolderItem.PathModes.Native)
		      If f <> Nil And f.Exists Then
		        Return result
		      End If
		    End If
		  #EndIf
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVideoFiles(folder As FolderItem) As FolderItem()
		  Var result() As FolderItem
		  
		  For Each item As FolderItem In folder.Children
		    If item = Nil Then Continue
		    
		    ' Skip hidden files
		    If item.Name.Left(1) = "." Then Continue
		    
		    ' Skip folders
		    If item.IsFolder Then Continue
		    
		    ' Check if video file
		    If IsVideoFile(item.Name) Then
		      result.Add(item)
		    End If
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsVideoFile(filename As String) As Boolean
		  Var ext As String = filename.Right(4).Lowercase
		  
		  Select Case ext
		  Case ".mp4", ".mov", ".avi", ".mpg", ".m4v"
		    Return True
		  Case Else
		    ' Check for .mpeg and .webm
		    If filename.Lowercase.EndsWith(".mpeg") Or filename.Lowercase.EndsWith(".webm") Then
		      Return True
		    End If
		  End Select
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetStatus()
		  txtStatus.Text = "Processing..." + EndOfLine
		  mProcessingCount = 0
		  mSuccessCount = 0
		  mFailCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowSummary()
		  UpdateStatus(EndOfLine + "====== SUMMARY ======" + EndOfLine)
		  UpdateStatus("Processed: " + str(mProcessingCount) + " file(s)" + EndOfLine)
		  UpdateStatus("Success: " + str(mSuccessCount) + EndOfLine)
		  If mFailCount > 0 Then
		    UpdateStatus("Failed/Skipped: " + str(mFailCount) + EndOfLine)
		  End If
		  UpdateStatus("=====================" + EndOfLine)
		  
		  ' Reset counters
		  mProcessingCount = 0
		  mSuccessCount = 0
		  mFailCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestFFmpeg(path As String) As Boolean
		  Try
		    Var sh As New Shell
		    sh.Execute(path + " -version")
		    
		    If sh.ExitCode = 0 And sh.Result.IndexOf("ffmpeg version") >= 0 Then
		      Return True
		    End If
		  Catch
		    Return False
		  End Try
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateStatus(message As String)
		  txtStatus.Text = txtStatus.Text + message
		  txtStatus.VerticalScrollPosition = 100000
		  
		  ' Force UI update
		  App.DoEvents()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mFailCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mFFmpegPath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mInputPath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mProcessingCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mSuccessCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mTotalFiles As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events btnBrowse
	#tag Event
		Sub Pressed()
		  Var dlg As New SelectFolderDialog
		  dlg.ActionButtonCaption = "Select"
		  dlg.Title = "Select Video File or Folder"
		  dlg.PromptText = "Choose a video file or folder containing videos:"
		  
		  ' Show both file and folder options via message dialog
		  Var md As New MessageDialog
		  md.Message = "Select:"
		  md.ActionButton.Caption = "Video File"
		  md.AlternateActionButton.Caption = "Folder"
		  md.AlternateActionButton.Visible = True
		  md.CancelButton.Visible = True
		  
		  Var result As MessageDialogButton = md.ShowModal
		  
		  If result = md.ActionButton Then
		    ' Select file
		    Var dlgFile As New OpenDialog
		    dlgFile.Title = "Select Video File"
		    dlgFile.Filter = "*.mp4; *.mov; *.avi; *.mpg; *.mpeg; *.m4v; *.webm"
		    
		    Var f As FolderItem = dlgFile.ShowModal
		    If f <> Nil Then
		      mInputPath = f.NativePath
		      txtFilePath.text = mInputPath
		      btnProcess.Enabled = True
		    End If
		    
		  ElseIf result = md.AlternateActionButton Then
		    ' Select folder
		    Var folder As FolderItem = dlg.ShowModal
		    If folder <> Nil Then
		      mInputPath = folder.NativePath
		      txtFilePath.text = mInputPath
		      btnProcess.Enabled = True
		    End If
		  End If
		  
		  lblInfo.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnProcess
	#tag Event
		Sub Pressed()
		  If mInputPath = "" Then
		    UpdateStatus("Please select a file or folder first" + EndOfLine)
		    Return
		  End If
		  
		  btnProcess.Enabled = False
		  btnBrowse.Enabled = False
		  prgBatch.Visible = False
		  
		  ResetStatus()
		  
		  Var item As FolderItem = New FolderItem(mInputPath, FolderItem.PathModes.Native)
		  
		  If item.IsFolder Then
		    ' Batch process folder
		    EncodeFolder(item)
		  Else
		    ' Single file - create output folder as sibling to parent folder
		    ' Input file:  /Users/stam/Videos/test.mp4
		    ' Output file: /Users/stam/Videos_reencoded/test.mp4
		    
		    Var parentFolder As FolderItem = item.Parent
		    Var grandParentFolder As FolderItem = parentFolder.Parent
		    
		    Var outputFolderName As String = parentFolder.Name + "_reencoded"
		    Var outputFolder As FolderItem = grandParentFolder.Child(outputFolderName)
		    
		    ' Create output folder if it doesn't exist
		    If Not outputFolder.Exists Then
		      Try
		        outputFolder.CreateFolder
		        UpdateStatus("Created output folder: " + outputFolder.NativePath + EndOfLine + EndOfLine)
		      Catch e As IOException
		        UpdateStatus("ERROR: Could not create output folder" + EndOfLine)
		        btnProcess.Enabled = True
		        btnBrowse.Enabled = True
		        Return
		      End Try
		    Else
		      UpdateStatus("Using existing folder: " + outputFolder.NativePath + EndOfLine + EndOfLine)
		    End If
		    
		    ' Encode single file
		    EncodeFile(item, outputFolder)
		    UpdateStatus(EndOfLine + "File saved to: " + outputFolder.NativePath + EndOfLine)
		    ShowSummary()
		  End If
		  
		  btnProcess.Enabled = True
		  btnBrowse.Enabled = True
		  lblInfo.Visible = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClear
	#tag Event
		Sub Pressed()
		  txtFilePath.text = ""
		  mInputPath = ""
		  txtStatus.text = "Ready" + EndOfLine
		  btnProcess.Enabled = False
		  mProcessingCount = 0
		  mSuccessCount = 0
		  mFailCount = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Pressed()
		  txtStatus.VerticalScrollPosition = 100000
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mFFmpegPath"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mFailCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mInputPath"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="mProcessingCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mSuccessCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mTotalFiles"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
