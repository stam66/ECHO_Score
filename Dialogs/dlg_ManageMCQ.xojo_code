#tag WebPage
Begin WebDialog dlg_ManageMCQ
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   620
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
   Width           =   945
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
      Text            =   "Manage MCQ questions"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   860
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstQuestions
      AllowRowReordering=   False
      ColumnCount     =   5
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
      InitialValue    =   "#	Question Text	Type	Points	Options"
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
      Top             =   60
      Visible         =   True
      Width           =   860
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
      Text            =   "Question Editor"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   389
      Underline       =   False
      Visible         =   True
      Width           =   400
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblQuestionText
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Question Text:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   414
      Underline       =   False
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   Begin WebTextArea txtQuestionText
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   80
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
      Top             =   452
      Visible         =   True
      Width           =   905
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
      Indicator       =   ""
      Italic          =   False
      Left            =   424
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
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Question Type:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   418
      Underline       =   False
      Visible         =   True
      Width           =   116
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu popQuestionType
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   28
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Single Choice\nMultiple Choice"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   550
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
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   415
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
      Indicator       =   ""
      Italic          =   False
      Left            =   783
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
      Text            =   "Points:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   418
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
      Height          =   34
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   845
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
      TabIndex        =   8
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   412
      Visible         =   True
      Width           =   80
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
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   562
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnManageOptions
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Manage Options"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   128
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
      Top             =   562
      Visible         =   True
      Width           =   154
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
      Left            =   717
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
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   562
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
      Left            =   891
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
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
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
      Left            =   891
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
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   160
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
      Left            =   825
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
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   562
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
		  txtQuestionText.Text = ""
		  popQuestionType.SelectedRowIndex = 0
		  txtPoints.Text = "1"
		  
		  IsEditMode = False
		  SelectedQuestionID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDeleteConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
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
		  ' Initialize the dialog for a specific case
		  Self.MCQCaseID = caseID
		  LoadQuestions()
		  ClearEditor()
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
		Private Sub OpenOptionsManager()
		  ' Open the options management dialog
		  If SelectedQuestionID = 0 Then
		    Var d As New WebMessageDialog
		    d.Title = "No Question Selected"
		    d.Message = "Please select a question first."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    Return
		  End If
		  
		  System.DebugLog("OpenOptionsManager - SelectedQuestionID: " + Str(SelectedQuestionID))
		  Var optionsDialog As New dlg_ManageMCQOptions
		  optionsDialog.Initialize(SelectedQuestionID)
		  System.DebugLog("After Initialize, checking dialog's QuestionID...")
		  optionsDialog.Show
		  
		  ' Refresh list after dialog closes
		  WebTimer.CallLater(500, AddressOf LoadQuestions)
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
		    If IsEditMode Then
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
		    End If
		    
		    ' Reload list and clear editor
		    LoadQuestions()
		    ClearEditor()
		    
		    Var d As New WebMessageDialog
		    d.Title = "Success"
		    d.Message = "Question saved successfully."
		    d.ActionButton.Caption = "OK"
		    d.CancelButton.Visible = False
		    d.Show
		    
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


	#tag Property, Flags = &h21
		Private IsEditMode As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MCQCaseID As Integer
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
#tag Events btnSave
	#tag Event
		Sub Pressed()
		  ' Save the question
		  SaveQuestion()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnManageOptions
	#tag Event
		Sub Pressed()
		  ' Open options manager
		  OpenOptionsManager()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDelete
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
		  
		  AddHandler d.ButtonPressed, AddressOf HandleDeleteConfirm
		  d.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveUp
	#tag Event
		Sub Pressed()
		  MoveQuestion(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveDown
	#tag Event
		Sub Pressed()
		  MoveQuestion(1)
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
	#tag ViewProperty
		Name="MCQCaseID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
