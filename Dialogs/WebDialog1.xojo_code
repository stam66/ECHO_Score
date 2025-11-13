#tag WebDialog
Begin WebDialog dlg_ManageMCQ
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   FullScreen      =   False
   Height          =   700
   ImplicitInstance=   False
   Index           =   -2147483648
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   True
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   LockVertical    =   False
   MaximumHeight   =   900
   MaximumWidth    =   1000
   MinimumHeight   =   600
   MinimumWidth    =   800
   Modal           =   True
   PanelIndex      =   0
   TabIndex        =   0
   Title           =   "Manage MCQ Questions"
   Tooltip         =   ""
   Top             =   0
   Visible         =   True
   Width           =   900
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   
   Begin WebLabel lblCaseInfo
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   14.0
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
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Case: [Serial Number] - [Label]"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   600
      _mPanelIndex    =   -1
   End
   
   Begin WebListBox lstQuestions
      ColumnCount     =   5
      ColumnWidths    =   "40,50,400,80,80"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   300
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "#	Order	Question Text	Type	Points"
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowSelectionType=   0
      Scope           =   0
      SearchCriteria  =   ""
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Visible         =   True
      Width           =   860
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnAddQuestion
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add Question"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   370
      Visible         =   True
      Width           =   130
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnEditQuestion
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Edit Question"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   370
      Visible         =   True
      Width           =   130
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnDeleteQuestion
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Question"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   370
      Visible         =   True
      Width           =   140
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnMoveUp
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "↑"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   760
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   "Move question up"
      Top             =   370
      Visible         =   True
      Width           =   55
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnMoveDown
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "↓"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   825
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   "Move question down"
      Top             =   370
      Visible         =   True
      Width           =   55
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnClose
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Close"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   780
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   640
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   
   ' Question Editor Panel (initially hidden)
   Begin WebLabel lblQuestionTextLabel
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   25
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
      Scope           =   0
      TabIndex        =   8
      TabStop         =   True
      Text            =   "Question Text:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   430
      Underline       =   False
      Visible         =   False
      Width           =   150
      _mPanelIndex    =   -1
   End
   
   Begin WebTextArea txtQuestionText
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   80
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
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
      Scope           =   0
      TabIndex        =   9
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   460
      Visible         =   False
      Width           =   860
      _mPanelIndex    =   -1
   End
   
   Begin WebPopupMenu popQuestionType
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Single Choice\nMultiple Choice"
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   550
      Visible         =   False
      Width           =   180
      _mPanelIndex    =   -1
   End
   
   Begin WebTextField txtPoints
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   3
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   220
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
      Scope           =   0
      TabIndex        =   11
      TabStop         =   True
      Text            =   "1"
      Tooltip         =   "Points awarded for correct answer"
      Top             =   550
      Visible         =   False
      Width           =   80
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnSaveQuestion
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
      Left            =   640
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   550
      Visible         =   False
      Width           =   120
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnCancelEdit
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
      Left            =   770
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   550
      Visible         =   False
      Width           =   110
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblOptionsTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   25
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
      Scope           =   0
      TabIndex        =   14
      TabStop         =   True
      Text            =   "Answer Options (check correct answer(s)):"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   600
      Underline       =   False
      Visible         =   False
      Width           =   400
      _mPanelIndex    =   -1
   End
End
#tag EndWebDialog

#tag WindowCode
	#tag Property, Flags = &h0
		CaseID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EditingQuestionID As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsEditMode As Boolean = False
	#tag EndProperty


	#tag Method, Flags = &h0
		Sub Initialize(caseID As Integer)
		  ' *******************************************************************************
		  ' Initialize Method
		  ' Sets up the dialog for the specified case
		  ' *******************************************************************************
		  
		  Me.CaseID = caseID
		  LoadCaseInfo
		  LoadQuestions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadCaseInfo()
		  ' *******************************************************************************
		  ' LoadCaseInfo Method
		  ' Loads case information for display
		  ' *******************************************************************************
		  
		  Try
		    Var sql As String = "SELECT serial_number, case_label FROM cases WHERE case_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, CaseID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      lblCaseInfo.Text = "Case: " + rs.Column("serial_number").StringValue + " - " + _
		      rs.Column("case_label").StringValue
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading case info: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQuestions()
		  ' *******************************************************************************
		  ' LoadQuestions Method
		  ' Loads all MCQ questions for this case into the listbox
		  ' *******************************************************************************
		  
		  lstQuestions.RemoveAllRows
		  
		  Try
		    Var sql As String = "SELECT question_id, question_text, question_type, question_order, points FROM mcq_questions " + _
		    "WHERE case_id = ? AND is_active = 1 ORDER BY question_order"
		    
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, CaseID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil Then
		      While Not rs.AfterLastRow
		        Var questionID As Integer = rs.Column("question_id").IntegerValue
		        Var questionText As String = rs.Column("question_text").StringValue
		        Var questionType As String = rs.Column("question_type").StringValue
		        Var questionOrder As Integer = rs.Column("question_order").IntegerValue
		        Var points As Integer = rs.Column("points").IntegerValue
		        
		        ' Truncate question text for display
		        If questionText.Length > 60 Then
		          questionText = questionText.Left(57) + "..."
		        End If
		        
		        ' Format type for display
		        Var typeDisplay As String = If(questionType = "single", "Single", "Multiple")
		        
		        lstQuestions.AddRow(Str(questionID), Str(questionOrder), questionText, typeDisplay, Str(points))
		        lstQuestions.RowTagAt(lstQuestions.LastAddedRowIndex) = questionID
		        
		        rs.MoveToNextRow
		      Wend
		    End If
		    
		    System.DebugLog("Loaded " + Str(lstQuestions.RowCount) + " questions")
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading questions: " + e.Message)
		    System.DebugLog("LoadQuestions Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowQuestionEditor(editMode As Boolean, Optional questionID As Integer = 0)
		  ' *******************************************************************************
		  ' ShowQuestionEditor Method
		  ' Shows/hides the question editor panel
		  ' *******************************************************************************
		  
		  IsEditMode = editMode
		  EditingQuestionID = questionID
		  
		  If editMode And questionID > 0 Then
		    ' Load existing question for editing
		    LoadQuestionForEdit(questionID)
		  Else
		    ' Clear for new question
		    txtQuestionText.Text = ""
		    popQuestionType.SelectedRowIndex = 0
		    txtPoints.Text = "1"
		  End If
		  
		  ' Show editor controls
		  lblQuestionTextLabel.Visible = True
		  txtQuestionText.Visible = True
		  popQuestionType.Visible = True
		  txtPoints.Visible = True
		  btnSaveQuestion.Visible = True
		  btnCancelEdit.Visible = True
		  lblOptionsTitle.Visible = True
		  
		  ' Disable list controls
		  lstQuestions.Enabled = False
		  btnAddQuestion.Enabled = False
		  btnEditQuestion.Enabled = False
		  btnDeleteQuestion.Enabled = False
		  btnMoveUp.Enabled = False
		  btnMoveDown.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HideQuestionEditor()
		  ' *******************************************************************************
		  ' HideQuestionEditor Method
		  ' Hides the question editor panel
		  ' *******************************************************************************
		  
		  lblQuestionTextLabel.Visible = False
		  txtQuestionText.Visible = False
		  popQuestionType.Visible = False
		  txtPoints.Visible = False
		  btnSaveQuestion.Visible = False
		  btnCancelEdit.Visible = False
		  lblOptionsTitle.Visible = False
		  
		  ' Re-enable list controls
		  lstQuestions.Enabled = True
		  btnAddQuestion.Enabled = True
		  UpdateButtonStates
		  
		  IsEditMode = False
		  EditingQuestionID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQuestionForEdit(questionID As Integer)
		  ' *******************************************************************************
		  ' LoadQuestionForEdit Method
		  ' Loads a question's data for editing
		  ' *******************************************************************************
		  
		  Try
		    Var sql As String = "SELECT * FROM mcq_questions WHERE question_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, questionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      txtQuestionText.Text = rs.Column("question_text").StringValue
		      txtPoints.Text = Str(rs.Column("points").IntegerValue)
		      
		      Var questionType As String = rs.Column("question_type").StringValue
		      popQuestionType.SelectedRowIndex = If(questionType = "single", 0, 1)
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveQuestion()
		  ' *******************************************************************************
		  ' SaveQuestion Method
		  ' Saves the question (insert or update)
		  ' Note: Option management should be done in a separate dialog
		  ' *******************************************************************************
		  
		  ' Validation
		  If txtQuestionText.Text.Trim = "" Then
		    MessageBox("Please enter question text.")
		    Return
		  End If
		  
		  Var points As Integer = Val(txtPoints.Text)
		  If points < 1 Then
		    MessageBox("Points must be at least 1.")
		    Return
		  End If
		  
		  Try
		    Var questionType As String = If(popQuestionType.SelectedRowIndex = 0, "single", "multiple")
		    
		    If IsEditMode And EditingQuestionID > 0 Then
		      ' Update existing question
		      Var sql As String = "UPDATE mcq_questions SET question_text=?, question_type=?, points=? WHERE question_id=?"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, txtQuestionText.Text.Trim)
		      ps.Bind(1, questionType)
		      ps.Bind(2, points)
		      ps.Bind(3, EditingQuestionID)
		      ps.ExecuteSQL
		      
		      MessageBox("Question updated successfully!" + EndOfLine + EndOfLine + _
		      "To manage answer options, please edit the question again.")
		    Else
		      ' Insert new question
		      ' Get next order number
		      Var maxOrderSQL As String = "SELECT COALESCE(MAX(question_order), -1) + 1 AS next_order FROM mcq_questions WHERE case_id = ?"
		      Var maxOrderPS As MySQLPreparedStatement = Session.DB.Prepare(maxOrderSQL)
		      maxOrderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      maxOrderPS.Bind(0, CaseID)
		      Var maxOrderRS As RowSet = maxOrderPS.SelectSQL
		      
		      Var nextOrder As Integer = 0
		      If maxOrderRS <> Nil And Not maxOrderRS.AfterLastRow Then
		        nextOrder = maxOrderRS.Column("next_order").IntegerValue
		      End If
		      
		      Var sql As String = "INSERT INTO mcq_questions (case_id, question_text, question_type, question_order, points) VALUES (?, ?, ?, ?, ?)"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, CaseID)
		      ps.Bind(1, txtQuestionText.Text.Trim)
		      ps.Bind(2, questionType)
		      ps.Bind(3, nextOrder)
		      ps.Bind(4, points)
		      ps.ExecuteSQL
		      
		      MessageBox("Question created successfully!" + EndOfLine + EndOfLine + _
		      "Remember to add answer options by editing the question.")
		    End If
		    
		    HideQuestionEditor
		    LoadQuestions
		    
		  Catch e As DatabaseException
		    MessageBox("Error saving question: " + e.Message)
		    System.DebugLog("SaveQuestion Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteQuestion()
		  ' *******************************************************************************
		  ' DeleteQuestion Method
		  ' Deletes the selected question
		  ' *******************************************************************************
		  
		  If lstQuestions.SelectedRowIndex < 0 Then Return
		  
		  Var questionID As Integer = lstQuestions.RowTagAt(lstQuestions.SelectedRowIndex)
		  
		  Var result As MessageBoxResult = MessageBox("Are you sure you want to delete this question?" + EndOfLine + EndOfLine + _
		  "This will also delete all answer options and any student responses to this question.", MessageBox.ActionCancel)
		  
		  If result = MessageBoxResult.Action Then
		    Try
		      Var sql As String = "DELETE FROM mcq_questions WHERE question_id = ?"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, questionID)
		      ps.ExecuteSQL
		      
		      LoadQuestions
		      MessageBox("Question deleted successfully.")
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting question: " + e.Message)
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveQuestion(direction As String)
		  ' *******************************************************************************
		  ' MoveQuestion Method
		  ' Moves a question up or down in the order
		  ' *******************************************************************************
		  
		  If lstQuestions.SelectedRowIndex < 0 Then Return
		  
		  Var currentRow As Integer = lstQuestions.SelectedRowIndex
		  Var questionID As Integer = lstQuestions.RowTagAt(currentRow)
		  Var currentOrder As Integer = Val(lstQuestions.CellTextAt(currentRow, 1))
		  
		  Var swapRow As Integer = If(direction = "up", currentRow - 1, currentRow + 1)
		  If swapRow < 0 Or swapRow >= lstQuestions.RowCount Then Return
		  
		  Var swapQuestionID As Integer = lstQuestions.RowTagAt(swapRow)
		  Var swapOrder As Integer = Val(lstQuestions.CellTextAt(swapRow, 1))
		  
		  Try
		    ' Swap the question_order values
		    Var sql1 As String = "UPDATE mcq_questions SET question_order = ? WHERE question_id = ?"
		    
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(sql1)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.Bind(0, swapOrder)
		    ps1.Bind(1, questionID)
		    ps1.ExecuteSQL
		    
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(sql1)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, currentOrder)
		    ps2.Bind(1, swapQuestionID)
		    ps2.ExecuteSQL
		    
		    LoadQuestions
		    lstQuestions.SelectedRowIndex = swapRow
		    
		  Catch e As DatabaseException
		    MessageBox("Error moving question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateButtonStates()
		  ' *******************************************************************************
		  ' UpdateButtonStates Method
		  ' Enables/disables buttons based on selection
		  ' *******************************************************************************
		  
		  Var hasSelection As Boolean = (lstQuestions.SelectedRowIndex >= 0)
		  
		  btnEditQuestion.Enabled = hasSelection
		  btnDeleteQuestion.Enabled = hasSelection
		  btnMoveUp.Enabled = hasSelection And lstQuestions.SelectedRowIndex > 0
		  btnMoveDown.Enabled = hasSelection And lstQuestions.SelectedRowIndex < lstQuestions.RowCount - 1
		End Sub
	#tag EndMethod

#tag EndWindowCode

#tag Events lstQuestions
	#tag Event
		Sub SelectionChanged()
		  UpdateButtonStates
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.ColumnAlignmentAt(0) = WebListBox.Alignments.Center  ' ID
		  Me.ColumnAlignmentAt(1) = WebListBox.Alignments.Center  ' Order
		  Me.ColumnAlignmentAt(3) = WebListBox.Alignments.Center  ' Type
		  Me.ColumnAlignmentAt(4) = WebListBox.Alignments.Center  ' Points
		End Sub
	#tag EndEvent
	#tag Event
		Sub RowDoublePressed(row As Integer)
		  If row >= 0 Then
		    Var questionID As Integer = Me.RowTagAt(row)
		    ShowQuestionEditor(True, questionID)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddQuestion
	#tag Event
		Sub Pressed()
		  ShowQuestionEditor(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEditQuestion
	#tag Event
		Sub Pressed()
		  If lstQuestions.SelectedRowIndex >= 0 Then
		    Var questionID As Integer = lstQuestions.RowTagAt(lstQuestions.SelectedRowIndex)
		    ShowQuestionEditor(True, questionID)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteQuestion
	#tag Event
		Sub Pressed()
		  DeleteQuestion
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveUp
	#tag Event
		Sub Pressed()
		  MoveQuestion("up")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveDown
	#tag Event
		Sub Pressed()
		  MoveQuestion("down")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Pressed()
		  Me.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveQuestion
	#tag Event
		Sub Pressed()
		  SaveQuestion
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancelEdit
	#tag Event
		Sub Pressed()
		  HideQuestionEditor
		End Sub
	#tag EndEvent
#tag EndEvents
