' =============================================================================
' wc_CaseList WebContainer (FIXED - with selection preservation)
' Case list view with filtering and search (Screen 1 of 2)
' =============================================================================

' Insert → WebContainer
' Name: wc_CaseList
' Super: wc_Base

' ******************************************************************
' Properties:
' ******************************************************************
Private mSelectedCaseID As Integer = 0

' ******************************************************************
' Controls:
' ******************************************************************
' Label: lblTitle (text: "Case Management", Bold, Large)
' Label: lblInstructions (text: "Double-click a case to view details and manage videos")

' FILTER SECTION:
' Label: lblFilterBy (text: "Filter by Group:")
' PopupMenu: popFilterGroup
' Label: lblSearch (text: "Search:")
' TextField: txtSearch
' PushButton: btnClearFilters (text: "Clear Filters")

' ListBox: lstCases (4 columns: Serial Number, Description, Groups, Videos)
'   - Set SelectionType to Single (NOT None)
' PushButton: btnNewCase (text: "New Case")
' PushButton: btnDeleteCase (text: "Delete Case")
' PushButton: btnBack (text: "Back to Admin")

' ******************************************************************
' wc_CaseList.Opening Event
' ******************************************************************
Sub Opening()
  LoadGroupFilter
  LoadCases
End Sub

' ******************************************************************
' LoadGroupFilter Method
' ******************************************************************
Sub LoadGroupFilter()
  popFilterGroup.RemoveAllRows
  popFilterGroup.AddRow("All Groups")
  popFilterGroup.SelectedRowIndex = 0
  
  ' Load unique groups from video_purpose field
  Var sql As String = "SELECT DISTINCT video_purpose FROM case_videos WHERE video_purpose IS NOT NULL AND video_purpose <> '' ORDER BY video_purpose"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    Var uniqueGroups() As String
    
    While Not rs.AfterLastRow
      Var purposeText As String = rs.Column("video_purpose").StringValue
      
      ' Split comma-separated groups
      If purposeText.Trim <> "" Then
        Var groups() As String = purposeText.Split(",")
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
    
    ' Sort and add to popup
    uniqueGroups.Sort
    For Each group As String In uniqueGroups
      popFilterGroup.AddRow(group)
    Next
    
  Catch e As DatabaseException
    System.DebugLog("Error loading groups: " + e.Message)
  End Try
End Sub

' ******************************************************************
' LoadCases Method (WITH FILTERING, SEARCH, AND SELECTION PRESERVATION)
' ******************************************************************
Sub LoadCases()
  ' Store currently selected case ID (if any)
  Var selectedCaseID As Integer = mSelectedCaseID
  
  lstCases.RemoveAllRows
  
  Var selectedGroup As String = ""
  If popFilterGroup.SelectedRowIndex > 0 Then
    selectedGroup = popFilterGroup.RowTagAt(popFilterGroup.SelectedRowIndex)
    If selectedGroup = "" Then
      selectedGroup = popFilterGroup.RowTextAt(popFilterGroup.SelectedRowIndex)
    End If
  End If
  
  Var searchTerm As String = txtSearch.Text.Trim
  
  ' Build SQL with filtering
  Var sql As String = _
  "SELECT c.case_id, c.serial_number, c.case_label, " + _
  "GROUP_CONCAT(DISTINCT cv.video_purpose ORDER BY cv.video_purpose SEPARATOR ', ') AS all_groups, " + _
  "COUNT(cv.video_id) AS video_count " + _
  "FROM cases c " + _
  "LEFT JOIN case_videos cv ON c.case_id = cv.case_id "
  
  Var whereConditions() As String
  
  ' Add group filter
  If selectedGroup <> "" Then
    whereConditions.Add("(cv.video_purpose LIKE ? OR FIND_IN_SET(?, REPLACE(cv.video_purpose, ' ', '')) > 0)")
  End If
  
  ' Add search filter
  If searchTerm <> "" Then
    whereConditions.Add("(c.serial_number LIKE ? OR c.case_label LIKE ?)")
  End If
  
  ' Combine WHERE conditions
  If whereConditions.Count > 0 Then
    sql = sql + "WHERE " + String.FromArray(whereConditions, " AND ")
  End If
  
  sql = sql + " GROUP BY c.case_id, c.serial_number, c.case_label ORDER BY c.serial_number"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    Var paramIndex As Integer = 0
    
    ' Bind group filter parameters
    If selectedGroup <> "" Then
      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(paramIndex, "%" + selectedGroup + "%")
      paramIndex = paramIndex + 1
      
      Var cleanGroup As String = selectedGroup.ReplaceAll(" ", "")
      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(paramIndex, cleanGroup)
      paramIndex = paramIndex + 1
    End If
    
    ' Bind search parameters
    If searchTerm <> "" Then
      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(paramIndex, "%" + searchTerm + "%")
      paramIndex = paramIndex + 1
      ps.BindType(paramIndex, MySQLPreparedStatement.MYSQL_TYPE_STRING)
      ps.Bind(paramIndex, "%" + searchTerm + "%")
      paramIndex = paramIndex + 1
    End If
    
    Var rs As RowSet = ps.SelectSQL
    
    While Not rs.AfterLastRow
      lstCases.AddRow(rs.Column("serial_number").StringValue)
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
      
      ' Display groups (or "No groups" if empty)
      Var groupsText As String = rs.Column("all_groups").StringValue
      If groupsText.Trim = "" Then
        groupsText = "(No groups)"
      End If
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 2) = groupsText
      
      ' Display video count
      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 3) = Str(rs.Column("video_count").IntegerValue)
      
      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
      
      rs.MoveToNextRow
    Wend
    
    ' Restore selection after reload
    If selectedCaseID > 0 Then
      For i As Integer = 0 To lstCases.RowCount - 1
        If lstCases.RowTagAt(i) = selectedCaseID Then
          lstCases.SelectedRowIndex = i
          Exit For i
        End If
      Next
    End If
    
  Catch e As DatabaseException
    MessageBox("Error loading cases: " + e.Message)
  End Try
End Sub

' ******************************************************************
' lstCases.SelectionChanged Event
' ******************************************************************
Sub SelectionChanged(rows() As Integer)
  #Pragma Unused rows
  
  If Me.SelectedRowIndex >= 0 Then
    mSelectedCaseID = Me.RowTagAt(Me.SelectedRowIndex)
  Else
    mSelectedCaseID = 0
  End If
End Sub

' popFilterGroup.SelectionChanged Event
Sub SelectionChanged(newRowIndex As Integer)
  #Pragma Unused newRowIndex
  LoadCases
End Sub

' ******************************************************************
' txtSearch.TextChanged Event
' ******************************************************************
Sub TextChanged()
  ' Optional: Add slight delay to avoid excessive queries while typing
  LoadCases
End Sub

' ******************************************************************
' btnClearFilters.Pressed Event
' ******************************************************************
Sub Pressed()
  popFilterGroup.SelectedRowIndex = 0
  txtSearch.Text = ""
  LoadCases
End Sub

' ******************************************************************
' lstCases.DoublePressed Event
' ******************************************************************
Sub DoublePressed()
  If mSelectedCaseID = 0 Then Return
  
  Var caseDetails As New wc_CaseDetails
  caseDetails.ContainerID = "CaseDetails"
  caseDetails.Position = wc_Base.PositionEnum.TopLeft
  caseDetails.CaseID = mSelectedCaseID
  Session.Navigation.NavigateTo(caseDetails)
End Sub

' ******************************************************************
' btnNewCase.Pressed Event
' ******************************************************************
Sub Pressed()
  Var dlg As New dlg_AddCase
  AddHandler dlg.Dismissed, AddressOf HandleAddCaseDialogClosed
  dlg.Show
End Sub

' ******************************************************************
' HandleAddCaseDialogClosed Method
' ******************************************************************
Private Sub HandleAddCaseDialogClosed(sender As dlg_AddCase)
  #Pragma Unused sender
  ' Reload cases and groups after dialog closes
  LoadGroupFilter
  LoadCases
End Sub

' ******************************************************************
' btnDeleteCase.Pressed Event
' ******************************************************************
Sub Pressed()
  If mSelectedCaseID = 0 Then
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

' ******************************************************************
' HandleDeleteCaseConfirm Method
' ******************************************************************
Private Sub HandleDeleteCaseConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
  Select Case button
  Case dialog.ActionButton
    Var caseID As Integer = mSelectedCaseID
    Var sql As String = "DELETE FROM cases WHERE case_id = ?"
    
    Try
      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
      ps.Bind(0, caseID)
      
      ps.ExecuteSQL
      
      MessageBox("Case deleted successfully!")
      mSelectedCaseID = 0  ' Clear stored ID
      LoadGroupFilter  ' Refresh group list in case groups were removed
      LoadCases
      
    Catch e As DatabaseException
      MessageBox("Error deleting case: " + e.Message)
    End Try
  End Select
End Sub

' ******************************************************************
' btnBack.Pressed Event
' ******************************************************************
Sub Pressed()
  Session.Navigation.NavigateBack
End Sub

' =============================================================================
' Notes:
' =============================================================================
' 
' FIXES APPLIED:
' 
' 1. Selection Preservation:
'    - Added mSelectedCaseID property to store selected case ID
'    - SelectionChanged event updates mSelectedCaseID
'    - LoadCases preserves and restores selection after reload
'    - DoublePressed and btnDeleteCase use stored ID instead of SelectedRowIndex
' 
' 2. Dialog Handling:
'    - Uses dlg.Dismissed event (not Closed) for WebDialog
'    - AddHandler works correctly with no IDE conflicts
' 
' 3. ListBox Configuration:
'    - IMPORTANT: Set lstCases.SelectionType = Single in IDE
'    - Do NOT set it to None or selection won't work
' 
' ENHANCED FEATURES:
' 
' 1. Four-Column ListBox:
'    - Serial Number (e.g., "Case 1")
'    - Description (e.g., "Dilated Cardiomyopathy")
'    - Groups (e.g., "Cardiology 2025 Q1, ICU 2025 Q1")
'    - Videos (e.g., "5")
' 
' 2. Group Filter:
'    - PopupMenu populated with all unique groups from video_purpose
'    - Automatically extracts groups from comma-separated values
'    - "All Groups" option to show everything
'    - Updates case list when selection changes
' 
' 3. Search Filter:
'    - TextField searches both serial number and description
'    - Real-time filtering as user types
'    - Case-insensitive search using LIKE
' 
' 4. Clear Filters Button:
'    - Resets popup to "All Groups"
'    - Clears search text
'    - Reloads full case list
' 
' SQL FEATURES:
' - Uses GROUP_CONCAT to collect all unique groups per case
' - COUNT to get video count per case
' - Combines multiple WHERE conditions dynamically
' - Handles comma-separated groups in video_purpose
' 
' =============================================================================