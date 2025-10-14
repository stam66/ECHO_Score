' =============================================================================
' wc_CaseReview WebContainer (PART 1 - Properties and Video Controls)
' Student case review and testing interface
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseReview
' Super: wc_Base

' ******************************************************************
' Properties:
' ******************************************************************
Public CaseID As Integer
Private CurrentVideoIndex As Integer = 0
Private TotalVideos As Integer = 0
Private VideoFilenames() As String
Private IsReviewMode As Boolean = False

' ******************************************************************
' Controls:
' ******************************************************************
' Video Section Controls:
' Label: lblCaseTitle (Bold, Large)
' HTMLViewer: htmlVideoPlayer (Large area - at least 800px wide)
' Label: lblVideoCounter (text: "")
' PushButton: btnPreviousVideo (text: "← Previous")
' PushButton: btnNextVideo (text: "Next →")
' PushButton: btnReplayVideo (text: "⟳ Replay")

' Assessment Section Controls (12 checkboxes):
' Label: lblAssessment (text: "ASSESSMENT:", Bold)
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

' Conclusions Section Controls:
' Label: lblConclusions (text: "Your Conclusions:")
' TextArea: txtConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?")

' Action Buttons Controls:
' PushButton: btnSave (text: "Save Draft")
' PushButton: btnSubmit (text: "Submit")
' PushButton: btnBack (text: "Back")

' Results Section (Initially Hidden) Controls:
' Label: lblCorrectConclusionsTitle (text: "Expert Conclusions:", Bold, Visible = False)
' Label: lblCorrectConclusions (text: "", Visible = False)
' Label: lblScore (text: "", Bold, Visible = False)

' ******************************************************************
' wc_CaseReview.Opening Event
' ******************************************************************
Sub Opening()
  LoadCase
  LoadExistingResponse
  LoadVideos
  UpdateVideoNavigation
End Sub

' ******************************************************************
' LoadCase Method
' ******************************************************************
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

' ******************************************************************
' LoadExistingResponse Method
' ******************************************************************
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
      chkLVSizeDilated.Value = rs.Column("lv_size_dilated").BooleanValue
      chkLVFunctionImpaired.Value = rs.Column("lv_function_impaired").BooleanValue
      chkRVSizeDilated.Value = rs.Column("rv_size_dilated").BooleanValue
      chkRVFunctionImpaired.Value = rs.Column("rv_function_impaired").BooleanValue
      chkAorticStenosis.Value = rs.Column("aortic_stenosis_significant").BooleanValue
      chkAorticRegurgitation.Value = rs.Column("aortic_regurgitation_significant").BooleanValue
      chkMitralStenosis.Value = rs.Column("mitral_stenosis_significant").BooleanValue
      chkMitralRegurgitation.Value = rs.Column("mitral_regurgitation_significant").BooleanValue
      chkTricuspidStenosis.Value = rs.Column("tricuspid_stenosis_significant").BooleanValue
      chkTricuspidRegurgitation.Value = rs.Column("tricuspid_regurgitation_significant").BooleanValue
      chkPericardialEffusion.Value = rs.Column("pericardial_effusion_significant").BooleanValue
      chkIVCHighPressure.Value = rs.Column("ivc_high_ra_pressure").BooleanValue
      txtConclusions.Text = rs.Column("user_conclusions").StringValue
      chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
      
      If rs.Column("is_completed").BooleanValue Then
        ShowCorrectAnswers
        btnSubmit.Enabled = False
        IsReviewMode = True
      End If
    End If
  Catch e As DatabaseException
    MessageBox("Error loading response: " + e.Message)
  End Try
End Sub

' ******************************************************************
' LoadVideos Method (WITH MULTI-GROUP FILTERING)
' ******************************************************************
Sub LoadVideos()
  ' Get current user's group
  Var userGroup As String = ""
  Var userSQL As String = "SELECT user_group FROM users WHERE user_id = ?"
  
  Try
    Var userPS As MySQLPreparedStatement = Session.DB.Prepare(userSQL)
    userPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    userPS.Bind(0, Session.CurrentUserID)
    
    Var userRS As RowSet = userPS.SelectSQL
    If userRS <> Nil And Not userRS.AfterLastRow Then
      userGroup = userRS.Column("user_group").StringValue
    End If
  Catch e As DatabaseException
    ' If error, show all videos
  End Try
  
  ' Build SQL based on whether user has a group
  Var sql As String
  If userGroup.Trim = "" Then
    ' No group - show all videos
    sql = "SELECT video_filename FROM case_videos WHERE case_id = ? ORDER BY video_order"
  Else
    ' Has group - show matching videos OR videos with no purpose set
    sql = "SELECT video_filename FROM case_videos " + _
    "WHERE case_id = ? " + _
    "AND (video_purpose IS NULL OR video_purpose = '' " + _
    "OR FIND_IN_SET(?, REPLACE(video_purpose, ' ', '')) > 0 " + _
    "OR video_purpose LIKE ?) " + _
    "ORDER BY video_order"
  End If
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    If userGroup.Trim <> "" Then
      ' Remove spaces from user group for comparison
      Var cleanUserGroup As String = userGroup.ReplaceAll(" ", "")
      
      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(1, cleanUserGroup)
      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(2, "%" + userGroup + "%")
    End If
    
    Var rs As RowSet = ps.SelectSQL
    
    Redim VideoFilenames(-1)
    
    While Not rs.AfterLastRow
      VideoFilenames.Add(rs.Column("video_filename").StringValue)
      rs.MoveToNextRow
    Wend
    
    TotalVideos = VideoFilenames.Count
    
    If TotalVideos > 0 Then
      CurrentVideoIndex = 0
      DisplayCurrentVideo
    Else
      MessageBox("No videos available for your group")
    End If
    
  Catch e As DatabaseException
    MessageBox("Error loading videos: " + e.Message)
  End Try
End Sub

' =============================================================================
' wc_CaseReview WebContainer (PART 2 - Video Display and Save/Submit)
' =============================================================================

' ******************************************************************
' DisplayCurrentVideo Method (USING WEBFILE)
' ******************************************************************
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

' ******************************************************************
' UpdateVideoNavigation Method
' ******************************************************************
Sub UpdateVideoNavigation()
  If TotalVideos = 0 Then Return
  
  lblVideoCounter.Text = "Video " + Str(CurrentVideoIndex + 1) + " of " + Str(TotalVideos)
  btnPreviousVideo.Enabled = (CurrentVideoIndex > 0)
  btnNextVideo.Enabled = (CurrentVideoIndex < TotalVideos - 1)
End Sub

' ******************************************************************
' btnPreviousVideo.Pressed Event
' ******************************************************************
Sub Pressed()
  If CurrentVideoIndex > 0 Then
    CurrentVideoIndex = CurrentVideoIndex - 1
    DisplayCurrentVideo
  End If
End Sub

' ******************************************************************
' btnNextVideo.Pressed Event
' ******************************************************************
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

' ******************************************************************
' SaveResponse Method
' ******************************************************************
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

' ******************************************************************
' btnSave.Pressed Event
' ******************************************************************
Sub Pressed()
  SaveResponse(False)
End Sub

' ******************************************************************
' btnSubmit.Pressed Event
' ******************************************************************
Sub Pressed()
  SaveResponse(True)
End Sub

' ******************************************************************
' btnBack.Pressed Event
' ******************************************************************
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

' =============================================================================
' wc_CaseReview WebContainer (PART 3 - ShowCorrectAnswers and Button Events)
' Continued from Part 2
' =============================================================================

' ShowCorrectAnswers Method (WITH WEBSTYLE)
Sub ShowCorrectAnswers()
  Var sql As String = "SELECT * FROM cases WHERE case_id = ?"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    If rs <> Nil And Not rs.AfterLastRow Then
      ' Create WebStyles for correct and incorrect answers
      Var correctColorStyle As New WebStyle
      Var incorrectColorStyle As New WebStyle
      correctColorStyle.ForegroundColor = &c27ae60
      incorrectColorStyle.ForegroundColor = &ce74c3c
      
      ' Disable all checkboxes
      chkLVSizeDilated.Enabled = False
      chkLVFunctionImpaired.Enabled = False
      chkRVSizeDilated.Enabled = False
      chkRVFunctionImpaired.Enabled = False
      chkAorticStenosis.Enabled = False
      chkAorticRegurgitation.Enabled = False
      chkMitralStenosis.Enabled = False
      chkMitralRegurgitation.Enabled = False
      chkTricuspidStenosis.Enabled = False
      chkTricuspidRegurgitation.Enabled = False
      chkPericardialEffusion.Enabled = False
      chkIVCHighPressure.Enabled = False
      chkRequiresFullEcho.Enabled = False
      txtConclusions.ReadOnly = True
      
      ' Get correct answers from database
      Var correctLVSize As Boolean = rs.Column("lv_size_dilated").BooleanValue
      Var correctLVFunction As Boolean = rs.Column("lv_function_impaired").BooleanValue
      Var correctRVSize As Boolean = rs.Column("rv_size_dilated").BooleanValue
      Var correctRVFunction As Boolean = rs.Column("rv_function_impaired").BooleanValue
      Var correctAorticStenosis As Boolean = rs.Column("aortic_stenosis_significant").BooleanValue
      Var correctAorticRegurg As Boolean = rs.Column("aortic_regurgitation_significant").BooleanValue
      Var correctMitralStenosis As Boolean = rs.Column("mitral_stenosis_significant").BooleanValue
      Var correctMitralRegurg As Boolean = rs.Column("mitral_regurgitation_significant").BooleanValue
      Var correctTricuspidStenosis As Boolean = rs.Column("tricuspid_stenosis_significant").BooleanValue
      Var correctTricuspidRegurg As Boolean = rs.Column("tricuspid_regurgitation_significant").BooleanValue
      Var correctPericardial As Boolean = rs.Column("pericardial_effusion_significant").BooleanValue
      Var correctIVC As Boolean = rs.Column("ivc_high_ra_pressure").BooleanValue
      Var correctFullEcho As Boolean = rs.Column("requires_full_echo").BooleanValue
      
      ' Apply color styles based on correct/incorrect
      chkLVSizeDilated.Style = If(chkLVSizeDilated.Value = correctLVSize, correctColorStyle, incorrectColorStyle)
      chkLVFunctionImpaired.Style = If(chkLVFunctionImpaired.Value = correctLVFunction, correctColorStyle, incorrectColorStyle)
      chkRVSizeDilated.Style = If(chkRVSizeDilated.Value = correctRVSize, correctColorStyle, incorrectColorStyle)
      chkRVFunctionImpaired.Style = If(chkRVFunctionImpaired.Value = correctRVFunction, correctColorStyle, incorrectColorStyle)
      chkAorticStenosis.Style = If(chkAorticStenosis.Value = correctAorticStenosis, correctColorStyle, incorrectColorStyle)
      chkAorticRegurgitation.Style = If(chkAorticRegurgitation.Value = correctAorticRegurg, correctColorStyle, incorrectColorStyle)
      chkMitralStenosis.Style = If(chkMitralStenosis.Value = correctMitralStenosis, correctColorStyle, incorrectColorStyle)
      chkMitralRegurgitation.Style = If(chkMitralRegurgitation.Value = correctMitralRegurg, correctColorStyle, incorrectColorStyle)
      chkTricuspidStenosis.Style = If(chkTricuspidStenosis.Value = correctTricuspidStenosis, correctColorStyle, incorrectColorStyle)
      chkTricuspidRegurgitation.Style = If(chkTricuspidRegurgitation.Value = correctTricuspidRegurg, correctColorStyle, incorrectColorStyle)
      chkPericardialEffusion.Style = If(chkPericardialEffusion.Value = correctPericardial, correctColorStyle, incorrectColorStyle)
      chkIVCHighPressure.Style = If(chkIVCHighPressure.Value = correctIVC, correctColorStyle, incorrectColorStyle)
      chkRequiresFullEcho.Style = If(chkRequiresFullEcho.Value = correctFullEcho, correctColorStyle, incorrectColorStyle)

      ' Show expert conclusions
      lblCorrectConclusionsTitle.Text = "Expert Conclusions:"
      lblCorrectConclusionsTitle.Visible = True
      lblCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      lblCorrectConclusions.Visible = True
      
      ' Calculate score
      Var score As Integer = 0
      Var total As Integer = 13
      
      If chkLVSizeDilated.Value = correctLVSize Then score = score + 1
      If chkLVFunctionImpaired.Value = correctLVFunction Then score = score + 1
      If chkRVSizeDilated.Value = correctRVSize Then score = score + 1
      If chkRVFunctionImpaired.Value = correctRVFunction Then score = score + 1
      If chkAorticStenosis.Value = correctAorticStenosis Then score = score + 1
      If chkAorticRegurgitation.Value = correctAorticRegurg Then score = score + 1
      If chkMitralStenosis.Value = correctMitralStenosis Then score = score + 1
      If chkMitralRegurgitation.Value = correctMitralRegurg Then score = score + 1
      If chkTricuspidStenosis.Value = correctTricuspidStenosis Then score = score + 1
      If chkTricuspidRegurgitation.Value = correctTricuspidRegurg Then score = score + 1
      If chkPericardialEffusion.Value = correctPericardial Then score = score + 1
      If chkIVCHighPressure.Value = correctIVC Then score = score + 1
      If chkRequiresFullEcho.Value = correctFullEcho Then score = score + 1
      
      Var percentage As Double = (score / total) * 100
      lblScore.Text = "Score: " + Str(score) + "/" + Str(total) + " (" + Format(percentage, "0.0") + "%)"
      lblScore.Visible = True
      
    End If
  Catch e As DatabaseException
    MessageBox("Error loading correct answers: " + e.Message)
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
' wc_CaseReview Complete Summary
' =============================================================================
' 
' This container is split into 3 parts:
' 
' PART 1: Properties, Opening, LoadCase, LoadExistingResponse, LoadVideos
' PART 2: DisplayCurrentVideo, UpdateVideoNavigation, SaveResponse, video buttons
' PART 3: ShowCorrectAnswers, scoring, button events (Save/Submit/Back)
' 
' Student Workflow:
' 1. Opens case from wc_UserHome
' 2. Reviews videos (filtered by user group)
' 3. Completes assessment checkboxes and conclusions
' 4. Saves draft OR submits for grading
' 5. After submit: sees color-coded results, score, and expert conclusions
' 6. Returns to wc_UserHome
' 
' Scoring Details:
' - 13 total questions (all checkboxes)
' - Green text = correct answer
' - Red text = incorrect answer
' - Score displayed as: "Score: 11/13 (84.6%)"
' - Rewards correct identification of both abnormal AND normal findings
' =============================================================================