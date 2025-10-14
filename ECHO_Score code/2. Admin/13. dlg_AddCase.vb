' =============================================================================
' dlg_AddCase WebDialog
' Dialog for creating new cases with auto-incrementing case numbers and group assignment
' =============================================================================

' Insert → WebDialog
' Name: dlg_AddCase

' ******************************************************************
' Controls:
' ******************************************************************
' Label: lblTitle (text: "Add New Case", Bold)
' Label: lblSerialNumber (text: "Case Number:")
' TextField: txtSerialNumber (ReadOnly = True)
' Label: lblDescription (text: "Case Description:")
' TextField: txtDescription
' Label: lblGroup (text: "Assign to Group:")
' ComboBox: cmbGroup (editable)
' PushButton: btnOK (text: "Create Case", Default = True)
' PushButton: btnCancel (text: "Cancel", Cancel = True)

' ******************************************************************
' dlg_AddCase.Opening Event
' ******************************************************************
Sub Opening()
  ' Get next case number using NUMERICAL sorting
  Var sql As String = "SELECT serial_number FROM cases ORDER BY CAST(SUBSTRING(serial_number, 6) AS UNSIGNED) DESC LIMIT 1"
  
  Try
    Var rs As RowSet = Session.DB.SelectSQL(sql)
    
    If rs <> Nil And Not rs.AfterLastRow Then
      Var lastSerial As String = rs.Column("serial_number").StringValue
      ' Extract number from "Case X"
      Var parts() As String = lastSerial.Split(" ")
      If parts.Count >= 2 Then
        Var lastNum As Integer = Val(parts(1))
        txtSerialNumber.Text = "Case " + Str(lastNum + 1)
      Else
        txtSerialNumber.Text = "Case 1"
      End If
    Else
      txtSerialNumber.Text = "Case 1"
    End If
  Catch e As DatabaseException
    txtSerialNumber.Text = "Case 1"
  End Try
  
  ' Load available groups
  LoadGroups
  
  txtDescription.SetFocus
End Sub

' ******************************************************************
' LoadGroups Method
' ******************************************************************
Sub LoadGroups()
  cmbGroup.RemoveAllRows
  cmbGroup.AddRow("(No group)")
  
  ' Add common groups
  Var currentYear As Integer = DateTime.Now.Year
  Var quarters() As String = Array("Q1", "Q2", "Q3", "Q4")
  Var specialties() As String = Array("Cardiology", "ICU", "ED", "Medicine", "Surgery")
  
  For Each specialty As String In specialties
    For Each quarter As String In quarters
      cmbGroup.AddRow(specialty + " " + Str(currentYear) + " " + quarter)
    Next
  Next
  
  ' Also load existing groups from database
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
    
    ' Add unique groups to combobox
    For Each group As String In uniqueGroups
      ' Check if already in combobox
      Var alreadyExists As Boolean = False
      For i As Integer = 0 To cmbGroup.RowCount - 1
        If cmbGroup.RowTextAt(i) = group Then
          alreadyExists = True
          Exit For i
        End If
      Next
      
      If Not alreadyExists Then
        cmbGroup.AddRow(group)
      End If
    Next
    
  Catch e As DatabaseException
    System.DebugLog("Error loading groups: " + e.Message)
  End Try
  
  cmbGroup.SelectedRowIndex = 0
End Sub

' ******************************************************************
' btnOK.Pressed Event
' ******************************************************************
Sub Pressed()
  If txtDescription.Text.Trim = "" Then
    MessageBox("Please enter a case description")
    Return
  End If
  
  ' Get selected group (if any)
  Var selectedGroup As String = ""
  If cmbGroup.SelectedRowIndex > 0 Then  ' Skip "(No group)"
    selectedGroup = cmbGroup.Text.Trim
  End If
  
  ' Create the case with all checkboxes set to NULL (indeterminate)
  Var sql As String = "INSERT INTO cases (serial_number, case_label) VALUES (?, ?)"
  
  Try
    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
    ps.Bind(0, txtSerialNumber.Text.Trim)
    ps.Bind(1, txtDescription.Text.Trim)
    ps.ExecuteSQL
    
    ' Store the selected group in the session for use when uploading videos
    ' This will be used as the default group in wc_CaseDetails
    If selectedGroup <> "" Then
      Session.LastCreatedCaseGroup = selectedGroup
    Else
      Session.LastCreatedCaseGroup = ""
    End If
    
    MessageBox("Case created successfully!" + If(selectedGroup <> "", EndOfLine + "Default group: " + selectedGroup, ""))
    Self.Close
  Catch e As DatabaseException
    MessageBox("Error creating case: " + e.Message)
  End Try
End Sub

' ******************************************************************
' btnCancel.Pressed Event
' ******************************************************************
Sub Pressed()
  Self.Close
End Sub

' =============================================================================
' Notes:
' =============================================================================
' 
' FEATURES:
' 
' 1. Auto-Incrementing Case Numbers:
'    - Uses NUMERICAL sorting to get the highest case number
'    - Prevents "Case 1, Case 10, Case 2" ordering
'    - Correctly generates: Case 1, Case 2... Case 9, Case 10, Case 11
' 
' 2. Group Assignment:
'    - ComboBox pre-populated with common groups (Cardiology, ICU, ED, etc.)
'    - Loads existing groups from database (extracted from video_purpose)
'    - Editable - admin can type custom group names
'    - "(No group)" option for cases without group assignment
' 
' 3. Session Storage:
'    - Selected group stored in Session.LastCreatedCaseGroup
'    - Used as default in wc_CaseDetails when uploading videos
'    - Saves time by avoiding re-typing group for every video
' 
' 4. User Experience:
'    - Serial number is read-only (auto-generated)
'    - Focus automatically set to description field
'    - Confirmation message shows assigned group
' 
' WORKFLOW:
' 1. Admin clicks "New Case" in wc_CaseList
' 2. Dialog opens with next case number auto-filled
' 3. Admin enters description
' 4. Admin selects group (or leaves as "No group")
' 5. Case created with NULL correct answers
' 6. Group stored for use when uploading videos
' 
' SQL SORTING FIX:
' ORDER BY CAST(SUBSTRING(serial_number, 6) AS UNSIGNED)
' - Extracts number after "Case "
' - Converts to integer for proper numerical sorting
' - Works correctly up to thousands of cases
' 
' =============================================================================