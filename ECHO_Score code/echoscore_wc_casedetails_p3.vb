-- =============================================================================
-- wc_CaseDetails WebContainer (PART 3 - Video Upload/Delete/Undo)
-- Continued from Part 2
-- =============================================================================

' lstVideos.CellTextChanged Event - Save and track for undo (WITH PURPOSE)
Sub CellTextChanged(row As Integer, column As Integer)
  Var videoID As Integer = Me.RowTagAt(row)
  Var newValue As String = Me.CellTextAt(row, column)
  
  ' Store for undo
  mLastVideoID = videoID
  mLastColumn = column
  mLastOldValue = mOriginalCellValue
  mLastNewValue = newValue
  
  Var sql As String
  Select Case column
  Case 1
    sql = "UPDATE case_videos SET view_description = ? WHERE video_id = ?"
  Case 2
    sql = "UPDATE case_videos SET video_purpose = ? WHERE video_id = ?"
  Case 3
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End Select
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If column = 3 Then
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
End Sub

' btnUploadVideo.Pressed Event
Sub Pressed()
  uplVideo.ShowDialog
End Sub

' uplVideo.FileReceived Event (WITH PURPOSE)
Sub FileReceived(file As FolderItem)
  Try
    Var targetFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
    If Not targetFolder.Exists Then
      targetFolder.CreateFolder
      System.DebugLog("Created CaseVideos folder: " + targetFolder.NativePath)
    End If
    
    Var targetFile As FolderItem = targetFolder.Child(file.Name)
    file.CopyTo(targetFile)
    System.DebugLog("Video copied to: " + targetFile.NativePath)
    
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
    
    Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_purpose, video_order) VALUES (?, ?, ?, ?, ?)"
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
    
    ps.Bind(0, CaseID)
    ps.Bind(1, file.Name)
    ps.Bind(2, "")  ' Empty, user can edit inline
    ps.Bind(3, "")  ' Empty, user can edit inline
    ps.Bind(4, videoOrder)
    
    ps.ExecuteSQL
    
    MessageBox("Video uploaded successfully!")
    LoadCaseVideos
    
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
      LoadCaseVideos
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
    sql = "UPDATE case_videos SET video_purpose = ? WHERE video_id = ?"
  Case 3
    sql = "UPDATE case_videos SET video_order = ? WHERE video_id = ?"
  Else
    Return
  End Select
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    
    If mLastColumn = 3 Then
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
    
    ' Reload videos to show the undone change
    LoadCaseVideos
    
    ' Disable undo button and clear tracking
    btnUndoVideoEdit.Enabled = False
    mLastVideoID = 0
    mLastColumn = 0
    mLastOldValue = ""
    mLastNewValue = ""
    
  Catch e As DatabaseException
    MessageBox("Error undoing change: " + e.Message)
  End Try
End Sub

' btnBackToList.Pressed Event
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' * 4-column video list: Filename, Description, Purpose, Order
' * Purpose supports comma-separated groups (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")
' * Inline editing for Description, Purpose, and Order columns
' * Undo functionality for video metadata changes
' * Video preview with auto-loop
' * Indeterminate checkbox state for NULL values
' * Save/Cancel buttons for correct answers
' =============================================================================