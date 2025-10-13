-- =============================================================================
-- wc_CaseDetails WebContainer (PART 1 - Properties and Layout)
-- Detailed case editor with video management (Screen 2 of 2)
-- =============================================================================

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

' Continue in Part 2...
' =============================================================================