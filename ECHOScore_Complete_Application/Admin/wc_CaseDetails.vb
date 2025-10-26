' =============================================================================
' wc_CaseDetails WebContainer - Complete Updated Version
' Case editor with video management, NULL checkbox support, and tag-based groups
' This is the COMPLETE version with all fixes from multiple conversations
' =============================================================================

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
Private mCaseInfoChanged As Boolean = False
Private mAnswersChanged As Boolean = False
Private mGroupsChanged As Boolean = False
Private mOriginalGroups() As String

' CASE INFO SECTION:
' Label: lblCaseInfo (text: "Case Information", Bold)
' Label: lblSerial (text: "Serial Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblLabel (text: "Description:")
' TextField: txtCaseLabel

' GROUP ASSIGNMENT SECTION:
' Label: lblGroups (text: "Assigned Groups", Bold)
' Label: lblAvailableGroups (text: "Available Groups:")
' PopupMenu: popAvailableGroups
' PushButton: btnAddGroup (text: "Add Group →")
' Label: lblAssignedGroups (text: "Currently Assigned:")
' ListBox: lstAssignedGroups (1 column)
' PushButton: btnRemoveGroup (text: "← Remove Selected")

' CORRECT ANSWERS SECTION:
' Label: lblCorrectAnswers (text: "Correct Answers", Bold)
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
' Label: lblCorrectConclusions (text: "Correct Conclusions:")
' TextArea: txtCorrectConclusions
' CheckBox: chkRequiresFullEcho (text: "Requires Full ECHO?", AllowIndeterminate = True)

' SAVE/CANCEL SECTION:
' PushButton: btnSaveAll (text: "Save All Changes", Primary style)
' PushButton: btnCancelChanges (text: "Cancel Changes")

' VIDEOS SECTION:
' Label: lblVideos (text: "Case Videos", Bold)
' Label: lblVideoInstructions (text: "Click 'Choose File' to select video, then click 'Upload'. Double-click cells to edit.")
' ListBox: lstVideos (3 columns: Filename, View Description, Order)
' WebFileUploader: uplVideo (AllowMultipleFiles = False, Filter = "video/mp4,video/*")
' PushButton: btnStartUpload (text: "Upload Selected Video")
' PushButton: btnDeleteVideo (text: "Delete Video")
' PushButton: btnUndoVideoEdit (text: "Undo Last Change", Enabled = False)

' VIDEO PREVIEW SECTION:
' Label: lblVideoPreview (text: "Video Preview", Bold)
' HTMLViewer: htmlVideoPreview

' wc_CaseDetails.Opening Event
Sub Opening()
  ContainerID = "CaseDetails"
  
  ' Configure editable columns in video listbox
  lstVideos.ColumnTypeAt(1) = WebListBox.CellTypes.TextField
  lstVideos.ColumnTypeAt(2) = WebListBox.CellTypes.TextField
  
  ' Load data
  LoadAvailableGroups()
  LoadCaseDetails()
  LoadCaseVideos()
  
  ' Reset change flags
  mCaseInfoChanged = False
  mAnswersChanged = False
  mGroupsChanged = False
  
  btnUndoVideoEdit.Enabled = False
  btnStartUpload.Enabled = False
  
  ' Add change tracking handlers (set in IDE)
  ' txtCaseLabel.TextChanged → TrackCaseInfoChange()
  ' All checkboxes.ValueChanged → TrackAnswerChange()
  ' txtCorrectConclusions.TextChanged → TrackAnswerChange()
End Sub

' LoadAvailableGroups Method
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
  
  ' Load existing groups from database
  Var sql As String = "SELECT DISTINCT user_group FROM users WHERE user_group IS NOT NULL AND user_group <> '' UNION SELECT DISTINCT case_groups FROM cases WHERE case_groups IS NOT NULL AND case_groups <> '' ORDER BY 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    Var uniqueGroups() As String
    
    While rs <> Nil And Not rs.AfterLastRow
      Var groupText As String = rs.Column(0).StringValue
      
      ' Split comma-separated groups
      If groupText.Trim <> "" Then
        Var groups() As String = groupText.Split(",")
        For Each group As String In groups
          Var cleanGroup As String = group.Trim
          If cleanGroup <> "" Then
            ' Check if already in list
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
      
      ' Load text area
      txtCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
      
      ' Load requires_full_echo checkbox (13th checkbox)
      If rs.Column("requires_full_echo").Value = Nil Then
        chkRequiresFullEcho.Indeterminate = True
      Else
        chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
        chkRequiresFullEcho.Indeterminate = False
      End If
    End If
  Catch e As DatabaseException
    MessageBox("Error loading case: " + e.Message)
  End Try
End Sub

' LoadAssignedGroups Method
Sub LoadAssignedGroups(groupString As String)
  lstAssignedGroups.RemoveAllRows
  mOriginalGroups.RemoveAll
  
  If groupString.Trim <> "" Then
    Var groups() As String = groupString.Split(",")
    For Each group As String In groups
      Var cleanGroup As String = group.Trim
      If cleanGroup <> "" Then
        lstAssignedGroups.AddRow(cleanGroup)
        mOriginalGroups.Add(cleanGroup)
      End If
    Next
  End If
End Sub

' GetCurrentGroups Method
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

' btnRemoveGroup.Pressed Event
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


' =============================================================================
' wc_CaseDetails WebContainer - PART 2
' Save methods, video management, and supporting functions
' CRITICAL: Uses MYSQL_TYPE_NULL when binding Nil for indeterminate checkboxes
' =============================================================================

' TrackCaseInfoChange Method
Sub TrackCaseInfoChange()
  mCaseInfoChanged = True
End Sub

' TrackAnswerChange Method
Sub TrackAnswerChange()
  mAnswersChanged = True
End Sub

' NOTE: In the IDE, add these event handlers:
' - txtCaseLabel.TextChanged → call TrackCaseInfoChange()
' - All checkboxes ValueChanged → call TrackAnswerChange()
' - txtCorrectConclusions.TextChanged → call TrackAnswerChange()

' btnSaveAll.Pressed Event (FIXED WITH MYSQL_TYPE_NULL)
Sub Pressed()
  ' Check if anything has changed
  If Not mCaseInfoChanged And Not mAnswersChanged And Not mGroupsChanged Then
    MessageBox("No changes to save.")
    Return
  End If
  
  ' Validate case label
  If txtCaseLabel.Text.Trim = "" Then
    MessageBox("Case description cannot be empty")
    Return
  End If
  
  Try
    Session.DB.BeginTransaction
    Var changesMade As Boolean = False
    
    ' Save case info (description) and groups if changed
    If mCaseInfoChanged Or mGroupsChanged Then
      Var sqlCase As String = "UPDATE cases SET case_label = ?, case_groups = ? WHERE case_id = ?"
      Var psCase As MySQLPreparedStatement = Session.DB.Prepare(sqlCase)
      psCase.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psCase.Bind(0, txtCaseLabel.Text.Trim)
      psCase.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psCase.Bind(1, GetCurrentGroups())
      psCase.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psCase.Bind(2, CaseID)
      psCase.ExecuteSQL
      changesMade = True
      mCaseInfoChanged = False
      mGroupsChanged = False
    End If
    
    ' Save correct answers if changed (FIXED: uses MYSQL_TYPE_NULL)
    If mAnswersChanged Then
      Var sqlAnswers As String = "UPDATE cases SET "
      sqlAnswers = sqlAnswers + "lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, "
      sqlAnswers = sqlAnswers + "aortic_stenosis_significant=?, aortic_regurgitation_significant=?, "
      sqlAnswers = sqlAnswers + "mitral_stenosis_significant=?, mitral_regurgitation_significant=?, "
      sqlAnswers = sqlAnswers + "tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, "
      sqlAnswers = sqlAnswers + "pericardial_effusion_significant=?, ivc_high_ra_pressure=?, "
      sqlAnswers = sqlAnswers + "correct_conclusions=?, requires_full_echo=? "
      sqlAnswers = sqlAnswers + "WHERE case_id=?"
      
      Var psAnswers As MySQLPreparedStatement = Session.DB.Prepare(sqlAnswers)
      
      ' Bind all 12 finding checkboxes with NULL support (FIXED)
      If chkLVSizeDilated.Indeterminate Then
        psAnswers.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(0, Nil)
      Else
        psAnswers.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(0, chkLVSizeDilated.Value)
      End If
      
      If chkLVFunctionImpaired.Indeterminate Then
        psAnswers.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(1, Nil)
      Else
        psAnswers.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(1, chkLVFunctionImpaired.Value)
      End If
      
      If chkRVSizeDilated.Indeterminate Then
        psAnswers.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(2, Nil)
      Else
        psAnswers.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(2, chkRVSizeDilated.Value)
      End If
      
      If chkRVFunctionImpaired.Indeterminate Then
        psAnswers.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(3, Nil)
      Else
        psAnswers.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(3, chkRVFunctionImpaired.Value)
      End If
      
      If chkAorticStenosis.Indeterminate Then
        psAnswers.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(4, Nil)
      Else
        psAnswers.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(4, chkAorticStenosis.Value)
      End If
      
      If chkAorticRegurgitation.Indeterminate Then
        psAnswers.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(5, Nil)
      Else
        psAnswers.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(5, chkAorticRegurgitation.Value)
      End If
      
      If chkMitralStenosis.Indeterminate Then
        psAnswers.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(6, Nil)
      Else
        psAnswers.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(6, chkMitralStenosis.Value)
      End If
      
      If chkMitralRegurgitation.Indeterminate Then
        psAnswers.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(7, Nil)
      Else
        psAnswers.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(7, chkMitralRegurgitation.Value)
      End If
      
      If chkTricuspidStenosis.Indeterminate Then
        psAnswers.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(8, Nil)
      Else
        psAnswers.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(8, chkTricuspidStenosis.Value)
      End If
      
      If chkTricuspidRegurgitation.Indeterminate Then
        psAnswers.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(9, Nil)
      Else
        psAnswers.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(9, chkTricuspidRegurgitation.Value)
      End If
      
      If chkPericardialEffusion.Indeterminate Then
        psAnswers.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(10, Nil)
      Else
        psAnswers.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(10, chkPericardialEffusion.Value)
      End If
      
      If chkIVCHighPressure.Indeterminate Then
        psAnswers.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(11, Nil)
      Else
        psAnswers.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(11, chkIVCHighPressure.Value)
      End If
      
      ' Bind correct conclusions text
      psAnswers.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      psAnswers.Bind(12, txtCorrectConclusions.Text)
      
      ' Bind requires_full_echo checkbox (13th checkbox)
      If chkRequiresFullEcho.Indeterminate Then
        psAnswers.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_NULL)
        psAnswers.Bind(13, Nil)
      Else
        psAnswers.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
        psAnswers.Bind(13, chkRequiresFullEcho.Value)
      End If
      
      ' Bind WHERE clause case_id
      psAnswers.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      psAnswers.Bind(14, CaseID)
      
      psAnswers.ExecuteSQL
      changesMade = True
      mAnswersChanged = False
    End If
    
    Session.DB.CommitTransaction
    
    If changesMade Then
      MessageBox("All changes saved successfully!")
      
      ' Update original groups tracking
      mOriginalGroups.RemoveAll
      For i As Integer = 0 To lstAssignedGroups.RowCount - 1
        mOriginalGroups.Add(lstAssignedGroups.CellTextAt(i, 0))
      Next
    End If
    
  Catch e As DatabaseException
    Session.DB.RollbackTransaction
    MessageBox("Error saving changes: " + e.Message)
  End Try
End Sub

' btnCancelChanges.Pressed Event
Sub Pressed()
  ' Reload from database
  LoadCaseDetails()
  LoadCaseVideos()
  
  ' Reset change flags
  mCaseInfoChanged = False
  mAnswersChanged = False
  mGroupsChanged = False
  
  MessageBox("Changes cancelled")
End Sub

' LoadCaseVideos Method
Sub LoadCaseVideos()
  lstVideos.RemoveAllRows
  
  Var sql As String = "SELECT video_id, video_filename, view_description, video_order FROM case_videos WHERE case_id = ? ORDER BY video_order"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(0, CaseID)
    
    Var rs As RowSet = ps.SelectSQL
    
    While rs <> Nil And Not rs.AfterLastRow
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

' lstVideos.SelectionChanged Event
Sub SelectionChanged()
  If Me.SelectedRowIndex >= 0 Then
    Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
    LoadVideoPreview(videoFilename)
  Else
    htmlVideoPreview.LoadHTML("")
  End If
End Sub

' lstVideos.CellTextChanged Event (inline editing)
Sub CellTextChanged(row As Integer, column As Integer, newValue As String)
  If row < 0 Or column < 1 Then Return
  
  Var videoID As Integer = Me.RowTagAt(row)
  Var oldValue As String = mOriginalCellValue
  
  ' Save undo info
  mLastVideoID = videoID
  mLastColumn = column
  mLastOldValue = oldValue
  mLastNewValue = newValue
  btnUndoVideoEdit.Enabled = True
  
  ' Save to database immediately
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
      ps.Bind(0, Val(newValue))
    Else
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(0, newValue)
    End If
    
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.Bind(1, videoID)
    
    ps.ExecuteSQL
    
    System.DebugLog("Video metadata updated: video_id=" + Str(videoID) + ", column=" + Str(column))
    
  Catch e As DatabaseException
    MessageBox("Error saving change: " + e.Message)
  End Try
End Sub

' lstVideos.CellEditingStarted Event
Sub CellEditingStarted(row As Integer, column As Integer)
  If row >= 0 And column >= 1 Then
    mOriginalCellValue = Me.CellTextAt(row, column)
  End If
End Sub

' LoadVideoPreview Method
Sub LoadVideoPreview(videoFilename As String)
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  
  If wf = Nil Then
    htmlVideoPreview.LoadHTML("<html><body style='background:transparent;color:#999;text-align:center;padding:50px;'>Video not found</body></html>")
    Return
  End If
  
  Var videoURL As String = wf.URL
  
  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
  html = html + "body{margin:0;padding:0;background:transparent;overflow:hidden;}"
  html = html + "video{width:100%;height:100vh;object-fit:contain;display:block;}"
  html = html + "</style></head><body>"
  html = html + "<video controls loop autoplay playsinline>"
  html = html + "<source src='" + videoURL + "' type='video/mp4'>"
  html = html + "Your browser does not support video.</video>"
  html = html + "</body></html>"
  
  htmlVideoPreview.LoadHTML(html)
End Sub

' uplVideo.FileAdded Event
Sub FileAdded(file As WebUploadedFile)
  btnStartUpload.Enabled = True
End Sub

' btnStartUpload.Pressed Event
Sub Pressed()
  uplVideo.StartUpload
End Sub

' uplVideo.UploadFinished Event
Sub UploadFinished(file As WebUploadedFile)
  ' Save file to disk
  Try
    Var videoFile As FolderItem = Session.CurrentVideoFolder.Child(file.Name)
    videoFile.Write(file.Data)
    
    ' Get next video order
    Var orderSQL As String = "SELECT COALESCE(MAX(video_order), -1) + 1 AS next_order FROM case_videos WHERE case_id = ?"
    Var psOrder As MySQLPreparedStatement = Session.DB.Prepare(orderSQL)
    psOrder.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    psOrder.Bind(0, CaseID)
    Var orderRS As RowSet = psOrder.SelectSQL
    Var videoOrder As Integer = 0
    If orderRS <> Nil And Not orderRS.AfterLastRow Then
      videoOrder = orderRS.Column("next_order").IntegerValue
    End If
    
    ' Insert into database
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_order) VALUES (?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, CaseID)
    ps.Bind(1, file.Name)
    ps.Bind(2, "")
    ps.Bind(3, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos()
    btnStartUpload.Enabled = False
    
  Catch e As IOException
    MessageBox("Error copying video file: " + e.Message)
  Catch e As DatabaseException
    MessageBox("Error saving video: " + e.Message)
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
      LoadCaseVideos()
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
    
    LoadCaseVideos()
    
    btnUndoVideoEdit.Enabled = False
    mLastVideoID = 0
    mLastColumn = 0
    mLastOldValue = ""
    mLastNewValue = ""
    
  Catch e As DatabaseException
    MessageBox("Error undoing change: " + e.Message)
  End Try
End Sub

' =============================================================================
' wc_CaseDetails Complete Summary
' =============================================================================
' 
' CRITICAL FIXES:
' 1. Uses MYSQL_TYPE_NULL when binding Nil for indeterminate checkboxes
' 2. Uses MYSQL_TYPE_TINY when binding actual boolean values
' 3. Tag-based group management with GetCurrentGroups()
' 4. Saves case_label, case_groups, and all 13 checkboxes
' 
' =============================================================================
