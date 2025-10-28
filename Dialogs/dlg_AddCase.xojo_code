#tag WebPage
Begin WebDialog dlg_AddCase
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   355
   Index           =   -2147483648
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   PanelIndex      =   0
   Position        =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   454
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Add New Case"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   414
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblSerialNumber
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Case Number:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   82
      Underline       =   False
      Visible         =   True
      Width           =   135
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtSerialNumber
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   163
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   True
      Scope           =   2
      TabIndex        =   2
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   82
      Visible         =   True
      Width           =   271
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblDescription
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Case Description:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   156
      Underline       =   False
      Visible         =   True
      Width           =   135
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtDescription
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   163
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   4
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   156
      Visible         =   True
      Width           =   271
      _mPanelIndex    =   -1
   End
   Begin WebButton btnOK
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "OK"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   334
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   297
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnCancel
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Cancel"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   226
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   297
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblGroup
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Text            =   "Grouping:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   230
      Underline       =   False
      Visible         =   True
      Width           =   135
      _mPanelIndex    =   -1
   End
   Begin WebCombobox cmbGroup
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FilteringMode   =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   163
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   -1
      SelectedRowText =   ""
      TabIndex        =   9
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   230
      Visible         =   True
      Width           =   271
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' ******************************************************************
		  ' dlg_AddCase.Opening Event
		  ' ******************************************************************
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
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub LoadGroups()
		  ' ******************************************************************
		  ' LoadGroups Method
		  ' ******************************************************************
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
	#tag EndMethod


#tag EndWindowCode

#tag Events btnOK
	#tag Event
		Sub Pressed()
		  ' ******************************************************************
		  ' btnOK.Pressed Event
		  ' ******************************************************************
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
	#tag EndEvent
#tag EndEvents
#tag Events btnCancel
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Position"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="WebDialog.Positions"
		EditorType="Enum"
		#tag EnumValues
			"0 - Top"
			"1 - Center"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
