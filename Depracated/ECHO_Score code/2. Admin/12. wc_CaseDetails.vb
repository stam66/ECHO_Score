
' =============================================================================
' wc_CaseDetails WebContainer (COMPLETE - with Tag-Based Group Selection)
' Detailed case editor with video management and group assignment
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseDetails
' Super: wc_Base

' ******************************************************************
' Properties:
' ******************************************************************
Public CaseID As Integer
Private mOriginalCellValue As String
Private mLastVideoID As Integer
Private mLastColumn As Integer
Private mLastOldValue As String
Private mLastNewValue As String
Private mCaseInfoChanged As Boolean = False
Private mAnswersChanged As Boolean = False
Private mGroupsChanged As Boolean = False
Private mOriginalGroups() As String

' ******************************************************************
'Controls:
' ******************************************************************
' CASE INFO SECTION (Top):
' Label: lblCaseInfo (text: "Case Information", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblDescription (text: "Case Description:")
' TextField: txtCaseLabel (ReadOnly = False, Editable = True)

' GROUP ASSIGNMENT SECTION:
' Label: lblGroupAssignment (text: "Assigned Groups", Bold)
' Label: lblGroupInstructions (text: "Select a group and click Add. Students in any assigned group will see this case.")
' PopupMenu: popAvailableGroups
' PushButton: btnAddGroup (text: "Add Group")
' Label: lblCurrentGroups (text: "Currently Assigned:")
' ListBox: lstAssignedGroups (1 column: Group Name)
' PushButton: btnRemoveGroup (text: "Remove Selected")

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

' SAVE/CANCEL SECTION:
' PushButton: btnSaveAll (text: "Save All Changes", Large, Primary style)
' PushButton: btnCancelChanges (text: "Cancel Changes")

' VIDEOS SECTION:
' Label: lblVideos (text: "Case Videos", Bold)
' Label: lblVideoInstructions (text: "Click 'Choose File' to select video, then click 'Upload'. Double-click cells to edit view description or order.")
' ListBox: lstVideos (3 columns: Filename, View Description, Order)
'   - Column widths: Filename (fill remaining), View Description (150px), Order (50px)
' WebFileUploader: uplVideo (AllowMultipleFiles = False, Filter = "video/mp4,video/*")
' PushButton: btnStartUpload (text: "Upload Selected Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnUndoVideoEdit (text: "Undo Last Change", Enabled = False)

' VIDEO PREVIEW SECTION:
' Label: lblVideoPreview (text: "Video Preview", Bold)
' HTMLViewer: htmlVideoPreview

' NAVIGATION:
' PushButton: btnBackToList (text: "Back to Case List")

' ******************************************************************
' wc_CaseDetails.Opening Event
' ******************************************************************
Sub Opening() // CHANGED
  ' Configure listbox columns (3 columns: Filename, View Description, Order)
  lstVideos.ColumnWidthAt(0) = 390  ' Filename
  lstVideos.ColumnWidthAt(1) = 200  ' View Description - fits "parasternal LAX" with spacing
  lstVideos.ColumnWidthAt(2) = 100  ' Order - 3 digits with spacing
  
  ' Set editable columns
  lstVideos.ColumnTypeAt(1) = WebListBox.CellTypes.TextField
  lstVideos.ColumnTypeAt(2) = WebListBox.CellTypes.TextField
  
  LoadAvailableGroups
  LoadCaseDetails
  LoadCaseVideos
  mCaseInfoChanged = False
  mAnswersChanged = False
  mGroupsChanged = False
  btnUndoVideoEdit.Enabled = False
  btnStartUpload.Enabled = False
End Sub

' ******************************************************************
' LoadAvailableGroups Method
' ******************************************************************
Sub LoadAvailableGroups()
  popAvailableGroups.RemoveAllRows
  
  ' Add common groups
  Var currentYear As Integer = DateTime.Now.Year
  Var quarters() As String = Array("Q1", "Q2", "Q3", "Q4")
  Var specialties() As String = Array("Cardiology", "ICU", "ED", "Medicine", "Surgery")
  
  For Each specialty As String In specialties
    For Each quarter As String In quarters
      popAvailableGroups.AddRow(specialty + " " + Str(currentYear) + " " + quarter)
    Next
  Next
  
  ' Load existing groups from database (from both user_group and case_groups)
  Var sql As String = "SELECT DISTINCT user_group FROM users WHERE user_group IS NOT NULL AND user_group <> '' UNION SELECT DISTINCT case_groups FROM cases WHERE case_groups IS NOT NULL AND case_groups <> '' ORDER BY 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    Var uniqueGroups() As String
    
    While Not rs.AfterLastRow
      Var groupText As String = rs.Column(0).StringValue
      
      ' Split comma-separated groups
      If groupText.Trim <> "" Then
        Var groups() As String = groupText.Split(",")
        For Each group As String In groups
          Var cleanGroup As String = group.Trim
          If cleanGroup <> "" Then
            ' Add if not already in list
            Var found As Boolean = False
            For Each existing As String In uniqueGroups
              If existing = cleanGroup Then
                found = True
                Exit For existing
              End If
            Next
            If Not found Then
              uniqueGroups.Add(cleanGroup)
            End If
          End If
        Next
      End If
      
      rs.MoveToNextRow
    Wend
    
    ' Add unique groups to popup
    For Each group As String In uniqueGroups
      ' Check if already in popup
      Var alreadyExists As Boolean = False
      For i As Integer = 0 To popAvailableGroups.RowCount - 1
        If popAvailableGroups.RowTextAt(i) = group Then
          alreadyExists = True
          Exit For i
        End If
      Next
      
      If Not alreadyExists Then
        popAvailableGroups.AddRow(group)
      End If
    Next
    
  Catch e As DatabaseException
    System.DebugLog("Error loading groups: " + e.Message)
  End Try
  
  If popAvailableGroups.RowCount > 0 Then
    popAvailableGroups.SelectedRowIndex = 0
  End If
End Sub

' ******************************************************************
' LoadCaseDetails Method
' ******************************************************************
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
      
      ' Load assigned groups
      Var caseGroups As String = rs.Column("case_groups").StringValue
      LoadAssignedGroups(caseGroups)
      
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

' ******************************************************************
' LoadAssignedGroups Method
' ******************************************************************
Sub LoadAssignedGroups(caseGroups As String)
  lstAssignedGroups.RemoveAllRows
  Redim mOriginalGroups(-1)
  
  If caseGroups.Trim <> "" Then
    Var groups() As String = caseGroups.Split(",")
    For Each group As String In groups
      Var cleanGroup As String = group.Trim
      If cleanGroup <> "" Then
        lstAssignedGroups.AddRow(cleanGroup)
        mOriginalGroups.Add(cleanGroup)
      End If
    Next
  End If
End Sub

' ******************************************************************
' GetCurrentGroups Method
' ******************************************************************
Function GetCurrentGroups() As String
  Var groups() As String
  
  For i As Integer = 0 To lstAssignedGroups.RowCount - 1
    groups.Add(lstAssignedGroups.CellTextAt(i, 0))
  Next
  
  Return String.FromArray(groups, ",")
End Function

' btnAddGroup.Pressed Event
Sub Pressed()
  If popAvailableGroups.SelectedRowIndex < 0 Then
    MessageBox("Please select a group to add")
    Return
  End If
  
  Var selectedGroup As String = popAvailableGroups.RowTextAt(popAvailableGroups.SelectedRowIndex)
  
  ' Check if already assigned
  For i As Integer = 0 To lstAssignedGroups.RowCount - 1
    If lstAssignedGroups.CellTextAt(i, 0) = selectedGroup Then
      MessageBox("This group is already assigned")
      Return
    End If
  Next
  
  ' Add to list
  lstAssignedGroups.AddRow(selectedGroup)
  mGroupsChanged = True
  
  System.DebugLog("Group added: " + selectedGroup)
End Sub

' ******************************************************************
' btnRemoveGroup.Pressed Event
' ******************************************************************
Sub Pressed()
  If lstAssignedGroups.SelectedRowIndex < 0 Then
    MessageBox("Please select a group to remove")
    Return
  End If
  
  Var selectedGroup As String = lstAssignedGroups.CellTextAt(lstAssignedGroups.SelectedRowIndex, 0)
  lstAssignedGroups.RemoveRowAt(lstAssignedGroups.SelectedRowIndex)
  mGroupsChanged = True
  
  System.DebugLog("Group removed: " + selectedGroup)
End Sub

' ******************************************************************
' LoadCaseVideos Method
' ******************************************************************
Sub LoadCaseVideos() // CHANGED
  lstVideos.RemoveAllRows
  
  Var sql As String = "SELECT video_id, video_filename, view_description, video_order FROM case_videos WHERE case_id = ? ORDER BY video_order"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
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

' ******************************************************************
' Track changes
' ******************************************************************
Sub TrackCaseInfoChange()
  mCaseInfoChanged = True
End Sub

Sub TrackAnswerChange()
  mAnswersChanged = True
End Sub

' NOTE: In the IDE, add these event handlers:
' - txtCaseLabel.TextChanged → call TrackCaseInfoChange()
' - All checkboxes ValueChanged → call TrackAnswerChange()
' - txtCorrectConclusions.TextChanged → call TrackAnswerChange()

' ******************************************************************
' btnSaveAll.Pressed Event
' ******************************************************************
Sub Pressed()
  Var changesMade As Boolean = False
  
  ' Validate case label
  If txtCaseLabel.Text.Trim = "" Then
    MessageBox("Case description cannot be empty")
    Return
  End If
  
  Try
    Session.DB.BeginTransaction
    
    ' Save case info (description and groups)
    If mCaseInfoChanged Or mGroupsChanged Then
      Var sqlCase As String = "UPDATE cases SET case_label = ?, case_groups = ? WHERE case_id = ?"
      Var psCase As MySQLPreparedStatement = Session.DB.Prepare(sqlCase)
      psCase.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psCase.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psCase.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psCase.Bind(0, txtCaseLabel.Text.Trim)
      psCase.Bind(1, GetCurrentGroups())
      psCase.Bind(2, CaseID)
      psCase.ExecuteSQL
      changesMade = True
    End If
    
    ' Save correct answers if changed
    If mAnswersChanged Then
      Var sqlAnswers As String = "UPDATE cases SET lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, correct_conclusions=?, requires_full_echo=? WHERE case_id=?"
      
      Var psAnswers As MySQLPreparedStatement = Session.DB.Prepare(sqlAnswers)
      
      psAnswers.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkLVSizeDilated.Indeterminate Then
        psAnswers.Bind(0, Nil)
      Else
        psAnswers.Bind(0, chkLVSizeDilated.Value)
      End If
      
      psAnswers.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkLVFunctionImpaired.Indeterminate Then
        psAnswers.Bind(1, Nil)
      Else
        psAnswers.Bind(1, chkLVFunctionImpaired.Value)
      End If
      
      psAnswers.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRVSizeDilated.Indeterminate Then
        psAnswers.Bind(2, Nil)
      Else
        psAnswers.Bind(2, chkRVSizeDilated.Value)
      End If
      
      psAnswers.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRVFunctionImpaired.Indeterminate Then
        psAnswers.Bind(3, Nil)
      Else
        psAnswers.Bind(3, chkRVFunctionImpaired.Value)
      End If
      
      psAnswers.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkAorticStenosis.Indeterminate Then
        psAnswers.Bind(4, Nil)
      Else
        psAnswers.Bind(4, chkAorticStenosis.Value)
      End If
      
      psAnswers.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkAorticRegurgitation.Indeterminate Then
        psAnswers.Bind(5, Nil)
      Else
        psAnswers.Bind(5, chkAorticRegurgitation.Value)
      End If
      
      psAnswers.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkMitralStenosis.Indeterminate Then
        psAnswers.Bind(6, Nil)
      Else
        psAnswers.Bind(6, chkMitralStenosis.Value)
      End If
      
      psAnswers.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkMitralRegurgitation.Indeterminate Then
        psAnswers.Bind(7, Nil)
      Else
        psAnswers.Bind(7, chkMitralRegurgitation.Value)
      End If
      
      psAnswers.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkTricuspidStenosis.Indeterminate Then
        psAnswers.Bind(8, Nil)
      Else
        psAnswers.Bind(8, chkTricuspidStenosis.Value)
      End If
      
      psAnswers.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkTricuspidRegurgitation.Indeterminate Then
        psAnswers.Bind(9, Nil)
      Else
        psAnswers.Bind(9, chkTricuspidRegurgitation.Value)
      End If
      
      psAnswers.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkPericardialEffusion.Indeterminate Then
        psAnswers.Bind(10, Nil)
      Else
        psAnswers.Bind(10, chkPericardialEffusion.Value)
      End If
      
      psAnswers.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkIVCHighPressure.Indeterminate Then
        psAnswers.Bind(11, Nil)
      Else
        psAnswers.Bind(11, chkIVCHighPressure.Value)
      End If
      
      psAnswers.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psAnswers.Bind(12, txtCorrectConclusions.Text)
      
      psAnswers.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
      If chkRequiresFullEcho.Indeterminate Then
        psAnswers.Bind(13, Nil)
      Else
        psAnswers.Bind(13, chkRequiresFullEcho.Value)
      End If
      
      psAnswers.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psAnswers.Bind(14, CaseID)
      
      psAnswers.ExecuteSQL
      changesMade = True
    End If
    
    Session.DB.CommitTransaction
    
    If changesMade Then
      MessageBox("All changes saved successfully!")
      mCaseInfoChanged = False
      mAnswersChanged = False
      mGroupsChanged = False
      
      ' Update original groups
      Redim mOriginalGroups(-1)
      For i As Integer = 0 To lstAssignedGroups.RowCount - 1
        mOriginalGroups.Add(lstAssignedGroups.CellTextAt(i, 0))
      Next
    Else
      MessageBox("No changes to save")
    End If
    
  Catch e As DatabaseException
    Session.DB.RollbackTransaction
    MessageBox("Error saving changes: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnCancelChanges.Pressed Event
' ******************************************************************
Sub Pressed()
  LoadCaseDetails
  mCaseInfoChanged = False
  mAnswersChanged = False
  mGroupsChanged = False
End Sub

' ******************************************************************
' lstVideos.SelectionChanged Event
' ******************************************************************
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex < 0 Then
    htmlVideoPreview.LoadHTML("")
    Return
  End If
  
  Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
  
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

' ******************************************************************
' lstVideos.CellAction Event
' ******************************************************************
 // CHANGED
Sub CellAction(row As Integer, column As Integer, value As Variant)
  If column >= 1 And column <= 2 Then
    mOriginalCellValue = Me.CellTextAt(row, column)
    
    Var newValue As String = value.StringValue
    
    If newValue <> mOriginalCellValue Then
      Var videoID As Integer = Me.RowTagAt(row)
      
      mLastVideoID = videoID
      mLastColumn = column
      mLastOldValue = mOriginalCellValue
      mLastNewValue = newValue
      
      Me.CellTextAt(row, column) = newValue
      
      Var sql As String
      Select Case column
      Case 1
        sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
      Case 2
        sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
      Else
        Return
      End Select
      
      Try
        Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
        
        If column = 2 Then
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
    End If
  End If
End Sub

' ******************************************************************
' LoadVideoPreview method (Private)
'   Parameter: rowIndex - index of the selected row in lstVideos
'   Called from lstVideos.SelectionChanged event and LoadCaseVideos method
' ******************************************************************
Private Sub LoadVideoPreview(rowIndex As Integer)
  If rowIndex < 0 Then
    htmlVideoPreview.LoadHTML("")
    Return
  End If
  
  Var videoFilename As String = lstVideos.CellTextAt(rowIndex, 0)
  
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  
  If wf = Nil Then
    Var errorHTML As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
    errorHTML = errorHTML + "body{margin:0;padding:20px;background:transparent;color:#e74c3c;font-family:Arial,sans-serif;}"
    errorHTML = errorHTML + ".error{background:#2c2c2c;padding:20px;border-radius:8px;border-left:4px solid #e74c3c;}"
    errorHTML = errorHTML + "</style></head><body><div class='error'>"
    errorHTML = errorHTML + "<h3>⚠️ Video Not Found</h3>"
    errorHTML = errorHTML + "<p>The video file <strong>" + videoFilename + "</strong> could not be loaded.</p>"
    errorHTML = errorHTML + "</div></body></html>"
    
    htmlVideoPreview.LoadHTML(errorHTML)
    Return
  End If
  
  Var videoURL As String = wf.URL
  System.DebugLog("Loading video in preview: " + videoURL)
  
  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
  html = html + "body{margin:0;padding:10px;background:transparent;display:flex;flex-direction:column;justify-content:center;align-items:center;min-height:100%;font-family:Arial,sans-serif;}"
  html = html + ".video-container{width:100%;background:#000;border-radius:8px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.5);}"
  html = html + "video{width:100%;height:auto;display:block;background:#000;object-fit:contain;}"
  html = html + ".info{color:#666;font-size:12px;margin-top:10px;text-align:center;}"
  html = html + ".error{color:#e74c3c;background:#2c2c2c;padding:15px;border-radius:8px;margin-top:10px;}"
  html = html + ".debug{color:#3498db;font-size:11px;margin-top:5px;}"
  html = html + "</style></head><body>"
  html = html + "<div class='video-container'>"
  html = html + "<video id='videoPlayer' controls loop autoplay playsinline preload='metadata'>"
  html = html + "<source src='" + videoURL + "' type='video/mp4'>"
  html = html + "Your browser does not support the video tag.</video></div>"
  html = html + "<div class='info'>" + videoFilename + "</div>"
  html = html + "<div id='errorMsg' class='error' style='display:none;'></div>"
  html = html + "<div id='debugInfo' class='debug'></div>"
  html = html + "<script>"
  html = html + "var v=document.getElementById('videoPlayer');"
  html = html + "var err=document.getElementById('errorMsg');"
  html = html + "var dbg=document.getElementById('debugInfo');"
  html = html + "dbg.textContent='Video URL: " + videoURL + "';"
  html = html + "v.addEventListener('loadedmetadata',function(){"
  html = html + "  console.log('Video metadata loaded');"
  html = html + "  dbg.textContent+=' | Duration: '+v.duration.toFixed(1)+'s';"
  html = html + "});"
  html = html + "v.addEventListener('canplay',function(){"
  html = html + "  console.log('Video can play');"
  html = html + "  dbg.textContent+=' | Ready';"
  html = html + "  v.play().catch(function(e){console.log('Autoplay prevented:',e);});"
  html = html + "});"
  html = html + "v.addEventListener('error',function(e){"
  html = html + "  console.error('Video error:',e);"
  html = html + "  var errCode=v.error?v.error.code:'unknown';"
  html = html + "  var errMsg='Error loading video (code: '+errCode+')';"
  html = html + "  if(errCode==1)errMsg='Video loading aborted';"
  html = html + "  if(errCode==2)errMsg='Network error loading video';"
  html = html + "  if(errCode==3)errMsg='Video decoding failed - codec not supported';"
  html = html + "  if(errCode==4)errMsg='Video format not supported';"
  html = html + "  err.textContent=errMsg;"
  html = html + "  err.style.display='block';"
  html = html + "});"
  html = html + "v.addEventListener('ended',function(){this.currentTime=0;this.play();});"
  html = html + "</script></body></html>"
  
  htmlVideoPreview.LoadHTML(html)
End Sub

' ******************************************************************
' btnStartUpload.Pressed Event
' ******************************************************************
Sub Pressed()
  uplVideo.StartUpload
End Sub

' ******************************************************************
' uplVideo.FileAdded Event
' ******************************************************************
Sub FileAdded(filename As String, bytes As UInt64, mimeType As String)
  btnStartUpload.Enabled = True
  System.DebugLog("File selected: " + filename + " (" + Str(bytes) + " bytes)")
End Sub

' ******************************************************************
' uplVideo.FileRemoved Event
' ******************************************************************
Sub FileRemoved(filename As String)
  btnStartUpload.Enabled = False
  System.DebugLog("File removed: " + filename)
End Sub

' ******************************************************************
' uplVideo.UploadError Event
' ******************************************************************
Sub UploadError(error As RuntimeException)
  MessageBox("Upload error: " + error.Message)
  btnStartUpload.Enabled = True
End Sub

' ******************************************************************
' uplVideo.UploadFinished Event
' ******************************************************************
Sub UploadFinished(files() As WebUploadedFile)
  Var uploadedFile As WebUploadedFile = files(0)
  
  Try
    Var targetFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
    If Not targetFolder.Exists Then
      targetFolder.CreateFolder
      System.DebugLog("Created CaseVideos folder: " + targetFolder.NativePath)
    End If
    
    Var targetFile As FolderItem = targetFolder.Child(uploadedFile.Name)
    
    Var outputStream As BinaryStream = BinaryStream.Create(targetFile, True)
    outputStream.Write(uploadedFile.Data)
    outputStream.Close
    
    System.DebugLog("Video saved to: " + targetFile.NativePath)
    
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
    
    ' Insert into database (video_purpose can be empty or used for other purposes)
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_purpose, video_order) VALUES (?, ?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, CaseID)
    ps.Bind(1, uploadedFile.Name)
    ps.Bind(2, "")
    ps.Bind(3, "")  ' video_purpose left empty (reserved for future use)
    ps.Bind(4, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos
    
    uplVideo.RemoveAllFiles
    btnStartUpload.Enabled = False
    
  Catch e As IOException
    MessageBox("Error saving video file: " + e.Message)
  Catch e As DatabaseException
    MessageBox("Error saving video: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnDeleteVideo.Pressed Event
' ******************************************************************
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

' ******************************************************************
' HandleDeleteVideoConfirm Method
' ******************************************************************
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

' ******************************************************************
' btnUndoVideoEdit.Pressed Event
' ******************************************************************
Sub Pressed() // CHANGED
  If mLastVideoID = 0 Then
    MessageBox("No change to undo")
    Return
  End If
  
  Var sql As String
  Select Case mLastColumn
  Case 1
    sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
  Case 2
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End Select
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If mLastColumn = 2 Then
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
    
    LoadCaseVideos
    
    btnUndoVideoEdit.Enabled = False
    mLastVideoID = 0
    mLastColumn = 0
    mLastOldValue = ""
    mLastNewValue = ""
    
  Catch e As DatabaseException
    MessageBox("Error undoing change: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnBackToList.Pressed Event
' ******************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Complete Summary with Tag-Based Group Selection
' =============================================================================
' 
' TAG-BASED GROUP SELECTION:
' 
' 1. Available Groups PopupMenu:
'    - Pre-populated with common groups and existing groups from database
'    - Admin selects from dropdown
' 
' 2. Add Group Button:
'    - Adds selected group to "Currently Assigned" list
'    - Prevents duplicate assignments
'    - Tracks changes with mGroupsChanged flag
' 
' 3. Currently Assigned Groups ListBox:
'    - Shows all groups assigned to this case
'    - Single-column display for clarity
'    - Select and remove individual groups
' 
' 4. Remove Group Button:
'    - Removes selected group from list
'    - Tracks changes with mGroupsChanged flag
' 
' 5. Save Behavior:
'    - Groups saved as comma-separated string to cases.case_groups
'    - Example: "Cardiology 2025 Q1,ICU 2025 Q1,ED 2025 Q1"
'    - Students in ANY assigned group will see the case
' 
' VIDEO LISTBOX (3 COLUMNS):
' - Column 0: Filename (fills remaining space, read-only)
' - Column 1: View Description (150px, editable) - fits "parasternal LAX"
' - Column 2: Order (50px, editable) - 3 digits
' - Purpose column REMOVED - grouping is at case level now
' 
' WORKFLOW:
' 1. Admin opens case details
' 2. Selects group from PopupMenu
' 3. Clicks "Add Group" - appears in list below
' 4. Repeats for multiple groups
' 5. Can remove groups by selecting and clicking "Remove Selected"
' 6. Clicks "Save All Changes" - groups saved to database
' 7. Uploads videos - no per-video group assignment needed
' 8. Edits view description and order inline
' 
' DATABASE STRUCTURE:
' - cases.case_groups (TEXT) stores comma-separated group names
' - case_videos.video_purpose (TEXT) retained but not used in UI
' - Students see cases where their user_group matches any value in case_groups
' 
' =============================================================================