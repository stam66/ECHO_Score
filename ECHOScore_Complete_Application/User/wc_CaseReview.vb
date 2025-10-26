' =============================================================================
' wc_CaseReview WebContainer - Complete Updated Version (ALL 3 PARTS)
' Student case review and assessment with NULL checkbox support
' CRITICAL: Uses MYSQL_TYPE_NULL when binding Nil for indeterminate checkboxes
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseReview
' Super: wc_Base

' Properties:
Public CaseID As Integer
Private CurrentVideoIndex As Integer = 0
Private TotalVideos As Integer = 0
Private VideoFilenames() As String
Private IsReviewMode As Boolean = False

' VIDEO SECTION CONTROLS:
' Label: lblCaseTitle (Bold, Large)
' HTMLViewer: htmlVideoPlayer (Large area - at least 800px wide)
' Label: lblVideoCounter (text: "")
' PushButton: btnPreviousVideo (text: "← Previous")
' PushButton: btnNextVideo (text: "Next →")
' PushButton: btnReplayVideo (text: "⟳ Replay")

' ASSESSMENT SECTION CONTROLS (12 checkboxes):
' Label: lblAssessment (text: "ASSESSMENT:", Bold)
' CheckBox: chkLVSizeDilated (text: "LV Size - Dilated", AllowIndeterminate = True)
' CheckBox: chkLVFunctionImpaired (text: "LV Function - Significantly Impaired", AllowIndeterminate = True)
' CheckBox: chkRVSizeDilated (text: "RV Size - Dilated", AllowIndeterminate = True)
' CheckBox: chkRVFunctionImpaired (text: "RV Function - Significantly Impaired", AllowIndeterminate = True)
' CheckBox: chkAorticStenosis (text: "Aortic Valve - Significant Stenosis", AllowIndeterminate = True)
' CheckBox: chkAorticRegurgitation (text: "Aortic Valve - Significant Regurgitation", AllowIndeterminate = True)
' CheckBox: chkMitralStenosis (text: "Mitral Valve - Significant Stenosis", AllowIndeterminate = True)
' CheckBox: chkMitralRegurgitation (text: "Mitral Valve - Significant Regurgitation", AllowIndeterminate = True)
' CheckBox: chkTricuspidStenosis (text: "Tricuspid Valve - Significant Stenosis", AllowIndeterminate = True)
' CheckBox: chkTricuspidRegurgitation (text: "Tricuspid Valve - Significant Regurgitation", AllowIndeterminate = True)
' CheckBox: chkPericardialEffusion (text: "Pericardium - Significant Effusion", AllowIndeterminate = True)
' CheckBox: chkIVCHighPressure (text: "IVC - High RA Pressure", AllowIndeterminate = True)

' CONCLUSIONS SECTION CONTROLS:
' Label: lblConclusions (text: "Your Conclusions:")
' TextArea: txtConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?", AllowIndeterminate = True)

' ACTION BUTTONS CONTROLS:
' PushButton: btnSave (text: "Save Draft")
' PushButton: btnSubmit (text: "Submit")

' RESULTS SECTION (Initially Hidden) CONTROLS:
' Label: lblCorrectConclusionsTitle (text: "Expert Conclusions:", Bold, Visible = False)
' Label: lblCorrectConclusions (text: "", Visible = False)
' Label: lblScore (text: "", Bold, Visible = False)

' =============================================================================
' PART 1: Opening, LoadCase, LoadExistingResponse, LoadVideos
' =============================================================================

' wc_CaseReview.Opening Event
Sub Opening()
  ContainerID = "CaseReview"
  LoadCase()
  LoadExistingResponse()
  LoadVideos()
  UpdateVideoNavigation()
End Sub

' LoadCase Method
Sub LoadCase()
  Var sql As String = "SELECT case_label, serial_number FROM cases WHERE case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      Var serialNumber As String = rs.Column("serial_number").StringValue
      Var caseLabel As String = rs.Column("case_label").StringValue
      
      ' Check if already completed
      Var checkSQL As String = "SELECT is_completed FROM user_responses WHERE user_id = ? AND case_id = ?"
      Var checkPS As MySQLPreparedStatement = Session.DB.Prepare(checkSQL)
      checkPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      checkPS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      checkPS.Bind(0, Session.CurrentUserID)
      checkPS.Bind(1, CaseID)
      
      Var checkRS As RowSet = checkPS.SelectSQL
      If checkRS <> Nil And Not checkRS.AfterLastRow Then
        IsReviewMode = checkRS.Column("is_completed").BooleanValue
      End If
      
      ' Show full label if completed or admin
      If IsReviewMode Or Session.IsAdmin Then
        lblCaseTitle.Text = caseLabel + " (" + serialNumber + ")"
      Else
        lblCaseTitle.Text = "Case " + serialNumber
      End If
    End If
  Catch e As DatabaseException
    MessageBox("Error loading case: " + e.Message)
  End Try
End Sub

' LoadExistingResponse Method (WITH NULL SUPPORT)
Sub LoadExistingResponse()
  Var sql As String = "SELECT * FROM user_responses WHERE user_id = ? AND case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, Session.CurrentUserID)
    ps.Bind(1, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      ' Load checkbox values with NULL/indeterminate support
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
      
      ' Load text conclusions
      txtConclusions.Text = rs.Column("user_conclusions").StringValue
      
      ' Load requires_full_echo checkbox (13th checkbox)
      If rs.Column("requires_full_echo").Value = Nil Then
        chkRequiresFullEcho.Indeterminate = True
      Else
        chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
        chkRequiresFullEcho.Indeterminate = False
      End If
      
      ' If completed, show results
      If rs.Column("is_completed").BooleanValue Then
        ShowCorrectAnswers()
        btnSubmit.Enabled = False
      End If
    End If
  Catch e As DatabaseException
    MessageBox("Error loading response: " + e.Message)
  End Try
End Sub

' LoadVideos Method
Sub LoadVideos()
  Var sql As String = "SELECT video_filename FROM case_videos WHERE case_id = ? ORDER BY video_order, video_id"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    VideoFilenames.RemoveAll
    While rs <> Nil And Not rs.AfterLastRow
      VideoFilenames.Add(rs.Column("video_filename").StringValue)
      rs.MoveToNextRow
    Wend
    
    TotalVideos = VideoFilenames.Count
    
    If TotalVideos > 0 Then
      CurrentVideoIndex = 0
      DisplayCurrentVideo()
    Else
      htmlVideoPlayer.LoadHTML("<html><body style='background:#1a1a1a;color:#ccc;text-align:center;padding:50px;font-family:Arial;'><h3>No videos available for this case</h3></body></html>")
    End If
    
  Catch e As DatabaseException
    MessageBox("Error loading videos: " + e.Message)
  End Try
End Sub


' =============================================================================
' wc_CaseReview WebContainer - PART 2 of 3
' Video Display and SaveResponse with MYSQL_TYPE_NULL for indeterminate checkboxes
' =============================================================================

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
  html = html + "body{margin:0;padding:0;background:transparent;overflow:hidden;}"
  html = html + "video{width:100%;height:100vh;object-fit:contain;display:block;}"
  html = html + "</style></head><body>"
  html = html + "<video controls loop autoplay playsinline>"
  html = html + "<source src='" + videoURL + "' type='video/mp4'>"
  html = html + "Your browser does not support the video tag.</video>"
  html = html + "<script>var v=document.getElementById||function(id){return document.querySelector('video');};"
  html = html + "var video=v('video')||document.querySelector('video');"
  html = html + "video.addEventListener('ended',function(){this.currentTime=0;this.play();});</script>"
  html = html + "</body></html>"
  
  htmlVideoPlayer.LoadHTML(html)
  UpdateVideoNavigation()
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
    DisplayCurrentVideo()
  End If
End Sub

' btnNextVideo.Pressed Event
Sub Pressed()
  If CurrentVideoIndex < TotalVideos - 1 Then
    CurrentVideoIndex = CurrentVideoIndex + 1
    DisplayCurrentVideo()
  End If
End Sub

' btnReplayVideo.Pressed Event
Sub Pressed()
  DisplayCurrentVideo()
End Sub

' SaveResponse Method (FIXED WITH MYSQL_TYPE_NULL)
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
      sql = "INSERT INTO user_responses (lv_size_dilated, lv_function_impaired, rv_size_dilated, rv_function_impaired, aortic_stenosis_significant, aortic_regurgitation_significant, mitral_stenosis_significant, mitral_regurgitation_significant, tricuspid_stenosis_significant, tricuspid_regurgitation_significant, pericardial_effusion_significant, ivc_high_ra_pressure, user_conclusions, requires_full_echo, is_completed, user_id, case_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
    End If
    
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    Var p As Integer = 0
    
    ' Bind all 12 assessment checkboxes with NULL support (FIXED)
    If chkLVSizeDilated.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkLVSizeDilated.Value)
    End If
    p = p + 1
    
    If chkLVFunctionImpaired.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkLVFunctionImpaired.Value)
    End If
    p = p + 1
    
    If chkRVSizeDilated.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkRVSizeDilated.Value)
    End If
    p = p + 1
    
    If chkRVFunctionImpaired.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkRVFunctionImpaired.Value)
    End If
    p = p + 1
    
    If chkAorticStenosis.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkAorticStenosis.Value)
    End If
    p = p + 1
    
    If chkAorticRegurgitation.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkAorticRegurgitation.Value)
    End If
    p = p + 1
    
    If chkMitralStenosis.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkMitralStenosis.Value)
    End If
    p = p + 1
    
    If chkMitralRegurgitation.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkMitralRegurgitation.Value)
    End If
    p = p + 1
    
    If chkTricuspidStenosis.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkTricuspidStenosis.Value)
    End If
    p = p + 1
    
    If chkTricuspidRegurgitation.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkTricuspidRegurgitation.Value)
    End If
    p = p + 1
    
    If chkPericardialEffusion.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkPericardialEffusion.Value)
    End If
    p = p + 1
    
    If chkIVCHighPressure.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkIVCHighPressure.Value)
    End If
    p = p + 1
    
    ' Bind conclusions text
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(p, txtConclusions.Text)
    p = p + 1
    
    ' Bind requires_full_echo checkbox (13th checkbox)
    If chkRequiresFullEcho.Indeterminate Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_NULL)
      ps.Bind(p, Nil)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      ps.Bind(p, chkRequiresFullEcho.Value)
    End If
    p = p + 1
    
    ' Bind is_completed
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, isCompleted)
    p = p + 1
    
    ' Bind completion flag for timestamp update
    ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_TINY)
    ps.Bind(p, isCompleted)
    p = p + 1
    
    ' Bind WHERE clause parameters for UPDATE or VALUES for INSERT
    If responseExists Then
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, Session.CurrentUserID)
      p = p + 1
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, CaseID)
    Else
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, Session.CurrentUserID)
      p = p + 1
      ps.BindType(p, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(p, CaseID)
    End If

    ps.ExecuteSQL
    
    If isCompleted Then
      MessageBox("Test submitted successfully!")
      ShowCorrectAnswers()
      btnSubmit.Enabled = False
      IsReviewMode = True
      LoadCase()
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


' =============================================================================
' wc_CaseReview WebContainer - PART 3 of 3
' ShowCorrectAnswers with color-coded scoring and feedback
' =============================================================================

' ShowCorrectAnswers Method
Sub ShowCorrectAnswers()
  ' Get correct answers from database
  Var sql As String = "SELECT * FROM cases WHERE case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      ' Get correct answers (handling NULL)
      Var correctLVSize As Variant = rs.Column("lv_size_dilated").Value
      Var correctLVFunction As Variant = rs.Column("lv_function_impaired").Value
      Var correctRVSize As Variant = rs.Column("rv_size_dilated").Value
      Var correctRVFunction As Variant = rs.Column("rv_function_impaired").Value
      Var correctAorticStenosis As Variant = rs.Column("aortic_stenosis_significant").Value
      Var correctAorticRegurg As Variant = rs.Column("aortic_regurgitation_significant").Value
      Var correctMitralStenosis As Variant = rs.Column("mitral_stenosis_significant").Value
      Var correctMitralRegurg As Variant = rs.Column("mitral_regurgitation_significant").Value
      Var correctTricuspidStenosis As Variant = rs.Column("tricuspid_stenosis_significant").Value
      Var correctTricuspidRegurg As Variant = rs.Column("tricuspid_regurgitation_significant").Value
      Var correctPericardial As Variant = rs.Column("pericardial_effusion_significant").Value
      Var correctIVC As Variant = rs.Column("ivc_high_ra_pressure").Value
      Var correctFullEcho As Variant = rs.Column("requires_full_echo").Value
      
      ' Calculate score (13 points total)
      Var score As Integer = 0
      Var total As Integer = 13
      
      ' Color-code checkboxes and calculate score
      ' Green = correct, Red = incorrect
      
      If correctLVSize <> Nil Then
        If chkLVSizeDilated.Value = correctLVSize.BooleanValue Then
          chkLVSizeDilated.TextColor = &c27ae60 ' Green
          score = score + 1
        Else
          chkLVSizeDilated.TextColor = &ce74c3c ' Red
        End If
      End If
      
      If correctLVFunction <> Nil Then
        If chkLVFunctionImpaired.Value = correctLVFunction.BooleanValue Then
          chkLVFunctionImpaired.TextColor = &c27ae60
          score = score + 1
        Else
          chkLVFunctionImpaired.TextColor = &ce74c3c
        End If
      End If
      
      If correctRVSize <> Nil Then
        If chkRVSizeDilated.Value = correctRVSize.BooleanValue Then
          chkRVSizeDilated.TextColor = &c27ae60
          score = score + 1
        Else
          chkRVSizeDilated.TextColor = &ce74c3c
        End If
      End If
      
      If correctRVFunction <> Nil Then
        If chkRVFunctionImpaired.Value = correctRVFunction.BooleanValue Then
          chkRVFunctionImpaired.TextColor = &c27ae60
          score = score + 1
        Else
          chkRVFunctionImpaired.TextColor = &ce74c3c
        End If
      End If
      
      If correctAorticStenosis <> Nil Then
        If chkAorticStenosis.Value = correctAorticStenosis.BooleanValue Then
          chkAorticStenosis.TextColor = &c27ae60
          score = score + 1
        Else
          chkAorticStenosis.TextColor = &ce74c3c
        End If
      End If
      
      If correctAorticRegurg <> Nil Then
        If chkAorticRegurgitation.Value = correctAorticRegurg.BooleanValue Then
          chkAorticRegurgitation.TextColor = &c27ae60
          score = score + 1
        Else
          chkAorticRegurgitation.TextColor = &ce74c3c
        End If
      End If
      
      If correctMitralStenosis <> Nil Then
        If chkMitralStenosis.Value = correctMitralStenosis.BooleanValue Then
          chkMitralStenosis.TextColor = &c27ae60
          score = score + 1
        Else
          chkMitralStenosis.TextColor = &ce74c3c
        End If
      End If
      
      If correctMitralRegurg <> Nil Then
        If chkMitralRegurgitation.Value = correctMitralRegurg.BooleanValue Then
          chkMitralRegurgitation.TextColor = &c27ae60
          score = score + 1
        Else
          chkMitralRegurgitation.TextColor = &ce74c3c
        End If
      End If
      
      If correctTricuspidStenosis <> Nil Then
        If chkTricuspidStenosis.Value = correctTricuspidStenosis.BooleanValue Then
          chkTricuspidStenosis.TextColor = &c27ae60
          score = score + 1
        Else
          chkTricuspidStenosis.TextColor = &ce74c3c
        End If
      End If
      
      If correctTricuspidRegurg <> Nil Then
        If chkTricuspidRegurgitation.Value = correctTricuspidRegurg.BooleanValue Then
          chkTricuspidRegurgitation.TextColor = &c27ae60
          score = score + 1
        Else
          chkTricuspidRegurgitation.TextColor = &ce74c3c
        End If
      End If
      
      If correctPericardial <> Nil Then
        If chkPericardialEffusion.Value = correctPericardial.BooleanValue Then
          chkPericardialEffusion.TextColor = &c27ae60
          score = score + 1
        Else
          chkPericardialEffusion.TextColor = &ce74c3c
        End If
      End If
      
      If correctIVC <> Nil Then
        If chkIVCHighPressure.Value = correctIVC.BooleanValue Then
          chkIVCHighPressure.TextColor = &c27ae60
          score = score + 1
        Else
          chkIVCHighPressure.TextColor = &ce74c3c
        End If
      End If
      
      If correctFullEcho <> Nil Then
        If chkRequiresFullEcho.Value = correctFullEcho.BooleanValue Then
          chkRequiresFullEcho.TextColor = &c27ae60
          score = score + 1
        Else
          chkRequiresFullEcho.TextColor = &ce74c3c
        End If
      End If
      
      ' Display score
      Var percentage As Double = (score / total) * 100
      lblScore.Text = "Score: " + Str(score) + "/" + Str(total) + " (" + Format(percentage, "0.0") + "%)"
      lblScore.Visible = True
      
      ' Display expert conclusions
      lblCorrectConclusionsTitle.Visible = True
      lblCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      lblCorrectConclusions.Visible = True
      
      ' Save score to database
      Var updateScoreSQL As String = "UPDATE user_responses SET score = ? WHERE user_id = ? AND case_id = ?"
      Var psScore As MySQLPreparedStatement = Session.DB.Prepare(updateScoreSQL)
      psScore.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psScore.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psScore.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psScore.Bind(0, score)
      psScore.Bind(1, Session.CurrentUserID)
      psScore.Bind(2, CaseID)
      psScore.ExecuteSQL
      
    End If
  Catch e As DatabaseException
    MessageBox("Error loading correct answers: " + e.Message)
  End Try
End Sub

' =============================================================================
' wc_CaseReview Complete Summary
' =============================================================================
' 
' This container is split into 3 parts:
' 
' PART 1: Properties, Opening, LoadCase, LoadExistingResponse, LoadVideos
' PART 2: DisplayCurrentVideo, UpdateVideoNavigation, SaveResponse, video buttons
' PART 3: ShowCorrectAnswers, scoring, button events (Save/Submit/Back)
' 
' STUDENT WORKFLOW:
' 1. Opens case from wc_UserHome
' 2. Reviews videos (all videos for the case)
' 3. Completes assessment checkboxes and conclusions
' 4. Saves draft OR submits for grading
' 5. After submit: sees color-coded results, score, and expert conclusions
' 6. Can use Back button to return to wc_UserHome
' 
' SCORING DETAILS:
' - 13 total questions (12 findings + requires_full_echo)
' - Green text = correct answer
' - Red text = incorrect answer
' - Score displayed as: "Score: 11/13 (84.6%)"
' - Score saved to user_responses.score
' - Rewards correct identification of both abnormal AND normal findings
' 
' NULL CHECKBOX SUPPORT:
' - Indeterminate checkboxes are saved as NULL in database
' - Uses MYSQL_TYPE_NULL when binding Nil
' - Uses MYSQL_TYPE_TINY when binding boolean values
' - Allows partial completion (save draft with indeterminate values)
' - Properly loads indeterminate state on LoadExistingResponse
' 
' VIDEO PLAYBACK:
' - Auto-loop for continuous review
' - Previous/Next navigation
' - Replay button
' - Transparent background
' - Proper aspect ratio (object-fit: contain)
' - WebFile-based video serving
' 
' COLOR CODES:
' - Green (&c27ae60): Correct answer
' - Red (&ce74c3c): Incorrect answer
' - Default (black): Not yet graded
' 
' =============================================================================
