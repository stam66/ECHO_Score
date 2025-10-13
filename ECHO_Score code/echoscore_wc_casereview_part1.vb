-- =============================================================================
-- wc_CaseReview WebContainer (PART 1 - Properties and Video Controls)
-- Student case review and testing interface
-- =============================================================================

' Insert → WebContainer
' Name: wc_CaseReview
' Super: wc_Base

' Properties:
Public CaseID As Integer
Private CurrentVideoIndex As Integer = 0
Private TotalVideos As Integer = 0
Private VideoFilenames() As String
Private IsReviewMode As Boolean = False

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

' wc_CaseReview.Opening Event
Sub Opening()
  LoadCase
  LoadExistingResponse
  LoadVideos
  UpdateVideoNavigation
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

' LoadExistingResponse Method
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

' LoadVideos Method (WITH MULTI-GROUP FILTERING)
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

' Continue in Part 2...
' =============================================================================