#tag WebDialog
Begin WebDialog dlg_MCQAssessment
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   FullScreen      =   False
   Height          =   600
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
   MaximumHeight   =   600
   MaximumWidth    =   800
   MinimumHeight   =   400
   MinimumWidth    =   600
   Modal           =   True
   PanelIndex      =   0
   TabIndex        =   0
   Title           =   "Additional Assessment Questions"
   Tooltip         =   ""
   Top             =   0
   Visible         =   True
   Width           =   800
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   
   Begin WebLabel lblQuestionNumber
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
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Question 1 of 5"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblProgress
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
      Left            =   580
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   1
      TabStop         =   True
      Text            =   "0 of 5 answered"
      TextAlignment   =   2
      TextColor       =   &c808080FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblQuestionText
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   14.0
      Height          =   120
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
      Multiline       =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Question text will appear here..."
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   60
      Underline       =   False
      Visible         =   True
      Width           =   760
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkOptionA
      Caption         =   "Option A"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   40
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   200
      Value           =   False
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkOptionB
      Caption         =   "Option B"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   40
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   250
      Value           =   False
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkOptionC
      Caption         =   "Option C"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   40
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   300
      Value           =   False
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkOptionD
      Caption         =   "Option D"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   40
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   350
      Value           =   False
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkOptionE
      Caption         =   "Option E"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   40
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   400
      Value           =   False
      Visible         =   True
      Width           =   720
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblQuestionType
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   11.0
      Height          =   25
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   True
      Left            =   40
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
      Text            =   "Select one answer"
      TextAlignment   =   0
      TextColor       =   &c606060FF
      Tooltip         =   ""
      Top             =   460
      Underline       =   False
      Visible         =   True
      Width           =   300
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnPrevious
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "â†� Previous"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      Indicator       =   2
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   9
      TabStop         =   True
      Tooltip         =   ""
      Top             =   540
      Visible         =   True
      Width           =   130
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnNext
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Next â†'"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      Indicator       =   1
      Left            =   540
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   10
      TabStop         =   True
      Tooltip         =   ""
      Top             =   540
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnSubmit
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Submit MCQ Answers"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      Indicator       =   3
      Left            =   670
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   540
      Visible         =   True
      Width           =   110
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblWarning
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   11.0
      Height          =   40
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   True
      Left            =   160
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &cFF0000FF
      Tooltip         =   ""
      Top             =   540
      Underline       =   False
      Visible         =   False
      Width           =   370
      _mPanelIndex    =   -1
   End
End
#tag EndWebDialog

#tag WindowCode
	#tag Property, Flags = &h0
		CaseID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Questions() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentQuestionIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UserAnswers() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AllOptionCheckboxes() As WebCheckbox
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsMultipleChoice As Boolean = False
	#tag EndProperty


	#tag Method, Flags = &h0
		Sub Initialize(caseID As Integer)
		  ' *******************************************************************************
		  ' Initialize Method
		  ' Sets up the MCQ dialog with questions for the specified case
		  ' *******************************************************************************
		  
		  Me.CaseID = caseID
		  
		  ' Store references to all option checkboxes for easy iteration
		  AllOptionCheckboxes.Add(chkOptionA)
		  AllOptionCheckboxes.Add(chkOptionB)
		  AllOptionCheckboxes.Add(chkOptionC)
		  AllOptionCheckboxes.Add(chkOptionD)
		  AllOptionCheckboxes.Add(chkOptionE)
		  
		  ' Load questions from database
		  LoadQuestions
		  
		  ' Check if we have existing responses (draft mode)
		  LoadExistingResponses
		  
		  ' Display first question
		  If Questions.Count > 0 Then
		    CurrentQuestionIndex = 0
		    DisplayQuestion(0)
		  Else
		    MessageBox("No MCQ questions found for this case.")
		    Me.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQuestions()
		  ' *******************************************************************************
		  ' LoadQuestions Method
		  ' Loads all MCQ questions and their options for this case
		  ' *******************************************************************************
		  
		  Try
		    ' Query to get questions
		    Var sql As String = "SELECT question_id, question_text, question_type, question_order, points " + _
		    "FROM mcq_questions " + _
		    "WHERE case_id = ? AND is_active = 1 " + _
		    "ORDER BY question_order"
		    
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, CaseID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil Then
		      While Not rs.AfterLastRow
		        Var questionDict As New Dictionary
		        questionDict.Value("question_id") = rs.Column("question_id").IntegerValue
		        questionDict.Value("question_text") = rs.Column("question_text").StringValue
		        questionDict.Value("question_type") = rs.Column("question_type").StringValue
		        questionDict.Value("question_order") = rs.Column("question_order").IntegerValue
		        questionDict.Value("points") = rs.Column("points").IntegerValue
		        
		        ' Load options for this question
		        Var options() As Dictionary
		        Var optionSQL As String = "SELECT option_id, option_text, option_order, is_correct " + _
		        "FROM mcq_options " + _
		        "WHERE question_id = ? " + _
		        "ORDER BY option_order"
		        
		        Var optionPS As MySQLPreparedStatement = Session.DB.Prepare(optionSQL)
		        optionPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        optionPS.Bind(0, questionDict.Value("question_id"))
		        Var optionRS As RowSet = optionPS.SelectSQL
		        
		        If optionRS <> Nil Then
		          While Not optionRS.AfterLastRow
		            Var optionDict As New Dictionary
		            optionDict.Value("option_id") = optionRS.Column("option_id").IntegerValue
		            optionDict.Value("option_text") = optionRS.Column("option_text").StringValue
		            optionDict.Value("option_order") = optionRS.Column("option_order").IntegerValue
		            optionDict.Value("is_correct") = optionRS.Column("is_correct").BooleanValue
		            options.Add(optionDict)
		            optionRS.MoveToNextRow
		          Wend
		        End If
		        
		        questionDict.Value("options") = options
		        Questions.Add(questionDict)
		        rs.MoveToNextRow
		      Wend
		    End If
		    
		    System.DebugLog("Loaded " + Str(Questions.Count) + " MCQ questions for case " + Str(CaseID))
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading MCQ questions: " + e.Message)
		    System.DebugLog("MCQ Load Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadExistingResponses()
		  ' *******************************************************************************
		  ' LoadExistingResponses Method
		  ' Loads any previously saved (draft) MCQ responses for this user/case
		  ' *******************************************************************************
		  
		  Try
		    ' First get the user_response_id for this case
		    Var sql As String = "SELECT response_id FROM user_responses WHERE user_id = ? AND case_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, Session.CurrentUserID)
		    ps.Bind(1, CaseID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      Var userResponseID As Integer = rs.Column("response_id").IntegerValue
		      
		      ' Load MCQ responses
		      Var mcqSQL As String = "SELECT question_id, selected_option_ids FROM user_mcq_responses WHERE user_response_id = ?"
		      Var mcqPS As MySQLPreparedStatement = Session.DB.Prepare(mcqSQL)
		      mcqPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      mcqPS.Bind(0, userResponseID)
		      Var mcqRS As RowSet = mcqPS.SelectSQL
		      
		      If mcqRS <> Nil Then
		        While Not mcqRS.AfterLastRow
		          Var answerDict As New Dictionary
		          answerDict.Value("question_id") = mcqRS.Column("question_id").IntegerValue
		          answerDict.Value("selected_option_ids") = mcqRS.Column("selected_option_ids").StringValue
		          UserAnswers.Add(answerDict)
		          mcqRS.MoveToNextRow
		        Wend
		      End If
		      
		      System.DebugLog("Loaded " + Str(UserAnswers.Count) + " existing MCQ responses")
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading existing MCQ responses: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisplayQuestion(index As Integer)
		  ' *******************************************************************************
		  ' DisplayQuestion Method
		  ' Displays the question at the specified index
		  ' *******************************************************************************
		  
		  If index < 0 Or index >= Questions.Count Then
		    Return
		  End If
		  
		  CurrentQuestionIndex = index
		  Var question As Dictionary = Questions(index)
		  
		  ' Update question number and progress
		  lblQuestionNumber.Text = "Question " + Str(index + 1) + " of " + Str(Questions.Count)
		  UpdateProgressLabel
		  
		  ' Display question text
		  lblQuestionText.Text = question.Value("question_text")
		  
		  ' Determine question type
		  Var questionType As String = question.Value("question_type")
		  IsMultipleChoice = (questionType = "multiple")
		  
		  ' Update instruction label
		  If IsMultipleChoice Then
		    lblQuestionType.Text = "Select all that apply"
		  Else
		    lblQuestionType.Text = "Select one answer"
		  End If
		  
		  ' Clear all checkboxes
		  For Each cb As WebCheckbox In AllOptionCheckboxes
		    cb.Value = False
		    cb.Visible = False
		    cb.Caption = ""
		  Next
		  
		  ' Display options
		  Var options() As Dictionary = question.Value("options")
		  For i As Integer = 0 To options.LastIndex
		    If i < AllOptionCheckboxes.Count Then
		      Var cb As WebCheckbox = AllOptionCheckboxes(i)
		      Var optionText As String = Chr(65 + i) + ". " + options(i).Value("option_text") ' A, B, C, D, E
		      cb.Caption = optionText
		      cb.Visible = True
		      
		      ' Store option_id in Tag for later retrieval
		      cb.Tag = options(i).Value("option_id")
		    End If
		  Next
		  
		  ' Load previously saved answer if exists
		  LoadSavedAnswerForQuestion(question.Value("question_id"))
		  
		  ' Update navigation buttons
		  btnPrevious.Enabled = (index > 0)
		  btnNext.Caption = If(index = Questions.Count - 1, "Review", "Next â†'")
		  
		  ' Hide warning
		  lblWarning.Visible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSavedAnswerForQuestion(questionID As Integer)
		  ' *******************************************************************************
		  ' LoadSavedAnswerForQuestion Method
		  ' Loads and displays previously saved answer for a specific question
		  ' *******************************************************************************
		  
		  For Each answer As Dictionary In UserAnswers
		    If answer.Value("question_id") = questionID Then
		      Var selectedIDs As String = answer.Value("selected_option_ids")
		      Var idArray() As String = selectedIDs.Split(",")
		      
		      For Each cb As WebCheckbox In AllOptionCheckboxes
		        If cb.Visible And cb.Tag <> Nil Then
		          Var optionID As String = Str(cb.Tag)
		          For Each savedID As String In idArray
		            If savedID.Trim = optionID Then
		              cb.Value = True
		              Exit For
		            End If
		          Next
		        End If
		      Next
		      
		      Return
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveCurrentAnswer()
		  ' *******************************************************************************
		  ' SaveCurrentAnswer Method
		  ' Saves the current question's answer to memory (not database yet)
		  ' *******************************************************************************
		  
		  Var question As Dictionary = Questions(CurrentQuestionIndex)
		  Var questionID As Integer = question.Value("question_id")
		  
		  ' Collect selected option IDs
		  Var selectedIDs() As String
		  For Each cb As WebCheckbox In AllOptionCheckboxes
		    If cb.Visible And cb.Value And cb.Tag <> Nil Then
		      selectedIDs.Add(Str(cb.Tag))
		    End If
		  Next
		  
		  ' Find existing answer or create new
		  Var found As Boolean = False
		  For i As Integer = 0 To UserAnswers.LastIndex
		    If UserAnswers(i).Value("question_id") = questionID Then
		      UserAnswers(i).Value("selected_option_ids") = String.FromArray(selectedIDs, ",")
		      found = True
		      Exit For
		    End If
		  Next
		  
		  If Not found Then
		    Var answerDict As New Dictionary
		    answerDict.Value("question_id") = questionID
		    answerDict.Value("selected_option_ids") = String.FromArray(selectedIDs, ",")
		    UserAnswers.Add(answerDict)
		  End If
		  
		  UpdateProgressLabel
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateProgressLabel()
		  ' *******************************************************************************
		  ' UpdateProgressLabel Method
		  ' Updates the progress indicator showing answered questions
		  ' *******************************************************************************
		  
		  Var answeredCount As Integer = 0
		  For Each answer As Dictionary In UserAnswers
		    Var selectedIDs As String = answer.Value("selected_option_ids")
		    If selectedIDs <> "" Then
		      answeredCount = answeredCount + 1
		    End If
		  Next
		  
		  lblProgress.Text = Str(answeredCount) + " of " + Str(Questions.Count) + " answered"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ValidateSubmission() As Boolean
		  ' *******************************************************************************
		  ' ValidateSubmission Method
		  ' Validates that all questions have been answered
		  ' Returns True if valid, False otherwise
		  ' *******************************************************************************
		  
		  Var unanswered() As String
		  
		  For i As Integer = 0 To Questions.LastIndex
		    Var question As Dictionary = Questions(i)
		    Var questionID As Integer = question.Value("question_id")
		    Var hasAnswer As Boolean = False
		    
		    For Each answer As Dictionary In UserAnswers
		      If answer.Value("question_id") = questionID Then
		        Var selectedIDs As String = answer.Value("selected_option_ids")
		        If selectedIDs <> "" Then
		          hasAnswer = True
		          Exit For
		        End If
		      End If
		    Next
		    
		    If Not hasAnswer Then
		      unanswered.Add(Str(i + 1))
		    End If
		  Next
		  
		  If unanswered.Count > 0 Then
		    lblWarning.Text = "Please answer question(s): " + String.FromArray(unanswered, ", ")
		    lblWarning.Visible = True
		    Return False
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SubmitAnswers()
		  ' *******************************************************************************
		  ' SubmitAnswers Method
		  ' Saves all MCQ responses to the database and calculates score
		  ' *******************************************************************************
		  
		  ' Save current answer first
		  SaveCurrentAnswer
		  
		  ' Validate all questions answered
		  If Not ValidateSubmission Then
		    Return
		  End If
		  
		  Try
		    ' Get or create user_response_id
		    Var userResponseID As Integer = GetUserResponseID()
		    If userResponseID = 0 Then
		      MessageBox("Error: Could not find or create response record.")
		      Return
		    End If
		    
		    ' Calculate MCQ score
		    Var mcqScore As Integer = 0
		    Var totalPossiblePoints As Integer = 0
		    
		    ' Save each answer and calculate score
		    For Each answer As Dictionary In UserAnswers
		      Var questionID As Integer = answer.Value("question_id")
		      Var selectedIDsStr As String = answer.Value("selected_option_ids")
		      
		      ' Get question details for scoring
		      Var question As Dictionary = GetQuestionByID(questionID)
		      If question = Nil Then Continue
		      
		      Var points As Integer = question.Value("points")
		      totalPossiblePoints = totalPossiblePoints + points
		      
		      ' Check if answer is correct
		      Var isCorrect As Boolean = CheckAnswerCorrectness(questionID, selectedIDsStr)
		      Var pointsEarned As Integer = If(isCorrect, points, 0)
		      mcqScore = mcqScore + pointsEarned
		      
		      ' Save to database
		      Var sql As String = "INSERT INTO user_mcq_responses (user_response_id, question_id, selected_option_ids, is_correct, points_earned) " + _
		      "VALUES (?, ?, ?, ?, ?) " + _
		      "ON DUPLICATE KEY UPDATE selected_option_ids=?, is_correct=?, points_earned=?"
		      
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      ps.Bind(0, userResponseID)
		      ps.Bind(1, questionID)
		      ps.Bind(2, selectedIDsStr)
		      ps.Bind(3, isCorrect)
		      ps.Bind(4, pointsEarned)
		      ps.Bind(5, selectedIDsStr)
		      ps.Bind(6, isCorrect)
		      ps.Bind(7, pointsEarned)
		      
		      ps.ExecuteSQL
		    Next
		    
		    ' Update user_responses with MCQ score
		    Var updateSQL As String = "UPDATE user_responses SET mcq_score = ?, has_mcq_questions = 1 WHERE response_id = ?"
		    Var updatePS As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
		    updatePS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    updatePS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    updatePS.Bind(0, mcqScore)
		    updatePS.Bind(1, userResponseID)
		    updatePS.ExecuteSQL
		    
		    System.DebugLog("MCQ answers submitted successfully. Score: " + Str(mcqScore) + "/" + Str(totalPossiblePoints))
		    
		    ' Show confirmation
		    MessageBox("MCQ Assessment submitted successfully!" + EndOfLine + _
		    "You earned " + Str(mcqScore) + " out of " + Str(totalPossiblePoints) + " points.")
		    
		    Me.Close
		    
		  Catch e As DatabaseException
		    MessageBox("Error submitting MCQ answers: " + e.Message)
		    System.DebugLog("MCQ Submit Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetUserResponseID() As Integer
		  ' *******************************************************************************
		  ' GetUserResponseID Method
		  ' Gets existing or creates new user_responses record
		  ' *******************************************************************************
		  
		  Try
		    Var sql As String = "SELECT response_id FROM user_responses WHERE user_id = ? AND case_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, Session.CurrentUserID)
		    ps.Bind(1, CaseID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      Return rs.Column("response_id").IntegerValue
		    Else
		      ' Create new response record
		      Var insertSQL As String = "INSERT INTO user_responses (user_id, case_id, has_mcq_questions) VALUES (?, ?, 1)"
		      Var insertPS As MySQLPreparedStatement = Session.DB.Prepare(insertSQL)
		      insertPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      insertPS.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      insertPS.Bind(0, Session.CurrentUserID)
		      insertPS.Bind(1, CaseID)
		      insertPS.ExecuteSQL
		      
		      ' Get the ID of the newly created record
		      Var lastIDSQL As String = "SELECT LAST_INSERT_ID() AS id"
		      Var idRS As RowSet = Session.DB.SelectSQL(lastIDSQL)
		      If idRS <> Nil And Not idRS.AfterLastRow Then
		        Return idRS.Column("id").IntegerValue
		      End If
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error getting user_response_id: " + e.Message)
		  End Try
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetQuestionByID(questionID As Integer) As Dictionary
		  ' *******************************************************************************
		  ' GetQuestionByID Method
		  ' Returns the question dictionary for the specified ID
		  ' *******************************************************************************
		  
		  For Each q As Dictionary In Questions
		    If q.Value("question_id") = questionID Then
		      Return q
		    End If
		  Next
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckAnswerCorrectness(questionID As Integer, selectedIDsStr As String) As Boolean
		  ' *******************************************************************************
		  ' CheckAnswerCorrectness Method
		  ' Checks if the selected options match the correct answer(s)
		  ' *******************************************************************************
		  
		  Var question As Dictionary = GetQuestionByID(questionID)
		  If question = Nil Then Return False
		  
		  Var options() As Dictionary = question.Value("options")
		  Var selectedIDs() As String = selectedIDsStr.Split(",")
		  
		  ' Get correct option IDs
		  Var correctIDs() As String
		  For Each opt As Dictionary In options
		    If opt.Value("is_correct") Then
		      correctIDs.Add(Str(opt.Value("option_id")))
		    End If
		  Next
		  
		  ' Compare selected with correct
		  If selectedIDs.Count <> correctIDs.Count Then
		    Return False
		  End If
		  
		  For Each correctID As String In correctIDs
		    Var found As Boolean = False
		    For Each selectedID As String In selectedIDs
		      If selectedID.Trim = correctID.Trim Then
		        found = True
		        Exit For
		      End If
		    Next
		    If Not found Then Return False
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

#tag EndWindowCode

#tag Events chkOptionA
	#tag Event
		Sub ValueChanged()
		  ' For single choice questions, uncheck other options
		  If Not IsMultipleChoice And Me.Value Then
		    For Each cb As WebCheckbox In AllOptionCheckboxes
		      If cb <> Me And cb.Visible Then
		        cb.Value = False
		      End If
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkOptionB
	#tag Event
		Sub ValueChanged()
		  ' For single choice questions, uncheck other options
		  If Not IsMultipleChoice And Me.Value Then
		    For Each cb As WebCheckbox In AllOptionCheckboxes
		      If cb <> Me And cb.Visible Then
		        cb.Value = False
		      End If
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkOptionC
	#tag Event
		Sub ValueChanged()
		  ' For single choice questions, uncheck other options
		  If Not IsMultipleChoice And Me.Value Then
		    For Each cb As WebCheckbox In AllOptionCheckboxes
		      If cb <> Me And cb.Visible Then
		        cb.Value = False
		      End If
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkOptionD
	#tag Event
		Sub ValueChanged()
		  ' For single choice questions, uncheck other options
		  If Not IsMultipleChoice And Me.Value Then
		    For Each cb As WebCheckbox In AllOptionCheckboxes
		      If cb <> Me And cb.Visible Then
		        cb.Value = False
		      End If
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkOptionE
	#tag Event
		Sub ValueChanged()
		  ' For single choice questions, uncheck other options
		  If Not IsMultipleChoice And Me.Value Then
		    For Each cb As WebCheckbox In AllOptionCheckboxes
		      If cb <> Me And cb.Visible Then
		        cb.Value = False
		      End If
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPrevious
	#tag Event
		Sub Pressed()
		  ' Save current answer before moving
		  SaveCurrentAnswer
		  
		  ' Navigate to previous question
		  If CurrentQuestionIndex > 0 Then
		    DisplayQuestion(CurrentQuestionIndex - 1)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNext
	#tag Event
		Sub Pressed()
		  ' Save current answer before moving
		  SaveCurrentAnswer
		  
		  ' Navigate to next question
		  If CurrentQuestionIndex < Questions.Count - 1 Then
		    DisplayQuestion(CurrentQuestionIndex + 1)
		  Else
		    ' At last question, show review or allow submission
		    ' For now, just enable submit button
		    MessageBox("Please review your answers and click 'Submit MCQ Answers' when ready.")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSubmit
	#tag Event
		Sub Pressed()
		  ' Confirm submission
		  Var result As MessageBoxResult = MessageBox("Are you sure you want to submit your MCQ answers?" + EndOfLine + EndOfLine + _
		  "You cannot change your answers after submission.", MessageBox.ActionCancel)
		  
		  If result = MessageBoxResult.Action Then
		    SubmitAnswers
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
