-- =============================================================================
-- wc_CaseDetails WebContainer (PART 2 - Video Management)
-- Continued from Part 1
-- =============================================================================

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

' Continue in Part 3...
' =============================================================================