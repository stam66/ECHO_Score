-- =============================================================================
-- wc_CaseReview WebContainer (PART 3 - ShowCorrectAnswers and Button Events)
-- Continued from Part 2
-- =============================================================================

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
      
      ' Apply styles based on correct/incorrect
      Var correctLVSize As Boolean = rs.Column("lv_size_dilated").BooleanValue
      chkLVSizeDilated.Style = If(chkLVSizeDilated.Value = correctLVSize, correctColorStyle, incorrectColorStyle)
      
      Var correctLVFunction As Boolean = rs.Column("lv_function_impaired").BooleanValue
      chkLVFunctionImpaired.Style = If(chkLVFunctionImpaired.Value = correctLVFunction, correctColorStyle, incorrectColorStyle)
      
      Var correctRVSize As Boolean = rs.Column("rv_size_dilated").BooleanValue
      chkRVSizeDilated.Style = If(chkRVSizeDilated.Value = correctRVSize, correctColorStyle, incorrectColorStyle)
      
      Var correctRVFunction As Boolean = rs.Column("rv_function_impaired").BooleanValue
      chkRVFunctionImpaired.Style = If(chkRVFunctionImpaired.Value = correctRVFunction, correctColorStyle, incorrectColorStyle)
      
      Var correctAorticStenosis As Boolean = rs.Column("aortic_stenosis_significant").BooleanValue
      chkAorticStenosis.Style = If(chkAorticStenosis.Value = correctAorticStenosis, correctColorStyle, incorrectColorStyle)
      
      Var correctAorticRegurg As Boolean = rs.Column("aortic_regurgitation_significant").BooleanValue
      chkAorticRegurgitation.Style = If(chkAorticRegurgitation.Value = correctAorticRegurg, correctColorStyle, incorrectColorStyle)
      
      Var correctMitralStenosis As Boolean = rs.Column("mitral_stenosis_significant").BooleanValue
      chkMitralStenosis.Style = If(chkMitralStenosis.Value = correctMitralStenosis, correctColorStyle, incorrectColorStyle)
      
      Var correctMitralRegurg As Boolean = rs.Column("mitral_regurgitation_significant").BooleanValue
      chkMitralRegurgitation.Style = If(chkMitralRegurgitation.Value = correctMitralRegurg, correctColorStyle, incorrectColorStyle)
      
      Var correctTricuspidStenosis As Boolean = rs.Column("tricuspid_stenosis_significant").BooleanValue
      chkTricuspidStenosis.Style = If(chkTricuspidStenosis.Value = correctTricuspidStenosis, correctColorStyle, incorrectColorStyle)
      
      Var correctTricuspidRegurg As Boolean = rs.Column("tricuspid_regurgitation_significant").BooleanValue
      chkTricuspidRegurgitation.Style = If(chkTricuspidRegurgitation.Value = correctTricuspidRegurg, correctColorStyle, incorrectColorStyle)
      
      Var correctPericardial As Boolean = rs.Column("pericardial_effusion_significant").BooleanValue
      chkPericardialEffusion.Style = If(chkPericardialEffusion.Value = correctPericardial, correctColorStyle, incorrectColorStyle)
      
      Var correctIVC As Boolean = rs.Column("ivc_high_ra_pressure").BooleanValue
      chkIVCHighPressure.Style = If(chkIVCHighPressure.Value = correctIVC, correctColorStyle, incorrectColorStyle)
      
      Var correctFullEcho As Boolean = rs.Column("requires_full_echo").BooleanValue
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
      If chkTricuspidStenosis.Value = correctTricuspidStenosis Then score = score + 