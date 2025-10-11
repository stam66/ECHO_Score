' Insert → WebContainer
' Name: wc_CaseAdmin
' Super: wc_Base

' *******************************************************************************
' Controls - Cases Section:
' *******************************************************************************
' Label: lblCasesTitle (text: "Cases", Bold)
' ListBox: lstCases (2 columns: Serial, Case Label)
' PushButton: btnAddCase (text: "Add Case")
' PushButton: btnUpdateCase (text: "Update Case")
' PushButton: btnDeleteCase (text: "Delete Case")

' *******************************************************************************
' Controls - Case Details Section:
' *******************************************************************************
' Label: lblCaseDetails (text: "Case Details", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber
' Label: lblLabel (text: "Case Label:")
' TextField: txtCaseLabel
' Label: lblCorrectAnswers (text: "Correct Answers:", Bold)
' CheckBox: chkLVSizeDilated through chkIVCHighPressure (same 12 as in wc_CaseReview)
' Label: lblCorrectConclusions (text: "Correct Conclusions:")
' TextArea: txtCorrectConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?")

' *******************************************************************************
' Controls - Videos Section:
' *******************************************************************************
' Label: lblVideosTitle (text: "Videos for Selected Case", Bold)
' ListBox: lstVideos (3 columns: Filename, View Description, Order)
' Label: lblVideoPreview (text: "Video Preview:", Bold)
' HTMLViewer: htmlVideoPreview
' Label: lblAddVideo (text: "Add Video:", Bold)
' Label: lblFilename (text: "Filename:")
' TextField: txtVideoFilename
' Label: lblViewDesc (text: "View Description:")
' TextField: txtViewDescription
' Label: lblOrder (text: "Order:")
' TextField: txtVideoOrder
' PushButton: btnAddVideo (text: "Add Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnBack (text: "Back")


' *******************************************************************************
' wc_CaseAdmin.Opening event
' *******************************************************************************
Sub Opening()
  LoadCases
End Sub


' *******************************************************************************
' LoadCases Method 
' *******************************************************************************
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



' *******************************************************************************
' LoadCaseDetails Method
' *******************************************************************************
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
      txtCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
    End If
  Catch e As DatabaseException
    MessageBox("Error loading case details: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' LoadCaseVideos Method
' *******************************************************************************
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
      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 2) = rs.Column("video_order").IntegerValue.ToString
      lstVideos.RowTagAt(lstVideos.LastAddedRowIndex) = rs.Column("video_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
  Catch e As DatabaseException
    MessageBox("Error loading videos: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' ClearCaseFields Method
' *******************************************************************************
Sub ClearCaseFields()
  txtSerialNumber.Text = ""
  txtCaseLabel.Text = ""
  chkLVSizeDilated.Value = False
  chkLVFunctionImpaired.Value = False
  chkRVSizeDilated.Value = False
  chkRVFunctionImpaired.Value = False
  chkAorticStenosis.Value = False
  chkAorticRegurgitation.Value = False
  chkMitralStenosis.Value = False
  chkMitralRegurgitation.Value = False
  chkTricuspidStenosis.Value = False
  chkTricuspidRegurgitation.Value = False
  chkPericardialEffusion.Value = False
  chkIVCHighPressure.Value = False
  txtCorrectConclusions.Text = ""
  chkRequiresFullEcho.Value = False
End Sub


' *******************************************************************************
' lstCases.SelectionChanged Event
' *******************************************************************************
Sub SelectionChanged()
  If Me.SelectedRowIndex < 0 Then Return
  
  Var caseID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
  LoadCaseDetails(caseID)
  LoadCaseVideos(caseID)
End Sub


' *******************************************************************************
' lstVideos.SelectionChanged Event
' *******************************************************************************
Sub SelectionChanged()
  If Me.SelectedRowIndex < 0 Then
    htmlVideoPreview.LoadHTML("")
    Return
  End If
  
  Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
  Var videoPath As String = "../Documents/CaseVideos/" + videoFilename
  
  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
  html = html + "body{margin:0;padding:10px;background:#1a1a1a;display:flex;justify-content:center;align-items:center;min-height:100%;}"
  html = html + ".video-container{width:100%;max-width:600px;background:#000;border-radius:8px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.5);}"
  html = html + "video{width:100%;height:auto;display:block;background:#000;}"
  html = html + "</style></head><body><div class='video-container'>"
  html = html + "<video controls loop autoplay playsinline>"
  html = html + "<source src='" + videoPath + "' type='video/mp4'>"
  html = html + "Your browser does not support the video tag.</video></div>"
  html = html + "<script>var v=document.querySelector('video');"
  html = html + "v.addEventListener('ended',function(){this.currentTime=0;this.play();});</script>"
  html = html + "</body></html>"
  
  htmlVideoPreview.LoadHTML(html)
End Sub


' *******************************************************************************
' btnAddCase.Pressed Event 
' *******************************************************************************
Sub Pressed()
  If txtSerialNumber.Text.Trim = "" Or txtCaseLabel.Text.Trim = "" Then
    MessageBox("Please enter serial number and case label")
    Return
  End If
  
  Var sql As String = "INSERT INTO cases (serial_number, case_label, lv_size_dilated, lv_function_impaired, rv_size_dilated, rv_function_impaired, aortic_stenosis_significant, aortic_regurgitation_significant, mitral_stenosis_significant, mitral_regurgitation_significant, tricuspid_stenosis_significant, tricuspid_regurgitation_significant, pericardial_effusion_significant, ivc_high_ra_pressure, correct_conclusions, requires_full_echo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
  
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
    
    ps.ExecuteSQL
    
    MessageBox("Case added successfully!")
    ClearCaseFields
    LoadCases
    
  Catch e As DatabaseException
    MessageBox("Error adding case: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' btnUpdateCase.Pressed Event
' *******************************************************************************
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
    
    ps.SQLExecute
    
    MessageBox("Case updated successfully!")
    LoadCases
    
  Catch e As DatabaseException
    MessageBox("Error updating case: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' btnDeleteCase.Pressed Event:
' *******************************************************************************
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

'********************************************************************************
'HandleDeleteCaseConfirm Method - delegate for delete confirmation dialog
'********************************************************************************
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


' *******************************************************************************
' btnAddVideo.Pressed Event
' *******************************************************************************
Sub Pressed()
  If lstCases.SelectedRowIndex < 0 Then
    MessageBox("Please select a case first")
    Return
  End If
  
  If txtVideoFilename.Text.Trim = "" Then
    MessageBox("Please enter video filename")
    Return
  End If
  
  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
  
  Var videoOrder As Integer
  If txtVideoOrder.Text.Trim = "" Then
    Var orderSQL As String = "SELECT COALESCE(MAX(video_order), -1) + 1 AS next_order FROM case_videos WHERE case_id = ?"
    
    Try
      Var orderPS As MySQLPreparedStatement = Session.DB.Prepare(orderSQL)
      orderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      orderPS.Bind(0, caseID)
      
      Var orderRS As RowSet = orderPS.SelectSQL
      If orderRS <> Nil And Not orderRS.AfterLastRow Then
        videoOrder = orderRS.Column("next_order").IntegerValue
      Else
        videoOrder = 0
      End If
    Catch e As DatabaseException
      MessageBox("Error getting video order: " + e.Message)
      Return
    End Try
  Else
    videoOrder = Val(txtVideoOrder.Text.Trim)
  End If
  
  Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_order) VALUES (?, ?, ?, ?)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, caseID)
    ps.Bind(1, txtVideoFilename.Text.Trim)
    ps.Bind(2, txtViewDescription.Text.Trim)
    ps.Bind(3, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video added successfully!")
    txtVideoFilename.Text = ""
    txtViewDescription.Text = ""
    txtVideoOrder.Text = ""
    LoadCaseVideos(caseID)
    
  Catch e As DatabaseException
    MessageBox("Error adding video: " + e.Message)
  End Try
End Sub


' *******************************************************************************
' btnDeleteVideo.Pressed Event
' *******************************************************************************
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

'********************************************************************************
'HandleDeleteVideoConfirm Method - delegate for delete confirmation dialog
'********************************************************************************
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


' *******************************************************************************
' btnBack.Pressed Event
' *******************************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub