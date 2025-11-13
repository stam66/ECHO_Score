#tag WebPage
Begin WebDialog dlg_ManageMCQOptions
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   600
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
   Width           =   800
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   18.0
      Height          =   30
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
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Manage answer options"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   10
      Underline       =   False
      Visible         =   True
      Width           =   760
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstOptions
      AllowRowReordering=   False
      ColumnCount     =   3
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   300
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Letter	Option Text	Correct"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   50
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblEditTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   16.0
      Height          =   30
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
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Option Editor"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   370
      Underline       =   False
      Visible         =   True
      Width           =   400
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblOptionText
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
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
      Text            =   "Option Text:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   397
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebTextArea txtOptionText
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   60
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   422
      Visible         =   True
      Width           =   760
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkIsCorrect
      Caption         =   "This is a correct answer"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   28
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   580
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   387
      Value           =   False
      Visible         =   True
      Width           =   213
      _mPanelIndex    =   -1
   End
   Begin WebButton btnSave
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   542
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDelete
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   572
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   542
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveUp
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "↑"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   748
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   102
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveDown
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "↓"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   748
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   148
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnClose
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Close"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   680
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   542
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ClearEditor()
		  ' Clear the editor fields
		  txtOptionText.Text = ""
		  chkIsCorrect.Value = False
		  
		  IsEditMode = False
		  SelectedOptionID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOptionLetter(orderNum As Integer) As String
		  ' Convert order number to letter (0->A, 1->B, etc.)
		  Select Case orderNum
		  Case 0
		    Return "A"
		  Case 1
		    Return "B"
		  Case 2
		    Return "C"
		  Case 3
		    Return "D"
		  Case 4
		    Return "E"
		  Case 5
		    Return "F"
		  Case 6
		    Return "G"
		  Case 7
		    Return "H"
		  Case Else
		    Return Str(orderNum + 1)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  ' Callback for delete confirmation
		  If button <> dialog.ActionButton Then
		    Return
		  End If
		  
		  If SelectedOptionID = 0 Then Return
		  
		  Try
		    Var sql As String = "DELETE FROM mcq_options WHERE option_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, SelectedOptionID)
		    ps.ExecuteSQL
		    
		    LoadOptions()
		    ClearEditor()
		    
		    Var d As New WebMessageDialog
		    d.Title = "Success"
		    d.Message = "Option deleted successfully."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    
		  Catch e As DatabaseException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error deleting option: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    System.DebugLog("Error deleting option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize(questionID As Integer)
		  ' Initialize the dialog for a specific question
		  QuestionID = questionID
		  LoadOptions()
		  ClearEditor()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadOptionForEdit()
		  ' Load selected option into editor
		  Var selectedRow As Integer = lstOptions.SelectedRowIndex
		  If selectedRow < 0 Then Return
		  
		  SelectedOptionID = lstOptions.RowTagAt(selectedRow)
		  
		  Var sql As String = "SELECT option_text, is_correct FROM mcq_options WHERE option_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, SelectedOptionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If Not rs.AfterLastRow Then
		      txtOptionText.Text = rs.Column("option_text").StringValue
		      chkIsCorrect.Value = (rs.Column("is_correct").IntegerValue = 1)
		      IsEditMode = True
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadOptions()
		  ' Load options from database into list
		  lstOptions.RemoveAllRows
		  
		  Var sql As String = "SELECT option_id, option_text, is_correct, order_num " + _
		  "FROM mcq_options WHERE question_id = ? ORDER BY order_num"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, QuestionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    While Not rs.AfterLastRow
		      Var orderNum As Integer = rs.Column("order_num").IntegerValue
		      Var letter As String = GetOptionLetter(orderNum)
		      
		      lstOptions.AddRow(letter)
		      lstOptions.CellValueAt(lstOptions.LastAddedRowIndex, 1) = rs.Column("option_text").StringValue
		      lstOptions.CellValueAt(lstOptions.LastAddedRowIndex, 2) = If(rs.Column("is_correct").IntegerValue = 1, "✓", "")
		      
		      ' Store option_id in RowTag
		      lstOptions.RowTagAt(lstOptions.LastAddedRowIndex) = rs.Column("option_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading options: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveOption(direction As Integer)
		  ' Move option up (-1) or down (1)
		  If SelectedOptionID = 0 Then Return
		  
		  Var selectedRow As Integer = lstOptions.SelectedRowIndex
		  If selectedRow < 0 Then Return
		  
		  ' Calculate target row
		  Var targetRow As Integer = selectedRow + direction
		  If targetRow < 0 Or targetRow >= lstOptions.RowCount Then Return
		  
		  Try
		    ' Swap order_num values
		    Var currentOrder As Integer = selectedRow
		    Var targetOrder As Integer = targetRow
		    
		    ' Get the option_id of the target row
		    Var targetOptionID As Integer = lstOptions.RowTagAt(targetRow)
		    
		    ' Swap orders using a temporary value
		    Var sql1 As String = "UPDATE mcq_options SET order_num = -1 WHERE option_id = ?"
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(sql1)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.Bind(0, SelectedOptionID)
		    ps1.ExecuteSQL
		    
		    Var sql2 As String = "UPDATE mcq_options SET order_num = ? WHERE option_id = ?"
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(sql2)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, currentOrder)
		    ps2.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(1, targetOptionID)
		    ps2.ExecuteSQL
		    
		    Var sql3 As String = "UPDATE mcq_options SET order_num = ? WHERE option_id = ?"
		    Var ps3 As MySQLPreparedStatement = Session.DB.Prepare(sql3)
		    ps3.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps3.Bind(0, targetOrder)
		    ps3.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps3.Bind(1, SelectedOptionID)
		    ps3.ExecuteSQL
		    
		    ' Reload and reselect
		    LoadOptions()
		    lstOptions.SelectedRowIndex = targetRow
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error moving option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveOption()
		  ' Save the current option
		  Var optionText As String = txtOptionText.Text.Trim
		  If optionText = "" Then
		    Var d As New WebMessageDialog
		    d.Title = "Validation Error"
		    d.Message = "Please enter option text."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Try
		    If IsEditMode Then
		      ' Update existing option
		      Var sql As String = "UPDATE mcq_options SET option_text = ?, is_correct = ? WHERE option_id = ?"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(0, optionText)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.Bind(1, If(chkIsCorrect.Value, 1, 0))
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(2, SelectedOptionID)
		      ps.ExecuteSQL
		      
		    Else
		      ' Insert new option
		      ' Get next order_num
		      Var maxOrderSQL As String = "SELECT COALESCE(MAX(order_num), -1) + 1 as next_order FROM mcq_options WHERE question_id = ?"
		      Var ps0 As MySQLPreparedStatement = Session.DB.Prepare(maxOrderSQL)
		      ps0.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps0.Bind(0, QuestionID)
		      Var rs As RowSet = ps0.SelectSQL
		      Var nextOrder As Integer = rs.Column("next_order").IntegerValue
		      
		      Var sql As String = "INSERT INTO mcq_options (question_id, option_text, is_correct, order_num) " + _
		      "VALUES (?, ?, ?, ?)"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, QuestionID)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, optionText)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.Bind(2, If(chkIsCorrect.Value, 1, 0))
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(3, nextOrder)
		      ps.ExecuteSQL
		    End If
		    
		    ' Reload list and clear editor
		    LoadOptions()
		    ClearEditor()
		    
		    Var d As New WebMessageDialog
		    d.Title = "Success"
		    d.Message = "Option saved successfully."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    
		  Catch e As DatabaseException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error saving option: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    System.DebugLog("Error saving option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IsEditMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private QuestionID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedOptionID As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lstOptions
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' Load selected option for editing
		  #Pragma Unused rows
		  LoadOptionForEdit()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSave
	#tag Event
		Sub Pressed()
		  ' Save the option
		  SaveOption()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDelete
	#tag Event
		Sub Pressed()
		  ' Confirm before deleting
		  If SelectedOptionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Option Selected"
		    d.Message = "Please select an option to delete."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Var d As New WebMessageDialog
		  d.Title = "Confirm Delete"
		  d.Message = "Are you sure you want to delete this option?"
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Caption = "Cancel"
		  d.CancelButton.Visible = True
		  
		  AddHandler d.ButtonPressed, AddressOf HandleDeleteConfirm
		  d.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveUp
	#tag Event
		Sub Pressed()
		  ' Move option up
		  MoveOption(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveDown
	#tag Event
		Sub Pressed()
		  ' Move option up
		  MoveOption(1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Pressed()
		  ' Close the dialog
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
