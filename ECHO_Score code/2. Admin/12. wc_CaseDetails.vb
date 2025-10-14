' =============================================================================
' wc_CaseDetails WebContainer (PART 1 - Properties and Layout)
' Detailed case editor with video management (Screen 2 of 2)
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseDetails
' Super: wc_Base

' ******************************************************************
' Properties:
' ******************************************************************
Public CaseID As Integer
Private mOriginalCellValue As String
Private mLastVideoID As Integer
Private mLastColumn As Integer
Private mLastOldValue As String
Private mLastNewValue As String
Private mCaseInfoChanged As Boolean = False
Private mAnswersChanged As Boolean = False

' ******************************************************************
' Controls:
' ******************************************************************
' CASE INFO SECTION (Top):
' Label: lblCaseInfo (text: "Case Information", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblLabel (text: "Description:")
' TextField: txtCaseLabel (ReadOnly = False, Editable = True)

' CORRECT ANSWERS SECTION:
' Label: lblCorrectAnswers (text: "Correct Answers", Bold)
' CheckBox: chkLVSizeDilated (text: "LV Size - Dilated")
' CheckBox: chkLVFunctionImpaired (text: "LV Function - Significantly Impaired")
' CheckBox: chkRVSizeDilated (text: "RV Size - Dilated")
' CheckBox: chkRVFunctionImpaired (text: "RV Function - Significantly Impaired")
' CheckBox: chkAorticStenosis (text: "Aortic Valve - Significant Stenosis")
' CheckBox: chkAorticRegurgitation (text: "Aortic Valve - Significant Regurgitation")
' CheckBox: chkMitralStenosis (text: "Mitral Valve - Significant Stenosis")
' CheckBox: chkMitralRegurgitation (text: "Mitral Valve - Significant Regurgitation")
' CheckBox: chkTricuspidStenosis (text: "Tricuspid Valve - Significant Stenosis")
' CheckBox: chkTricuspidRegurgitation (text: "Tricuspid Valve - Significant Regurgitation")
' CheckBox: chkPericardialEffusion (text: "Pericardium - Significant Effusion")
' CheckBox: chkIVCHighPressure (text: "IVC - High RA Pressure")
' Label: lblCorrectConclusions (text: "Correct Conclusions:")
' TextArea: txtCorrectConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?")

' SAVE/CANCEL SECTION (Bottom of page):
' PushButton: btnSaveAll (text: "Save All Changes", Large, Primary style)
' PushButton: btnCancelChanges (text: "Cancel Changes")

' VIDEOS SECTION:
' Label: lblVideos (text: "Case Videos", Bold)
' Label: lblVideoInstructions (text: "Click 'Choose File' to select video, then click 'Upload'. Double-click cells to edit. Use commas to separate multiple groups (e.g., 'Cardiology 2025 Q1,ICU 2025 Q1')")
' ListBox: lstVideos (4 columns: Filename, View Description, Purpose, Order)
'   - Set ColumnTypeAt(1) = TextField (editable)
'   - Set ColumnTypeAt(2) = TextField (editable)
'   - Set ColumnTypeAt(3) = TextField (editable)
' WebFileUploader: uplVideo (AllowMultipleFiles = False, Filter = "video/mp4,video/*")
' PushButton: btnStartUpload (text: "Upload Selected Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnUndoVideoEdit (text: "Undo Last Change", Enabled = False)

' VIDEO PREVIEW SECTION:
' Label: lblVideoPreview (text: "Video Preview", Bold)
' HTMLViewer: htmlVideoPreview

' NAVIGATION:
' PushButton: btnBackToList (text: "Back to Case List")

' ******************************************************************
' wc_CaseDetails.Opening Event
' ******************************************************************
Sub Opening()
  ' Configure editable columns in video listbox
  lstVideos.ColumnTypeAt(1) = ListBox.CellTypes.TextField
  lstVideos.ColumnTypeAt(2) = ListBox.CellTypes.TextField
  lstVideos.ColumnTypeAt(3) = ListBox.CellTypes.TextField
  
  LoadCaseDetails
  LoadCaseVideos
  mCaseInfoChanged = False
  mAnswersChanged = False
  btnUndoVideoEdit.Enabled = False
  btnStartUpload.Enabled = False  ' Disabled until file is selected
End Sub

' ******************************************************************
' LoadCaseDetails Method
' ******************************************************************
Sub LoadCaseDetails()
  Var sql As String = "SELECT * FROM cases WHERE case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      txtSerialNumber.Text = rs.Column("serial_number").StringValue
      txtCaseLabel.Text = rs.Column("case_label").StringValue
      
      ' Load checkbox values (may be NULL/indeterminate)
      If rs.Column("lv_size_dilated").Value = Nil Then
        chkLVSizeDilated.Indeterminate = True
      Else
        chkLVSizeDilated.Value = rs.Column("lv_size_dilated").BooleanValue
        chkLVSizeDilated.Indeterminate = False
      End If
      
      If rs.Column("lv_function_impaired").Value = Nil Then
        chkLVFunctionImpaired.Indeterminate = True
      Else
        chkLVFunctionImpaired.Value = rs.Column("lv_function_impaired").BooleanValue
        chkLVFunctionImpaired.Indeterminate = False
      End If
      
      If rs.Column("rv_size_dilated").Value = Nil Then
        chkRVSizeDilated.Indeterminate = True
      Else
        chkRVSizeDilated.Value = rs.Column("rv_size_dilated").BooleanValue
        chkRVSizeDilated.Indeterminate = False
      End If
      
      If rs.Column("rv_function_impaired").Value = Nil Then
        chkRVFunctionImpaired.Indeterminate = True
      Else
        chkRVFunctionImpaired.Value = rs.Column("rv_function_impaired").BooleanValue
        chkRVFunctionImpaired.Indeterminate = False
      End If
      
      If rs.Column("aortic_stenosis_significant").Value = Nil Then
        chkAorticStenosis.Indeterminate = True
      Else
        chkAorticStenosis.Value = rs.Column("aortic_stenosis_significant").BooleanValue
        chkAorticStenosis.Indeterminate = False
      End If
      
      If rs.Column("aortic_regurgitation_significant").Value = Nil Then
        chkAorticRegurgitation.Indeterminate = True
      Else
        chkAorticRegurgitation.Value = rs.Column("aortic_regurgitation_significant").BooleanValue
        chkAorticRegurgitation.Indeterminate = False
      End If
      
      If rs.Column("mitral_stenosis_significant").Value = Nil Then
        chkMitralStenosis.Indeterminate = True
      Else
        chkMitralStenosis.Value = rs.Column("mitral_stenosis_significant").BooleanValue
        chkMitralStenosis.Indeterminate = False
      End If
      
      If rs.Column("mitral_regurgitation_significant").Value = Nil Then
        chkMitralRegurgitation.Indeterminate = True
      Else
        chkMitralRegurgitation.Value = rs.Column("mitral_regurgitation_significant").BooleanValue
        chkMitralRegurgitation.Indeterminate = False
      End If
      
      If rs.Column("tricuspid_stenosis_significant").Value = Nil Then
        chkTricuspidStenosis.Indeterminate = True
      Else
        chkTricuspidStenosis.Value = rs.Column("tricuspid_stenosis_significant").BooleanValue
        chkTricuspidStenosis.Indeterminate = False
      End If
      
      If rs.Column("tricuspid_regurgitation_significant").Value = Nil Then
        chkTricuspidRegurgitation.Indeterminate = True
      Else
        chkTricuspidRegurgitation.Value = rs.Column("tricuspid_regurgitation_significant").BooleanValue
        chkTricuspidRegurgitation.Indeterminate = False
      End If
      
      If rs.Column("pericardial_effusion_significant").Value = Nil Then
        chkPericardialEffusion.Indeterminate = True
      Else
        chkPericardialEffusion.Value = rs.Column("pericardial_effusion_significant").BooleanValue
        chkPericardialEffusion.Indeterminate = False
      End If
      
      If rs.Column("ivc_high_ra_pressure").Value = Nil Then
        chkIVCHighPressure.Indeterminate = True
      Else
        chkIVCHighPressure.Value = rs.Column("ivc_high_ra_pressure").BooleanValue
        chkIVCHighPressure.Indeterminate = False
      End If
      
      txtCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      
      If rs.Column("requires_full_echo").Value = Nil Then
        chkRequiresFullEcho.Indeterminate = True
      Else
        chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
        chkRequiresFullEcho.Indeterminate = False
      End If
    End If
  Catch e As DatabaseException
    MessageBox("Error loading case details: " + e.Message)
  End Try
End Sub


' =============================================================================
' wc_CaseDetails WebContainer (PART 2 - Video Management)
' Continued from Part 1
' =============================================================================

' ******************************************************************
' LoadCaseVideos Method (WITH PURPOSE COLUMN)
' ******************************************************************
Sub LoadCaseVideos()
  lstVideos.RemoveAllRows
  
  Var sql As String = "SELECT video_id, video_filename, view_description, video_purpose, video_order FROM case_videos WHERE case_id = ? ORDER BY video_order"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    While Not rs.AfterLastRow
      lstVideos.AddRow(rs.Column("video_filename").StringValue)
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 1) = rs.Column("view_description").StringValue
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 2) = rs.Column("video_purpose").StringValue
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 3) = Str(rs.Column("video_order").IntegerValue)
      lstVideos.RowTagAt(lstVideos.LastAddedRowIndex) = rs.Column("video_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading videos: " + e.Message)
  End Try
End Sub

' ******************************************************************
' Track changes to case info
' ******************************************************************
Sub TrackCaseInfoChange()
  mCaseInfoChanged = True
End Sub

' ******************************************************************
' Track changes to answers
' ******************************************************************
Sub TrackAnswerChange()
  mAnswersChanged = True
End Sub

' NOTE: In the IDE, add the following event handlers:
' - txtCaseLabel.TextChanged → call TrackCaseInfoChange()
' - All checkboxes ValueChanged → call TrackAnswerChange()
' - txtCorrectConclusions.TextChanged → call TrackAnswerChange()

' ******************************************************************
' btnSaveAll.Pressed Event
' ******************************************************************
Sub Pressed()
  Var changesMade As Boolean = False
  Var errors As String = ""
  
  ' Validate case label
  If txtCaseLabel.Text.Trim = "" Then
    MessageBox("Case description cannot be empty")
    Return
  End If
  
  Try
    Session.DB.BeginTransaction
    
    ' Save case description if changed
    If mCaseInfoChanged Then
      Var sqlCase As String = "UPDATE cases SET case_label = ? WHERE case_id = ?"
      Var psCase As MySQLPreparedStatement = Session.DB.Prepare(sqlCase)
      psCase.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psCase.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psCase.Bind(0, txtCaseLabel.Text.Trim)
      psCase.Bind(1, CaseID)
      psCase.ExecuteSQL
      changesMade = True
    End If
    
    ' Save correct answers if changed
    If mAnswersChanged Then
      Var sqlAnswers As String = "UPDATE cases SET lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, correct_conclusions=?, requires_full_echo=? WHERE case_id=?"
      
      Var psAnswers As MySQLPreparedStatement = Session.DB.Prepare(sqlAnswers)
      
      psAnswers.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkLVSizeDilated.Indeterminate Then
        psAnswers.Bind(0, Nil)
      Else
        psAnswers.Bind(0, chkLVSizeDilated.Value)
      End If
      
      psAnswers.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkLVFunctionImpaired.Indeterminate Then
        psAnswers.Bind(1, Nil)
      Else
        psAnswers.Bind(1, chkLVFunctionImpaired.Value)
      End If
      
      psAnswers.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRVSizeDilated.Indeterminate Then
        psAnswers.Bind(2, Nil)
      Else
        psAnswers.Bind(2, chkRVSizeDilated.Value)
      End If
      
      psAnswers.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRVFunctionImpaired.Indeterminate Then
        psAnswers.Bind(3, Nil)
      Else
        psAnswers.Bind(3, chkRVFunctionImpaired.Value)
      End If
      
      psAnswers.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkAorticStenosis.Indeterminate Then
        psAnswers.Bind(4, Nil)
      Else
        psAnswers.Bind(4, chkAorticStenosis.Value)
      End If
      
      psAnswers.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkAorticRegurgitation.Indeterminate Then
        psAnswers.Bind(5, Nil)
      Else
        psAnswers.Bind(5, chkAorticRegurgitation.Value)
      End If
      
      psAnswers.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkMitralStenosis.Indeterminate Then
        psAnswers.Bind(6, Nil)
      Else
        psAnswers.Bind(6, chkMitralStenosis.Value)
      End If
      
      psAnswers.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkMitralRegurgitation.Indeterminate Then
        psAnswers.Bind(7, Nil)
      Else
        psAnswers.Bind(7, chkMitralRegurgitation.Value)
      End If
      
      psAnswers.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkTricuspidStenosis.Indeterminate Then
        psAnswers.Bind(8, Nil)
      Else
        psAnswers.Bind(8, chkTricuspidStenosis.Value)
      End If
      
      psAnswers.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkTricuspidRegurgitation.Indeterminate Then
        psAnswers.Bind(9, Nil)
      Else
        psAnswers.Bind(9, chkTricuspidRegurgitation.Value)
      End If
      
      psAnswers.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkPericardialEffusion.Indeterminate Then
        psAnswers.Bind(10, Nil)
      Else
        psAnswers.Bind(10, chkPericardialEffusion.Value)
      End If
      
      psAnswers.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkIVCHighPressure.Indeterminate Then
        psAnswers.Bind(11, Nil)
      Else
        psAnswers.Bind(11, chkIVCHighPressure.Value)
      End If
      
      psAnswers.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psAnswers.Bind(12, txtCorrectConclusions.Text)
      
      psAnswers.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRequiresFullEcho.Indeterminate Then
        psAnswers.Bind(13, Nil)
      Else
        psAnswers.Bind(13, chkRequiresFullEcho.Value)
      End If
      
      psAnswers.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psAnswers.Bind(14, CaseID)
      
      psAnswers.ExecuteSQL
      changesMade = True
    End If
    
    Session.DB.CommitTransaction
    
    If changesMade Then
      MessageBox("All changes saved successfully!")
      mCaseInfoChanged = False
      mAnswersChanged = False
    Else
      MessageBox("No changes to save")
    End If
    
  Catch e As DatabaseException
    Session.DB.RollbackTransaction
    MessageBox("Error saving changes: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnCancelChanges.Pressed Event
' ******************************************************************
Sub Pressed()
  ' Reload original values
  LoadCaseDetails
  mCaseInfoChanged = False
  mAnswersChanged = False
End Sub

' ******************************************************************
' lstVideos.SelectionChanged Event (WITH WEBFILE AND PURPOSE)
' ******************************************************************
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then
    htmlVideoPreview.LoadHTML("")
    Return
  End If
  
  Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
  
  ' Get WebFile URL for the video
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  
  If wf = Nil Then
    Var errorHTML As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
    errorHTML = errorHTML + "body{margin:0;padding:20px;background:#1a1a1a;color:#e74c3c;font-family:Arial,sans-serif;}"
    errorHTML = errorHTML + ".error{background:#2c2c2c;padding:20px;border-radius:8px;border-left:4px solid #e74c3c;}"
    errorHTML = errorHTML + "</style></head><body><div class='error'>"
    errorHTML = errorHTML + "<h3>⚠️ Video Not Found</h3>"
    errorHTML = errorHTML + "<p>The video file <strong>" + videoFilename + "</strong> could not be loaded.</p>"
    errorHTML = errorHTML + "</div></body></html>"
    
    htmlVideoPreview.LoadHTML(errorHTML)
    Return
  End If
  
  Var videoURL As String = wf.URL
  
  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
  html = html + "body{margin:0;padding:10px;background:#1a1a1a;display:flex;justify-content:center;align-items:center;min-height:100%;}"
  html = html + ".video-container{width:100%;max-width:600px;background:#000;border-radius:8px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.5);}"
  html = html + "video{width:100%;height:auto;display:block;background:#000;}"
  html = html + ".info{color:#888;font-size:12px;margin-top:10px;text-align:center;}"
  html = html + "</style></head><body><div class='video-container'>"
  html = html + "<video controls loop autoplay playsinline>"
  html = html + "<source src='" + videoURL + "' type='video/mp4'>"
  html = html + "Your browser does not support the video tag.</video></div>"
  html = html + "<div class='info'>" + videoFilename + "</div>"
  html = html + "<script>var v=document.querySelector('video');"
  html = html + "v.addEventListener('ended',function(){this.currentTime=0;this.play();});</script>"
  html = html + "</body></html>"
  
  htmlVideoPreview.LoadHTML(html)
End Sub

' ******************************************************************
' lstVideos.CellAction Event - Handle inline editing
' ******************************************************************
Sub CellAction(row As Integer, column As Integer, value As Variant)
  If column >= 1 And column <= 3 Then
    ' Store original value before editing
    mOriginalCellValue = Me.CellTextAt(row, column)
    
    ' Get the new value from the edit
    Var newValue As String = value.StringValue
    
    ' If value actually changed, save it
    If newValue <> mOriginalCellValue Then
      Var videoID As Integer = Me.RowTagAt(row)
      
      ' Store for undo
      mLastVideoID = videoID
      mLastColumn = column
      mLastOldValue = mOriginalCellValue
      mLastNewValue = newValue
      
      ' Update the cell display
      Me.CellTextAt(row, column) = newValue
      
      ' Save to database
      Var sql As String
      Select Case column
      Case 1
        sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
      Case 2
        sql = "UPDATE case_videos SET video_purpose = ? WHERE video_id = ?"
      Case 3
        sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
      Else
        Return
      End Select
      
      Try
        Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
        
        If column = 3 Then
          ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
          Var orderValue As Integer = Val(newValue)
          If orderValue < 0 Then orderValue = 0
          ps.Bind(0, orderValue)
        Else
          ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
          ps.Bind(0, newValue)
        End If
        
        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
        ps.Bind(1, videoID)
        
        ps.ExecuteSQL
        
        System.DebugLog("Video metadata updated: video_id=" + Str(videoID))
        btnUndoVideoEdit.Enabled = True
        
      Catch e As DatabaseException
        MessageBox("Error updating video: " + e.Message)
        Me.CellTextAt(row, column) = mOriginalCellValue
      End Try
    End If
  End If
End Sub


' =============================================================================
' wc_CaseDetails WebContainer (PART 3 - Video Upload/Delete/Undo/Navigation)
' Continued from Part 2
' =============================================================================

' ******************************************************************
' btnStartUpload.Pressed Event
' ******************************************************************
Sub Pressed()
  ' Start the upload process for selected file(s)
  uplVideo.StartUpload
End Sub

' ******************************************************************
' uplVideo.FileAdded Event
' ******************************************************************
Sub FileAdded(filename As String, bytes As UInt64, mimeType As String)
  ' Enable upload button when file is selected
  btnStartUpload.Enabled = True
  System.DebugLog("File selected: " + filename + " (" + Str(bytes) + " bytes)")
End Sub

' ******************************************************************
' uplVideo.FileRemoved Event
' ******************************************************************
Sub FileRemoved(filename As String)
  ' Disable upload button when file is removed
  btnStartUpload.Enabled = False
  System.DebugLog("File removed: " + filename)
End Sub

' ******************************************************************
' uplVideo.UploadError Event
' ******************************************************************
Sub UploadError(error As RuntimeException)
  MessageBox("Upload error: " + error.Message)
  btnStartUpload.Enabled = True  ' Re-enable for retry
End Sub

' ******************************************************************
' uplVideo.UploadFinished Event
' ******************************************************************
Sub UploadFinished(files() As WebUploadedFile)
  ' Get the first (and only, since AllowMultipleFiles = False) file
  Var uploadedFile As WebUploadedFile = files(0)
  
  Try
    Var targetFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
    If Not targetFolder.Exists Then
      targetFolder.CreateFolder
      System.DebugLog("Created CaseVideos folder: " + targetFolder.NativePath)
    End If
    
    ' Create target file with the original filename
    Var targetFile As FolderItem = targetFolder.Child(uploadedFile.Name)
    
    ' Save the uploaded file data to disk
    Var outputStream As BinaryStream = BinaryStream.Create(targetFile, True)
    outputStream.Write(uploadedFile.Data)
    outputStream.Close
    
    System.DebugLog("Video saved to: " + targetFile.NativePath)
    
    ' Get next order number
    Var orderSQL As String = "SELECT COALESCE(MAX(video_order), -1) + 1 AS next_order FROM case_videos WHERE case_id = ?"
    Var orderPS As MySQLPreparedStatement = Session.DB.Prepare(orderSQL)
    orderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    orderPS.Bind(0, CaseID)
    Var orderRS As RowSet = orderPS.SelectSQL
    Var videoOrder As Integer = 0
    If orderRS <> Nil And Not orderRS.AfterLastRow Then
      videoOrder = orderRS.Column("next_order").IntegerValue
    End If
    
    ' Insert into database
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_purpose, video_order) VALUES (?, ?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, CaseID)
    ps.Bind(1, uploadedFile.Name)
    ps.Bind(2, "")  ' Empty, user can edit inline
    ps.Bind(3, "")  ' Empty, user can edit inline
    ps.Bind(4, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos
    
    ' Clear the uploader for next file and disable upload button
    uplVideo.RemoveAllFiles
    btnStartUpload.Enabled = False
    
  Catch e As IOException
    MessageBox("Error saving video file: " + e.Message)
  Catch e As DatabaseException
    MessageBox("Error saving video: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnDeleteVideo.Pressed Event
' ******************************************************************
Sub Pressed()
  If lstVideos.SelectedRowIndex < 0 Then
    MessageBox("Please select a video to delete")
    Return
  End If
  
  Var d As New WebMessageDialog
  d.Title = "Confirm Delete"
  d.Message = "Are you sure you want to delete this video? This action cannot be undone."
  d.ActionButton.Caption = "Delete"
  d.CancelButton.Caption = "Cancel"
  d.CancelButton.Visible = True
  
  AddHandler d.ButtonPressed, AddressOf HandleDeleteVideoConfirm
  d.Show
End Sub

' ******************************************************************
' HandleDeleteVideoConfirm Method
' ******************************************************************
Private Sub HandleDeleteVideoConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
  Select Case button
  Case dialog.ActionButton
    Var videoID As Integer = lstVideos.RowTagAt(lstVideos.SelectedRowIndex)
    Var sql As String = "DELETE FROM case_videos WHERE video_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, videoID)
      
      ps.ExecuteSQL
      
      MessageBox("Video deleted successfully!")
      LoadCaseVideos
      htmlVideoPreview.LoadHTML("")
      
    Catch e As DatabaseException
      MessageBox("Error deleting video: " + e.Message)
    End Try
  End Select
End Sub

' ******************************************************************
' btnUndoVideoEdit.Pressed Event
' ******************************************************************
Sub Pressed()
  If mLastVideoID = 0 Then
    MessageBox("No change to undo")
    Return
  End If
  
  Var sql As String
  Select Case mLastColumn
  Case 1
    sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
  Case 2
    sql = "UPDATE case_videos SET video_purpose = ? WHERE video_id = ?"
  Case 3
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End Select
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If mLastColumn = 3 Then
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, Val(mLastOldValue))
    Else
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(0, mLastOldValue)
    End If
    
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(1, mLastVideoID)
    
    ps.ExecuteSQL
    
    System.DebugLog("Video metadata change undone: video_id=" + Str(mLastVideoID))
    
    ' Reload videos to show the undone change
    LoadCaseVideos
    
    ' Disable undo button and clear tracking
    btnUndoVideoEdit.Enabled = False
    mLastVideoID = 0
    mLastColumn = 0
    mLastOldValue = ""
    mLastNewValue = ""
    
  Catch e As DatabaseException
    MessageBox("Error undoing change: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnBackToList.Pressed Event
' ******************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' wc_CaseDetails Complete Summary
' =============================================================================
' 
' This container is split into 3 parts:
' 
' PART 1: 
' - Properties (including mCaseInfoChanged and mAnswersChanged flags)
' - Layout definitions (including WebFileUploader: uplVideo and btnStartUpload)
' - Opening event (configures editable columns, initializes flags, disables btnStartUpload)
' - LoadCaseDetails (loads case info and correct answers with indeterminate state)
' - LoadCaseVideos (loads video list with 4 columns)
' 
' PART 2:
' - TrackCaseInfoChange (monitors txtCaseLabel changes)
' - TrackAnswerChange (monitors checkbox and conclusion changes)
' - btnSaveAll (UNIFIED SAVE - saves description + answers in transaction)
' - btnCancelChanges (reloads original values, resets flags)
' - lstVideos.SelectionChanged (displays video preview)
' - lstVideos.CellAction (handles inline editing AND saves to database)
' 
' PART 3 (THIS FILE):
' - btnStartUpload.Pressed (calls uplVideo.StartUpload to begin upload)
' - uplVideo.FileAdded (enables upload button when file selected)
' - uplVideo.FileRemoved (disables upload button when file removed)
' - uplVideo.UploadError (handles upload errors)
' - uplVideo.UploadFinished (saves file to disk and database, clears uploader)
' - btnDeleteVideo (with confirmation dialog)
' - btnUndoVideoEdit (reverts last metadata change)
' - btnBackToList (navigation)
' 
' =============================================================================
' Key Features:
' =============================================================================
' 
' SINGLE SAVE BUTTON DESIGN:
' - One "Save All Changes" button for description + correct answers
' - Uses database transaction (atomic save)
' - Only saves what changed (smart saving)
' - Video metadata auto-saves on inline edit (immediate feedback)
' 
' VIDEO UPLOAD WORKFLOW:
' 1. User clicks WebFileUploader ("Choose File")
' 2. FileAdded event enables "Upload Selected Video" button
' 3. User clicks "Upload Selected Video" 
' 4. btnStartUpload calls uplVideo.StartUpload()
' 5. UploadFinished event saves file to disk and database
' 6. Uploader cleared and button disabled (ready for next file)
' 
' Case Info Section:
' - Serial Number: Read-only (auto-generated)
' - Description: Editable, tracked by mCaseInfoChanged flag
' 
' Correct Answers Section:
' - 12 checkboxes + conclusions + requires_full_echo
' - Supports indeterminate state (NULL values)
' - Changes tracked by mAnswersChanged flag
' 
' Video Management Section:
' - 4-column listbox: Filename, View Description, Purpose, Order
' - Inline editing for Description, Purpose, Order (auto-saves immediately)
' - Purpose supports comma-separated groups (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")
' - Video preview with auto-loop
' - Upload videos (two-step: select, then upload)
' - Delete videos (with confirmation)
' - Undo last metadata change
' 
' Save Strategy:
' - Case description + Correct answers: Saved together via "Save All Changes"
' - Video metadata: Auto-saved immediately on inline edit (better UX)
' - Video upload: Two-step process (select file, then click upload)
' - Video delete: Immediate (with confirmation dialog)
' 
' Navigation:
' - Back button returns to wc_CaseList
' 
' =============================================================================