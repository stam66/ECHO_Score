-- =============================================================================
-- wc_CaseReview WebContainer (PART 2 - Video Display and Save/Submit)
-- Continued from Part 1
-- =============================================================================

' DisplayCurrentVideo Method (USING WEBFILE)
Sub DisplayCurrentVideo()
  If CurrentVideoIndex < 0 Or CurrentVideoIndex >= TotalVideos Then Return
  
  Var videoFilename As String = VideoFilenames(CurrentVideoIndex)
  
  ' Get WebFile URL for the video
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  
  If wf = Nil Then
    Var errorHTML As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
    errorHTML = errorHTML + "body{margin:0;padding:20px;background:#1a1a1a;color:#e74c3c;font-family:Arial,sans-serif;text-align:center;}"
    errorHTML = errorHTML + ".error{background:#2c2c2c;padding:30px;border-radius:8px;border-left:4px solid #e74c3c;max-width:600px;margin:50px auto;}"
    errorHTML = errorHTML + "</style></head><body><div class='error'>"
    errorHTML = errorHTML + "<h3>⚠️ Video Not Found</h3>"
    errorHTML = errorHTML + "<p>The video file <strong>" + videoFilename + "</strong> could not be loaded.</p>"
    errorHTML = errorHTML + "</div></body></html>"
    
    htmlVideoPlayer.LoadHTML(errorHTML)
    Return
  End If
  
  Var videoURL As String = wf.URL
  System.DebugLog("Playing video: " + videoFilename + " at URL: " + videoURL)
  
  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
  html = html + "body{margin:0;padding:20px;background:#1a1a1a;display:flex;justify-content:center;align-items:center;min-height:100vh;}"
  html = html + ".video-container{width:100%;max-width:800px;background:#000;border-radius:8px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.5);}"
  html = html + "video{width:100%;height:auto;display:block;background:#000;}"
  html = html + "</style></head><body><div class='video-container'>"
  html = html + "<video id='mainVideo' controls loop autoplay playsinline>"
  html = html + "<source src='" + videoURL + "' type='video/mp4'>"
  html = html + "Your browser does not support the video tag.</video></div>"
  html = html + "<script>var v=document.getElementById('mainVideo');"
  html = html + "v.addEventListener('ended',function(){this.currentTime=0;this.play();});</script>"
  html = html + "</body></html>"
  
  htmlVideoPlayer.LoadHTML(html)
  UpdateVideoNavigation
End Sub

' UpdateVideoNavigation Method
Sub UpdateVideoNavigation()
  If TotalVideos = 0 Then Return
  
  lblVideoCounter.Text = "Video " + Str(CurrentVideoIndex + 1) + " of " + Str(TotalVideos)
  btnPreviousVideo.Enabled = (CurrentVideoIndex > 0)
  btnNextVideo.Enabled = (CurrentVideoIndex < TotalVideos - 1)
End Sub

' btnPreviousVideo.Pressed Event
Sub Pressed()
  If CurrentVideoIndex > 0 Then
    CurrentVideoIndex = CurrentVideoIndex - 1
    DisplayCurrentVideo
  End If
End Sub

' btnNextVideo.Pressed Event
Sub Pressed()
  If CurrentVideoIndex < TotalVideos - 1 Then
    CurrentVideoIndex = CurrentVideoIndex + 1
    DisplayCurrentVideo
  End If
End Sub

' btnReplayVideo.Pressed Event
Sub Pressed()
  DisplayCurrentVideo
End Sub

' SaveResponse Method
Sub SaveResponse(isCompleted As Boolean)
  Var sql As String
  Var checkSQL As String = "SELECT response_id FROM user_responses WHERE user_id = ? AND case_id = ?"
  Var responseExists As Boolean = False
  
  Try
    Var checkPS As MySQLPreparedStatement = Session.DB.Prepare(checkSQL)
    checkPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    checkPS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    checkPS.Bind(0, Session.CurrentUserID)
    checkPS.Bind(1, CaseID)
    Var checkRS As RowSet = checkPS.SelectSQL
    responseExists = (checkRS <> Nil And Not checkRS.AfterLastRow)
    
    If responseExists Then
      sql = "UPDATE user_responses SET lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, user_conclusions=?, requires_full_echo=?, is_completed=?, completed_at=IF(?=1,NOW(),completed_at) WHERE user_id=? AND case_id=?"
    Else
      sql = "INSERT INTO user_responses (user_id, case_id, lv_size_dilated, lv_function_impaired, rv_size_dilated, rv_function_impaired, aortic_stenosis_significant, aortic_regurgitation_significant, mitral_stenosis_significant, mitral_regurgitation_significant, tricuspid_stenosis_significant, tricuspid_regurgitation_significant, pericardial_effusion_significant, ivc_high_ra_pressure, user_conclusions, requires_full_echo, is_completed, completed_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,IF(?=1,NOW(),NULL))"
    End If

    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    Var p As Integer = 0
    
    If Not responseExists Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, Session.CurrentUserID)
      p = p + 1
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, CaseID)
      p = p + 1
    End If
    
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkLVSizeDilated.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkLVFunctionImpaired.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkRVSizeDilated.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkRVFunctionImpaired.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkAorticStenosis.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkAorticRegurgitation.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkMitralStenosis.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkMitralRegurgitation.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkTricuspidStenosis.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkTricuspidRegurgitation.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkPericardialEffusion.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkIVCHighPressure.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(p, txtConclusions.Text)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, chkRequiresFullEcho.Value)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, isCompleted)
    p = p + 1
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, isCompleted)
    p = p + 1
    
    If responseExists Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, Session.CurrentUserID)
      p = p + 1
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, CaseID)
    End If

    ps.ExecuteSQL
    
    If isCompleted Then
      MessageBox("Test submitted successfully!")
      ShowCorrectAnswers
      btnSubmit.Enabled = False
      IsReviewMode = True
      LoadCase
    Else
      MessageBox("Progress saved!")
    End If
    
  Catch e As DatabaseException
    MessageBox("Error saving response: " + e.Message)
  End Try
End Sub

' btnSave.Pressed Event
Sub Pressed()
  SaveResponse(False)
End Sub

' btnSubmit.Pressed Event
Sub Pressed()
  SaveResponse(True)
End Sub

' btnBack.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * Video playback with WebFile URL generation
' * Auto-loop functionality for continuous review
' * Save draft or submit for final grading
' * Dynamic SQL for INSERT or UPDATE based on response existence
' * Binds all 12 assessment values + conclusions + requires_full_echo
' * Part 3 contains ShowCorrectAnswers method
' =============================================================================