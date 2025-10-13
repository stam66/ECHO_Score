' =============================================================================
' wc_CaseDetails WebContainer (PART 1 - Properties and Layout)
' Detailed case editor with video management (Screen 2 of 2)
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseDetails
' Super: wc_Base

' Properties:
Public CaseID As Integer
Private mOriginalCellValue As String
Private mLastVideoID As Integer
Private mLastColumn As Integer
Private mLastOldValue As String
Private mLastNewValue As String
Private mAnswersChanged As Boolean = False

' CASE INFO SECTION (Top):
' Label: lblCaseInfo (text: "Case Information", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblLabel (text: "Description:")
' TextField: txtCaseLabel (ReadOnly = True)

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
' PushButton: btnSaveAnswers (text: "Save Answers")
' PushButton: btnCancelAnswers (text: "Cancel")

' VIDEOS SECTION:
' Label: lblVideos (text: "Case Videos", Bold)
' Label: lblVideoInstructions (text: "Double-click cells to edit. Use commas to separate multiple groups (e.g., 'Cardiology 2025 Q1,ICU 2025 Q1')")
' ListBox: lstVideos (4 columns: Filename, View Description, Purpose, Order)
'   - Set ColumnTypeAt(1) = TextField (editable)
'   - Set ColumnTypeAt(2) = TextField (editable)
'   - Set ColumnTypeAt(3) = TextField (editable)
' PushButton: btnUploadVideo (text: "Upload Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnUndoVideoEdit (text: "Undo Last Change", Enabled = False)
' WebUploader: uplVideo

' VIDEO PREVIEW SECTION:
' Label: lblVideoPreview (text: "Video Preview", Bold)
' HTMLViewer: htmlVideoPreview

' NAVIGATION:
' PushButton: btnBackToList (text: "Back to Case List")

' wc_CaseDetails.Opening Event
Sub Opening()
  LoadCaseDetails
  LoadCaseVideos
  mAnswersChanged = False
  btnUndoVideoEdit.Enabled = False
End Sub

' LoadCaseDetails Method
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
' =============================================================================

' LoadCaseVideos Method (WITH PURPOSE COLUMN)
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

' Track changes to answers
Sub TrackAnswerChange()
  mAnswersChanged = True
End Sub

' NOTE: In the IDE, add ValueChanged event to each checkbox that calls TrackAnswerChange()

' btnSaveAnswers.Pressed Event
Sub Pressed()
  Var sql As String = "UPDATE cases SET lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, correct_conclusions=?, requires_full_echo=? WHERE case_id=?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(0, If(chkLVSizeDilated.Indeterminate, Nil, chkLVSizeDilated.Value))
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(1, If(chkLVFunctionImpaired.Indeterminate, Nil, chkLVFunctionImpaired.Value))
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(2, If(chkRVSizeDilated.Indeterminate, Nil, chkRVSizeDilated.Value))
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(3, If(chkRVFunctionImpaired.Indeterminate, Nil, chkRVFunctionImpaired.Value))
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(4, If(chkAorticStenosis.Indeterminate, Nil, chkAorticStenosis.Value))
    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(5, If(chkAorticRegurgitation.Indeterminate, Nil, chkAorticRegurgitation.Value))
    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(6, If(chkMitralStenosis.Indeterminate, Nil, chkMitralStenosis.Value))
    ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(7, If(chkMitralRegurgitation.Indeterminate, Nil, chkMitralRegurgitation.Value))
    ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(8, If(chkTricuspidStenosis.Indeterminate, Nil, chkTricuspidStenosis.Value))
    ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(9, If(chkTricuspidRegurgitation.Indeterminate, Nil, chkTricuspidRegurgitation.Value))
    ps.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(10, If(chkPericardialEffusion.Indeterminate, Nil, chkPericardialEffusion.Value))
    ps.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(11, If(chkIVCHighPressure.Indeterminate, Nil, chkIVCHighPressure.Value))
    ps.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(12, txtCorrectConclusions.Text)
    ps.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(13, If(chkRequiresFullEcho.Indeterminate, Nil, chkRequiresFullEcho.Value))
    ps.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(14, CaseID)
    
    ps.ExecuteSQL
    
    MessageBox("Answers saved successfully!")
    mAnswersChanged = False
    
  Catch e As DatabaseException
    MessageBox("Error saving answers: " + e.Message)
  End Try
End Sub

' btnCancelAnswers.Pressed Event
Sub Pressed()
  LoadCaseDetails  ' Reload original values
  mAnswersChanged = False
End Sub

' lstVideos.SelectionChanged Event (WITH WEBFILE AND PURPOSE)
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

' lstVideos.CellAction Event - Allow editing columns 1, 2, 3
Sub CellAction(row As Integer, column As Integer)
  If column >= 1 And column <= 3 Then ' View Description, Purpose, or Order
    mOriginalCellValue = Me.CellTextAt(row, column)
    Me.EditCell(row, column)
  End If
End Sub


' =============================================================================
' wc_CaseDetails WebContainer (PART 3 - Video Upload/Delete/Undo)
' =============================================================================

' lstVideos.CellTextChanged Event - Save and track for undo (WITH PURPOSE)
Sub CellTextChanged(row As Integer, column As Integer)
  Var videoID As Integer = Me.RowTagAt(row)
  Var newValue As String = Me.CellTextAt(row, column)
  
  ' Store for undo
  mLastVideoID = videoID
  mLastColumn = column
  mLastOldValue = mOriginalCellValue
  mLastNewValue = newValue
  
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
End Sub

' btnUploadVideo.Pressed Event
Sub Pressed()
  uplVideo.ShowDialog
End Sub

' uplVideo.FileReceived Event (WITH PURPOSE)
Sub FileReceived(file As FolderItem)
  Try
    Var targetFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
    If Not targetFolder.Exists Then
      targetFolder.CreateFolder
      System.DebugLog("Created CaseVideos folder: " + targetFolder.NativePath)
    End If
    
    Var targetFile As FolderItem = targetFolder.Child(file.Name)
    file.CopyTo(targetFile)
    System.DebugLog("Video copied to: " + targetFile.NativePath)
    
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
    
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_purpose, video_order) VALUES (?, ?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, CaseID)
    ps.Bind(1, file.Name)
    ps.Bind(2, "")  ' Empty, user can edit inline
    ps.Bind(3, "")  ' Empty, user can edit inline
    ps.Bind(4, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos
    
  Catch e As IOException
    MessageBox("Error copying video file: " + e.Message)
  Catch e As DatabaseException
    MessageBox("Error saving video: " + e.Message)
  End Try
End Sub

' btnDeleteVideo.Pressed Event
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

' HandleDeleteVideoConfirm Method
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

' btnUndoVideoEdit.Pressed Event
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

' btnBackToList.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * 4-column video list: Filename, Description, Purpose, Order
' * Purpose supports comma-separated groups (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")
' * Inline editing for Description, Purpose, and Order columns
' * Undo functionality for video metadata changes
' * Video preview with auto-loop
' * Indeterminate checkbox state for NULL values
' * Save/Cancel buttons for correct answers
' =============================================================================