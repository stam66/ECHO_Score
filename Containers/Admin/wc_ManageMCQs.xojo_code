#tag WebContainerControl
Begin wc_base wc_ManageMCQs
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   820
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1002
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox lstQuestions
      AllowRowReordering=   True
      ColumnCount     =   5
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      FrozenColumns   =   "0"
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   270
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "#	Question Text	Type	Points	Options\n1	some text ehre	single	1	options?\n2	some text ehre	single	1	options?\n3	some text ehre	single	1	options?\n4	some text ehre	single	1	options?\n1	some text ehre	single	1	options?\n2	some text ehre	single	1	options?\n3	some text ehre	single	1	options?\n4	some text ehre	single	1	options?"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
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
      Top             =   0
      Visible         =   True
      Width           =   944
      _mPanelIndex    =   -1
   End
   Begin WebTextArea txtQuestionText
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   63
      Hint            =   "Question Text"
      Index           =   -2147483648
      Indicator       =   0
      Left            =   1
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   278
      Visible         =   True
      Width           =   944
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblQuestionType
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   14
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
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Question Type:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   356
      Underline       =   False
      Visible         =   True
      Width           =   116
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popQuestionType
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Single Choice\nMultiple Choice"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   138
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   349
      Visible         =   True
      Width           =   203
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblPoints
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   368
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
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Points:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   356
      Underline       =   False
      Visible         =   True
      Width           =   58
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtPoints
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
      Indicator       =   0
      Left            =   432
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
      TabIndex        =   7
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   349
      Visible         =   True
      Width           =   80
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveQuestionUp
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
      Left            =   952
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   54
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveQuestionDown
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
      Left            =   952
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   100
      Visible         =   True
      Width           =   45
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
      Height          =   282
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Letter	Option Text	Correct"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
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
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   433
      Visible         =   True
      Width           =   944
      _mPanelIndex    =   -1
   End
   Begin WebTextArea txtOptionText
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Hint            =   "Option Text"
      Index           =   -2147483648
      Indicator       =   0
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   12
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   723
      Visible         =   True
      Width           =   638
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkIsCorrect
      Caption         =   "This is a correct answer"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   0
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   765
      Value           =   False
      Visible         =   True
      Width           =   213
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveOpotionUp
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
      Left            =   952
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   483
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnMoveOptionDown
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
      Left            =   952
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   15
      TabStop         =   True
      Tooltip         =   ""
      Top             =   529
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnSaveOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save Option"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   647
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
      TabIndex        =   16
      TabStop         =   True
      Tooltip         =   ""
      Top             =   723
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteQuestion
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Question"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   799
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   17
      TabStop         =   True
      Tooltip         =   ""
      Top             =   349
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Option"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   800
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   18
      TabStop         =   True
      Tooltip         =   ""
      Top             =   723
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebLabel btnNewOption
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   32.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   953
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   19
      TabStop         =   True
      Text            =   "⊕"
      TextAlignment   =   2
      TextColor       =   &c4F8F0000
      Tooltip         =   ""
      Top             =   433
      Underline       =   False
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebLabel btnNewQuestion
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   32.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   953
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   20
      TabStop         =   True
      Text            =   "⊕"
      TextAlignment   =   2
      TextColor       =   &c4F8F0000
      Tooltip         =   ""
      Top             =   8
      Underline       =   False
      Visible         =   True
      Width           =   45
      _mPanelIndex    =   -1
   End
   Begin WebButton btnSave
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save Question"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   646
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   21
      TabStop         =   True
      Tooltip         =   ""
      Top             =   349
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Shown()
		  if lstQuestions.RowCount > 0 then
		    lstQuestions.SelectedRowIndex = 0
		    LoadQuestionForEdit()
		  end If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ClearEditor()
		  
		  ' Clear question editor
		  txtQuestionText.Text = ""
		  popQuestionType.SelectedRowIndex = 0
		  txtPoints.Text = "1"
		  IsEditMode = False
		  SelectedQuestionID = 0
		  
		  ' Clear option editor
		  txtOptionText.Text = ""
		  chkIsCorrect.Value = False
		  SelectedOptionID = 0
		  
		  ' Clear options list
		  lstOptions.RemoveAllRows()
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
		Private Sub HandleDeleteOptionConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
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
		    
		    ' Save selection before reloading
		    LastSelectedQuestionID = SelectedQuestionID
		    
		    LoadOptions()
		    ClearEditor()
		    
		    ' Reload questions list to update option count
		    LoadQuestions()
		    
		    ' Restore selection after reload
		    If LastSelectedQuestionID > 0 Then
		      For i As Integer = 0 To lstQuestions.RowCount - 1
		        If lstQuestions.RowTagAt(i) = LastSelectedQuestionID Then
		          lstQuestions.SelectedRowIndex = i
		          Exit For i
		        End If
		      Next
		    End If
		    
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

	#tag Method, Flags = &h21
		Private Sub HandleDeleteQuestionConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  ' Callback for delete confirmation
		  If button <> dialog.ActionButton Then
		    Return
		  End If
		  
		  If SelectedQuestionID = 0 Then Return
		  
		  Try
		    ' Delete options first (foreign key constraint)
		    Var sql1 As String = "DELETE FROM mcq_options WHERE question_id = ?"
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(sql1)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.Bind(0, SelectedQuestionID)
		    ps1.ExecuteSQL
		    
		    ' Delete question
		    Var sql2 As String = "DELETE FROM mcq_questions WHERE question_id = ?"
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(sql2)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, SelectedQuestionID)
		    ps2.ExecuteSQL
		    
		    LoadQuestions()
		    ClearEditor()
		    
		    Var d As New WebMessageDialog
		    d.Title = "Success"
		    d.Message = "Question deleted successfully."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    
		  Catch e As DatabaseException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error deleting question: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    System.DebugLog("Error deleting question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize(caseID As Integer)
		  ' Initialize the container for a specific case
		  Self.MCQCaseID = caseID
		  LoadQuestions()
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
		  
		  ' Only load options if a question is selected
		  If SelectedQuestionID = 0 Then Return
		  
		  Var sql As String = "SELECT option_id, option_text, is_correct, order_num " + _
		  "FROM mcq_options WHERE question_id = ? ORDER BY order_num"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, SelectedQuestionID)
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
		Private Sub LoadQuestionForEdit()
		  
		  ' Load selected question into editor
		  Var selectedRow As Integer = lstQuestions.SelectedRowIndex
		  If selectedRow < 0 Then Return
		  
		  SelectedQuestionID = lstQuestions.RowTagAt(selectedRow)
		  
		  Var sql As String = "SELECT question_text, question_type, points FROM mcq_questions WHERE question_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, SelectedQuestionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If Not rs.AfterLastRow Then
		      txtQuestionText.Text = rs.Column("question_text").StringValue
		      popQuestionType.SelectedRowIndex = If(rs.Column("question_type").StringValue = "single", 0, 1)
		      txtPoints.Text = Str(rs.Column("points").IntegerValue)
		      IsEditMode = True
		      
		      ' Clear option editor when switching questions
		      txtOptionText.Text = ""
		      chkIsCorrect.Value = False
		      SelectedOptionID = 0
		      
		      ' Load options for this question
		      LoadOptions()
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQuestions()
		  ' Load questions from database into list
		  lstQuestions.RemoveAllRows
		  System.DebugLog("LoadQuestions called - MCQCaseID: " + Str(Self.MCQCaseID))
		  
		  Var sql As String = "SELECT q.question_id, q.question_text, q.question_type, q.points, " + _
		  "COUNT(o.option_id) as option_count " + _
		  "FROM mcq_questions q " + _
		  "LEFT JOIN mcq_options o ON q.question_id = o.question_id " + _
		  "WHERE q.case_id = ? " + _
		  "GROUP BY q.question_id " + _
		  "ORDER BY q.order_num"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, MCQCaseID)
		    Var rs As RowSet = ps.SelectSQL
		    System.DebugLog("Query executed. Checking results...")
		    System.DebugLog("Query executed, AfterLastRow: " + Str(rs.AfterLastRow))
		    
		    Var rowNum As Integer = 1
		    While Not rs.AfterLastRow
		      lstQuestions.AddRow(Str(rowNum))
		      lstQuestions.CellValueAt(lstQuestions.LastAddedRowIndex, 1) = rs.Column("question_text").StringValue
		      
		      Var qType As String = rs.Column("question_type").StringValue
		      lstQuestions.CellValueAt(lstQuestions.LastAddedRowIndex, 2) = If(qType = "single", "Single", "Multiple")
		      
		      lstQuestions.CellValueAt(lstQuestions.LastAddedRowIndex, 3) = Str(rs.Column("points").IntegerValue)
		      lstQuestions.CellValueAt(lstQuestions.LastAddedRowIndex, 4) = Str(rs.Column("option_count").IntegerValue)
		      
		      ' Store question_id in RowTag
		      lstQuestions.RowTagAt(lstQuestions.LastAddedRowIndex) = rs.Column("question_id").IntegerValue
		      
		      rowNum = rowNum + 1
		      rs.MoveToNextRow
		    Wend
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading questions: " + e.Message)
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
		Private Sub MoveQuestion(direction As Integer)
		  ' Move question up (-1) or down (1)
		  If SelectedQuestionID = 0 Then Return
		  
		  Var selectedRow As Integer = lstQuestions.SelectedRowIndex
		  If selectedRow < 0 Then Return
		  
		  ' Calculate target row
		  Var targetRow As Integer = selectedRow + direction
		  If targetRow < 0 Or targetRow >= lstQuestions.RowCount Then Return
		  
		  Try
		    ' Swap order_num values
		    Var currentOrder As Integer = selectedRow + 1
		    Var targetOrder As Integer = targetRow + 1
		    
		    ' Get the question_id of the target row
		    Var targetQuestionID As Integer = lstQuestions.RowTagAt(targetRow)
		    
		    ' Swap orders using a temporary value
		    Var sql1 As String = "UPDATE mcq_questions SET order_num = 0 WHERE question_id = ?"
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(sql1)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.Bind(0, SelectedQuestionID)
		    ps1.ExecuteSQL
		    
		    Var sql2 As String = "UPDATE mcq_questions SET order_num = ? WHERE question_id = ?"
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(sql2)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, currentOrder)
		    ps2.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(1, targetQuestionID)
		    ps2.ExecuteSQL
		    
		    Var sql3 As String = "UPDATE mcq_questions SET order_num = ? WHERE question_id = ?"
		    Var ps3 As MySQLPreparedStatement = Session.DB.Prepare(sql3)
		    ps3.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps3.Bind(0, targetOrder)
		    ps3.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps3.Bind(1, SelectedQuestionID)
		    ps3.ExecuteSQL
		    
		    ' Reload and reselect
		    LoadQuestions()
		    lstQuestions.SelectedRowIndex = targetRow
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error moving question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveAll()
		  ' Save both question and option if they have data
		  Var questionSaved As Boolean = False
		  Var optionSaved As Boolean = False
		  Var errors() As String
		  
		  ' Save question if there's text
		  If txtQuestionText.Text.Trim <> "" Then
		    Try
		      SaveQuestion()
		      questionSaved = True
		    Catch e As RuntimeException
		      errors.Add("Question: " + e.Message)
		    End Try
		  End If
		  
		  ' Save option if there's text and a question is selected
		  If txtOptionText.Text.Trim <> "" And SelectedQuestionID <> 0 Then
		    Try
		      SaveOption()
		      optionSaved = True
		    Catch e As RuntimeException
		      errors.Add("Option: " + e.Message)
		    End Try
		  End If
		  
		  ' Show appropriate message
		  If errors.Count > 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "Save Errors"
		    d.Message = String.FromArray(errors, EndOfLine)
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		  ElseIf questionSaved Or optionSaved Then
		    Var d As New WebMessageDialog
		    d.Title = "Success"
		    Var msg As String = ""
		    If questionSaved Then msg = msg + "Question saved. "
		    If optionSaved Then msg = msg + "Option saved."
		    d.Message = msg.Trim
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveOption()
		  ' Save the current option
		  var tID as string = str(SelectedQuestionID)
		  System.DebugLog("SaveOption called - SelectedQuestionID: " + tID)
		  
		  ' Must have a question selected
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question before adding options."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
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
		  
		  ' Verify question exists
		  Try
		    Var checkSQL As String = "SELECT question_id FROM mcq_questions WHERE question_id = ?"
		    Var checkPS As MySQLPreparedStatement = Session.DB.Prepare(checkSQL)
		    checkPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    checkPS.Bind(0, SelectedQuestionID)
		    Var checkRS As RowSet = checkPS.SelectSQL
		    
		    If checkRS.AfterLastRow Then
		      Var d As New WebMessageDialog
		      d.Title = "Error"
		      d.Message = "Question ID " + Str(SelectedQuestionID) + " does not exist in the database."
		      d.ActionButton.Caption = "OK"
		      d.CancelButton.Visible = False
		      d.Show
		      System.DebugLog("Question ID " + Str(SelectedQuestionID) + " not found in database")
		      Return
		    End If
		  Catch e As DatabaseException
		    System.DebugLog("Error checking question existence: " + e.Message)
		  End Try
		  
		  Try
		    If SelectedOptionID <> 0 Then
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
		      ps0.Bind(0, SelectedQuestionID)
		      Var rs As RowSet = ps0.SelectSQL
		      Var nextOrder As Integer = rs.Column("next_order").IntegerValue
		      
		      Var sql As String = "INSERT INTO mcq_options (question_id, option_text, is_correct, order_num) " + _
		      "VALUES (?, ?, ?, ?)"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, SelectedQuestionID)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, optionText)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.Bind(2, If(chkIsCorrect.Value, 1, 0))
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(3, nextOrder)
		      ps.ExecuteSQL
		    End If
		    
		    ' Save selection before reloading
		    LastSelectedQuestionID = SelectedQuestionID
		    
		    ' Reload options list and clear option editor
		    LoadOptions()
		    txtOptionText.Text = ""
		    chkIsCorrect.Value = False
		    SelectedOptionID = 0
		    
		    ' Reload questions list to update option count
		    LoadQuestions()
		    
		    ' Restore selection after reload
		    If LastSelectedQuestionID > 0 Then
		      For i As Integer = 0 To lstQuestions.RowCount - 1
		        If lstQuestions.RowTagAt(i) = LastSelectedQuestionID Then
		          lstQuestions.SelectedRowIndex = i
		          Exit For i
		        End If
		      Next
		    End If
		    
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

	#tag Method, Flags = &h21
		Private Sub SaveQuestion()
		  ' Save the current question
		  Var questionText As String = txtQuestionText.Text.Trim
		  If questionText = "" Then
		    Var d As New WebMessageDialog
		    d.Title = "Validation Error"
		    d.Message = "Please enter question text."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Var points As Integer
		  Try
		    points = Val(txtPoints.Text)
		    If points < 1 Then points = 1
		  Catch
		    points = 1
		  End Try
		  
		  Var qType As String = If(popQuestionType.SelectedRowIndex = 0, "single", "multiple")
		  
		  Try
		    If IsEditMode And SelectedQuestionID <> 0 Then
		      ' Update existing question
		      Var sql As String = "UPDATE mcq_questions SET question_text = ?, question_type = ?, points = ? " + _
		      "WHERE question_id = ?"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(0, questionText)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, qType)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(2, points)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(3, SelectedQuestionID)
		      ps.ExecuteSQL
		      
		    Else
		      ' Insert new question
		      ' Get next order_num
		      Var maxOrderSQL As String = "SELECT COALESCE(MAX(order_num), 0) + 1 as next_order FROM mcq_questions WHERE case_id = ?"
		      Var ps0 As MySQLPreparedStatement = Session.DB.Prepare(maxOrderSQL)
		      ps0.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps0.Bind(0, MCQCaseID)
		      Var rs As RowSet = ps0.SelectSQL
		      Var nextOrder As Integer = rs.Column("next_order").IntegerValue
		      
		      Var sql As String = "INSERT INTO mcq_questions (case_id, question_text, question_type, points, order_num) " + _
		      "VALUES (?, ?, ?, ?, ?)"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, MCQCaseID)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(1, questionText)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.Bind(2, qType)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(3, points)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(4, nextOrder)
		      ps.ExecuteSQL
		      
		      ' Get the newly inserted question_id
		      Var getIDSQL As String = "SELECT LAST_INSERT_ID() as new_id"
		      Var idRS As RowSet = Session.DB.SelectSQL(getIDSQL)
		      If Not idRS.AfterLastRow Then
		        SelectedQuestionID = idRS.Column("new_id").IntegerValue
		        IsEditMode = True
		      End If
		    End If
		    
		    ' Reload list
		    LoadQuestions()
		    
		  Catch e As DatabaseException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error saving question: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    System.DebugLog("Error saving question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveQuestionWithSelection()
		  ' Validate question text
		  If txtQuestionText.Text.Trim = "" Then
		    Var d As New WebMessageDialog
		    d.Title = "Validation Error"
		    d.Message = "Please enter question text."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  ' Save the current selection
		  LastSelectedQuestionID = SelectedQuestionID
		  
		  Try
		    SaveQuestion()
		    
		    ' Restore selection after reload
		    If LastSelectedQuestionID > 0 Then
		      For i As Integer = 0 To lstQuestions.RowCount - 1
		        If lstQuestions.RowTagAt(i) = LastSelectedQuestionID Then
		          lstQuestions.SelectedRowIndex = i
		          Exit For i
		        End If
		      Next
		    End If
		    
		    ' Var d As New WebMessageDialog
		    ' d.Title = "Success"
		    ' d.Message = "Question saved successfully."
		    ' d.ActionButton.Caption = "OK"
		    ' d.CancelButton.Visible = False
		    ' d.Show
		    
		  Catch e As RuntimeException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error saving question: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IsEditMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSelectedQuestionID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MCQCaseID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedOptionID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SelectedQuestionID As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lstQuestions
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' Load selected question for editing
		  #Pragma Unused rows
		  LoadQuestionForEdit()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveQuestionUp
	#tag Event
		Sub Pressed()
		  MoveQuestion(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveQuestionDown
	#tag Event
		Sub Pressed()
		  MoveQuestion(1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstOptions
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' Load selected option for editing
		  #Pragma Unused rows
		  LoadOptionForEdit()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveOpotionUp
	#tag Event
		Sub Pressed()
		  ' Move option up
		  MoveOption(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveOptionDown
	#tag Event
		Sub Pressed()
		  ' Move option up
		  MoveOption(1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveOption
	#tag Event
		Sub Pressed()
		  ' Save option only
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question before adding options."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  If txtOptionText.Text.Trim = "" Then
		    Var d As New WebMessageDialog
		    d.Title = "Validation Error"
		    d.Message = "Please enter option text."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Try
		    SaveOption()
		    
		    ' Var d As New WebMessageDialog
		    ' d.Title = "Success"
		    ' d.Message = "Option saved successfully."
		    ' d.ActionButton.Caption = "OK"
		    ' d.CancelButton.Visible = False
		    ' d.Show
		    
		  Catch e As RuntimeException
		    Var d As New WebMessageDialog
		    d.Title = "Error"
		    d.Message = "Error saving option: " + e.Message
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteQuestion
	#tag Event
		Sub Pressed()
		  ' Confirm before deleting
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question to delete."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Var d As New WebMessageDialog
		  d.Title = "Confirm Delete"
		  d.Message = "Are you sure you want to delete this question and all its options?"
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Caption = "Cancel"
		  d.CancelButton.Visible = True
		  
		  AddHandler d.ButtonPressed, AddressOf HandleDeleteQuestionConfirm
		  d.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteOption
	#tag Event
		Sub Pressed()
		  ' Confirm before deleting
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question to delete."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  Var d As New WebMessageDialog
		  d.Title = "Confirm Delete"
		  d.Message = "Are you sure you want to delete this question and all its options?"
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Caption = "Cancel"
		  d.CancelButton.Visible = True
		  
		  AddHandler d.ButtonPressed, AddressOf HandleDeleteOptionConfirm
		  d.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewOption
	#tag Event
		Sub Pressed()
		  ' Clear option editor for new option
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question before adding options."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  txtOptionText.Text = ""
		  chkIsCorrect.Value = False
		  SelectedOptionID = 0
		  
		  ' Clear option selection
		  lstOptions.SelectedRowIndex = -1
		  
		  ' Focus on option text
		  txtOptionText.SetFocus()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewQuestion
	#tag Event
		Sub Pressed()
		  ' Clear editor for new question
		  txtQuestionText.Text = ""
		  popQuestionType.SelectedRowIndex = 0
		  txtPoints.Text = "1"
		  IsEditMode = False
		  SelectedQuestionID = 0
		  
		  ' Clear option editor and list
		  txtOptionText.Text = ""
		  chkIsCorrect.Value = False
		  SelectedOptionID = 0
		  lstOptions.RemoveAllRows()
		  
		  ' Clear question selection
		  lstQuestions.SelectedRowIndex = -1
		  
		  ' Focus on question text
		  txtQuestionText.SetFocus()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSave
	#tag Event
		Sub Pressed()
		  ' Save the question
		  SaveQuestionWithSelection()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="ContainerID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Position"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="PositionEnum"
		EditorType="Enum"
		#tag EnumValues
			"0 - Center"
			"1 - TopLeft"
		#tag EndEnumValues
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
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
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
	#tag ViewProperty
		Name="PanelIndex"
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
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="EnableBackButton"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EnableLogoutButton"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SectionTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MCQCaseID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastSelectedQuestionID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
