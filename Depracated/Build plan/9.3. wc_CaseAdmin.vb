' =============================================================================
' wc_CaseAdmin WebContainer (UPDATED WITH NEW WORKFLOW)
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseAdmin
' Super: wc_Base

' Private Properties for undo tracking:
Private mOriginalCellValue As String
Private mLastVideoID As Integer
Private mLastColumn As Integer
Private mLastOldValue As String
Private mLastNewValue As String

' Cases Section Controls:
' Label: lblCasesTitle (text: "Cases", Bold)
' ListBox: lstCases (2 columns: Serial, Case Label)
' PushButton: btnNewCase (text: "New Case")
' PushButton: btnUpdateCase (text: "Update Case")
' PushButton: btnDeleteCase (text: "Delete Case")

' Case Details Section Controls:
' Label: lblCaseDetails (text: "Case Details", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblLabel (text: "Case Label:")
' TextField: txtCaseLabel (ReadOnly = True)
' Label: lblCorrectAnswers (text: "Correct Answers:", Bold)
' CheckBox: chkLVSizeDilated through chkIVCHighPressure (same 12 as in wc_CaseReview)
' Label: lblCorrectConclusions (text: "Correct Conclusions:")
' TextArea: txtCorrectConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?")

' Videos Section Controls:
' Label: lblVideosTitle (text: "Videos for Selected Case", Bold)
' ListBox: lstVideos (3 columns: Filename, View Description, Order)
'   - Set ColumnTypeAt(1) = TextField (editable)
'   - Set ColumnTypeAt(2) = TextField (editable)
' Label: lblVideoPreview (text: "Video Preview:", Bold)
' HTMLViewer: htmlVideoPreview
' PushButton: btnUploadVideo (text: "Upload Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnUndoVideoEdit (text: "Undo Last Change", Enabled = False)
' WebUploader: uplVideo
' PushButton: btnBack (text: "Back")

' wc_CaseAdmin.Opening Event
Sub Opening()
  LoadCases
  btnUndoVideoEdit.Enabled = False
End Sub

' LoadCases Method
Sub LoadCases()
  lstCases.RemoveAllRows
  
  Var sql As String = "SELECT case_id, serial_number, case_label FROM cases ORDER BY serial_number"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    While Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("serial_number").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub

' LoadCaseDetails Method
Sub LoadCaseDetails(caseID As Integer)
  Var sql As String = "SELECT * FROM cases WHERE case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, caseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      txtSerialNumber.Text = rs.Column("serial_number").StringValue
      txtCaseLabel.Text = rs.Column("case_label").StringValue
      
      chkLVSizeDilated.Value = rs.Column("lv_size_dilated").BooleanValue
      chkLVSizeDilated.Indeterminate = False
      chkLVFunctionImpaired.Value = rs.Column("lv_function_impaired").BooleanValue
      chkLVFunctionImpaired.Indeterminate = False
      chkRVSizeDilated.Value = rs.Column("rv_size_dilated").BooleanValue
      chkRVSizeDilated.Indeterminate = False
      chkRVFunctionImpaired.Value = rs.Column("rv_function_impaired").BooleanValue
      chkRVFunctionImpaired.Indeterminate = False
      chkAorticStenosis.Value = rs.Column("aortic_stenosis_significant").BooleanValue
      chkAorticStenosis.Indeterminate = False
      chkAorticRegurgitation.Value = rs.Column("aortic_regurgitation_significant").BooleanValue
      chkAorticRegurgitation.Indeterminate = False
      chkMitralStenosis.Value = rs.Column("mitral_stenosis_significant").BooleanValue
      chkMitralStenosis.Indeterminate = False
      chkMitralRegurgitation.Value = rs.Column("mitral_regurgitation_significant").BooleanValue
      chkMitralRegurgitation.Indeterminate = False
      chkTricuspidStenosis.Value = rs.Column("tricuspid_stenosis_significant").BooleanValue
      chkTricuspidStenosis.Indeterminate = False
      chkTricuspidRegurgitation.Value = rs.Column("tricuspid_regurgitation_significant").BooleanValue
      chkTricuspidRegurgitation.Indeterminate = False
      chkPericardialEffusion.Value = rs.Column("pericardial_effusion_significant").BooleanValue
      chkPericardialEffusion.Indeterminate = False
      chkIVCHighPressure.Value = rs.Column("ivc_high_ra_pressure").BooleanValue
      chkIVCHighPressure.Indeterminate = False
      txtCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
      chkRequiresFullEcho.Indeterminate = False
    End If
  Catch e As DatabaseException
    MessageBox("Error loading case details: " + e.Message)
  End Try
End Sub

' LoadCaseVideos Method
Sub LoadCaseVideos(caseID As Integer)
  lstVideos.RemoveAllRows
  
  Var sql As String = "SELECT video_id, video_filename, view_description, video_order FROM case_videos WHERE case_id = ? ORDER BY video_order"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, caseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    While Not rs.AfterLastRow
      lstVideos.AddRow(rs.Column("video_filename").StringValue)
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 1) = rs.Column("view_description").StringValue
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 2) = Str(rs.Column("video_order").IntegerValue)
      lstVideos.RowTagAt(lstVideos.LastAddedRowIndex) = rs.Column("video_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading videos: " + e.Message)
  End Try
End Sub

' ClearCaseFields Method
Sub ClearCaseFields()
  txtSerialNumber.Text = ""
  txtCaseLabel.Text = ""
  
  chkLVSizeDilated.Value = False
  chkLVSizeDilated.Indeterminate = True
  chkLVFunctionImpaired.Value = False
  chkLVFunctionImpaired.Indeterminate = True
  chkRVSizeDilated.Value = False
  chkRVSizeDilated.Indeterminate = True
  chkRVFunctionImpaired.Value = False
  chkRVFunctionImpaired.Indeterminate = True
  chkAorticStenosis.Value = False
  chkAorticStenosis.Indeterminate = True
  chkAorticRegurgitation.Value = False
  chkAorticRegurgitation.Indeterminate = True
  chkMitralStenosis.Value = False
  chkMitralStenosis.Indeterminate = True
  chkMitralRegurgitation.Value = False
  chkMitralRegurgitation.Indeterminate = True
  chkTricuspidStenosis.Value = False
  chkTricuspidStenosis.Indeterminate = True
  chkTricuspidRegurgitation.Value = False
  chkTricuspidRegurgitation.Indeterminate = True
  chkPericardialEffusion.Value = False
  chkPericardialEffusion.Indeterminate = True
  chkIVCHighPressure.Value = False
  chkIVCHighPressure.Indeterminate = True
  
  txtCorrectConclusions.Text = ""
  
  chkRequiresFullEcho.Value = False
  chkRequiresFullEcho.Indeterminate = True
End Sub

' lstCases.SelectionChanged Event
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then Return
  
  ' Reset undo tracking when switching cases
  btnUndoVideoEdit.Enabled = False
  mLastVideoID = 0
  mLastColumn = 0
  mLastOldValue = ""
  mLastNewValue = ""
  
  Var caseID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
  LoadCaseDetails(caseID)
  LoadCaseVideos(caseID)
End Sub

' lstVideos.SelectionChanged Event (WITH WEBFILE)
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then
    htmlVideoPreview.LoadHTML("")
    btnUndoVideoEdit.Enabled = False
    mLastVideoID = 0
    Return
  End If
  
  Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
  
  ' Store original value for undo tracking
  mOriginalCellValue = ""
  
  ' Get WebFile URL for the video
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  
  If wf = Nil Then
    Var errorHTML As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
    errorHTML = errorHTML + "body{margin:0;padding:20px;background:#1a1a1a;color:#e74c3c;font-family:Arial,sans-serif;}"
    errorHTML = errorHTML + ".error{background:#2c2c2c;padding:20px;border-radius:8px;border-left:4px solid #e74c3c;}"
    errorHTML = errorHTML + "</style></head><body><div class='error'>"
    errorHTML = errorHTML + "<h3>⚠️ Video Not Found</h3>"
    errorHTML = errorHTML + "<p>The video file <strong>" + videoFilename + "</strong> could not be loaded.</p>"
    errorHTML = errorHTML + "<p>Please ensure the file exists in the CaseVideos folder.</p>"
    errorHTML = errorHTML + "</div></body></html>"
    
    htmlVideoPreview.LoadHTML(errorHTML)
    Return
  End If
  
  Var videoURL As String = wf.URL
  System.DebugLog("Video URL: " + videoURL)
  
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

' lstVideos.CellAction Event - Allow editing
Sub CellAction(row As Integer, column As Integer)
  If column = 1 Or column = 2 Then ' View Description or Order columns
    ' Store original value before editing
    mOriginalCellValue = Me.CellTextAt(row, column)
    Me.EditCell(row, column)
  End If
End Sub

' lstVideos.CellTextChanged Event - Save to database and track for undo
Sub CellTextChanged(row As Integer, column As Integer)
  Var videoID As Integer = Me.RowTagAt(row)
  Var newValue As String = Me.CellTextAt(row, column)
  
  ' Store for undo
  mLastVideoID = videoID
  mLastColumn = column
  mLastOldValue = mOriginalCellValue
  mLastNewValue = newValue
  
  Var sql As String
  If column = 1 Then
    ' View Description changed
    sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
  ElseIf column = 2 Then
    ' Order changed
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If column = 1 Then
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(0, newValue)
    Else
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      Var orderValue As Integer = Val(newValue)
      If orderValue < 0 Then orderValue = 0
      ps.Bind(0, orderValue)
    End If
    
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(1, videoID)
    
    ps.ExecuteSQL
    
    System.DebugLog("Video metadata updated: video_id=" + Str(videoID))
    
    ' Enable undo button
    btnUndoVideoEdit.Enabled = True
    
  Catch e As DatabaseException
    MessageBox("Error updating video: " + e.Message)
    ' Restore original value on error
    Me.CellTextAt(row, column) = mOriginalCellValue
  End Try
End Sub

' btnNewCase.Pressed Event
Sub Pressed()
  Var dlg As New dlg_AddCase
  dlg.Show
  
  ' Reload cases after dialog closes
  ' Note: In a real app, you'd use the dialog's Closed event
  ' For now, just reload when user returns to this screen
End Sub

' btnUpdateCase.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case to update")
    Return
  End If
  
  If txtSerialNumber.Text.Trim = "" Or txtCaseLabel.Text.Trim = "" Then
    MessageBox("Please enter serial number and case label")
    Return
  End If
  
  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
  
  Var sql As String = "UPDATE cases SET serial_number=?, case_label=?, lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, correct_conclusions=?, requires_full_echo=? WHERE case_id=?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, txtSerialNumber.Text.Trim)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(1, txtCaseLabel.Text.Trim)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(2, chkLVSizeDilated.Value)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(3, chkLVFunctionImpaired.Value)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(4, chkRVSizeDilated.Value)
    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(5, chkRVFunctionImpaired.Value)
    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(6, chkAorticStenosis.Value)
    ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(7, chkAorticRegurgitation.Value)
    ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(8, chkMitralStenosis.Value)
    ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(9, chkMitralRegurgitation.Value)
    ps.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(10, chkTricuspidStenosis.Value)
    ps.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(11, chkTricuspidRegurgitation.Value)
    ps.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(12, chkPericardialEffusion.Value)
    ps.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(13, chkIVCHighPressure.Value)
    ps.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(14, txtCorrectConclusions.Text)
    ps.BindType(15, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(15, chkRequiresFullEcho.Value)
    ps.BindType(16, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(16, caseID)
    
    ps.ExecuteSQL
    
    MessageBox("Case updated successfully!")
    LoadCases
    
  Catch e As DatabaseException
    MessageBox("Error updating case: " + e.Message)
  End Try
End Sub

' btnDeleteCase.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case to delete")
    Return
  End If
  
  Var d As New WebMessageDialog
  d.Title = "Confirm Delete"
  d.Message = "Are you sure you want to delete this case? This will also delete all associated videos and user responses. This action cannot be undone."
  d.ActionButton.Caption = "Delete"
  d.CancelButton.Caption = "Cancel"
  d.CancelButton.Visible = True
  
  AddHandler d.ButtonPressed, AddressOf HandleDeleteCaseConfirm
  d.Show
End Sub

' HandleDeleteCaseConfirm Method
Private Sub HandleDeleteCaseConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
  Select Case button
  Case dialog.ActionButton
    Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
    Var sql As String = "DELETE FROM cases WHERE case_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, caseID)
      
      ps.ExecuteSQL
      
      MessageBox("Case deleted successfully!")
      ClearCaseFields
      LoadCases
      lstVideos.RemoveAllRows
      htmlVideoPreview.LoadHTML("")
      
    Catch e As DatabaseException
      MessageBox("Error deleting case: " + e.Message)
    End Try
  End Select
End Sub

' btnUploadVideo.Pressed Event
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case first")
    Return
  End If
  
  uplVideo.ShowDialog
End Sub

' uplVideo.FileReceived Event
Sub FileReceived(file As FolderItem)
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case first")
    Return
  End If
  
  Try
    ' Create target folder if it doesn't exist
    Var targetFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
    If Not targetFolder.Exists Then
      targetFolder.CreateFolder
      System.DebugLog("Created CaseVideos folder: " + targetFolder.NativePath)
    End If
    
    ' Copy file to CaseVideos folder
    Var targetFile As FolderItem = targetFolder.Child(file.Name)
    file.CopyTo(targetFile)
    System.DebugLog("Video copied to: " + targetFile.NativePath)
    
    ' Add to database
    Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
    
    ' Get next order number
    Var orderSQL As String = "SELECT COALESCE(MAX(video_order), -1) + 1 AS next_order FROM case_videos WHERE case_id = ?"
    Var orderPS As MySQLPreparedStatement = Session.DB.Prepare(orderSQL)
    orderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    orderPS.Bind(0, caseID)
    Var orderRS As RowSet = orderPS.SelectSQL
    Var videoOrder As Integer = 0
    If orderRS <> Nil And Not orderRS.AfterLastRow Then
      videoOrder = orderRS.Column("next_order").IntegerValue
    End If
    
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_order) VALUES (?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, caseID)
    ps.Bind(1, file.Name)
    ps.Bind(2, "")  ' Empty description, user can edit inline
    ps.Bind(3, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos(caseID)
    
  Catch e As IOException
    MessageBox("Error copying video file: " + e.Message)
    System.DebugLog("IO Error: " + e.Message)
  Catch e As DatabaseException
    MessageBox("Error saving video: " + e.Message)
    System.DebugLog("DB Error: " + e.Message)
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
      
      If lstCases.SelectedRowIndex >= 0 Then
        Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
        LoadCaseVideos(caseID)
      End If
      
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
  If mLastColumn = 1 Then
    sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
  ElseIf mLastColumn = 2 Then
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If mLastColumn = 1 Then
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(0, mLastOldValue)
    Else
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, Val(mLastOldValue))
    End If
    
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(1, mLastVideoID)
    
    ps.ExecuteSQL
    
    System.DebugLog("Video metadata change undone: video_id=" + Str(mLastVideoID))
    
    ' Reload videos to show the undone change
    If lstCases.SelectedRowIndex >= 0 Then
      Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
      LoadCaseVideos(caseID)
    End If
    
    ' Disable undo button and clear tracking
    Me.Enabled = False
    mLastVideoID = 0
    mLastColumn = 0
    mLastOldValue = ""
    mLastNewValue = ""
    
  Catch e As DatabaseException
    MessageBox("Error undoing change: " + e.Message)
  End Try
End Sub

' btnBack.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub