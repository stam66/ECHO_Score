#tag WebDialog
Begin WebDialog dlg_ManageMCQOptions
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
   MaximumHeight   =   800
   MaximumWidth    =   800
   MinimumHeight   =   500
   MinimumWidth    =   600
   Modal           =   True
   PanelIndex      =   0
   TabIndex        =   0
   Title           =   "Manage Answer Options"
   Tooltip         =   ""
   Top             =   0
   Visible         =   True
   Width           =   700
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   
   Begin WebLabel lblQuestionText
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   12.0
      Height          =   80
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
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Question will appear here..."
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   660
      _mPanelIndex    =   -1
   End
   
   Begin WebListBox lstOptions
      ColumnCount     =   4
      ColumnWidths    =   "40,50,450,100"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   300
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "#	Order	Option Text	Correct?"
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
      Top             =   110
      Visible         =   True
      Width           =   660
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnAddOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add Option"
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
      Top             =   420
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnEditOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Edit"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   150
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
      Top             =   420
      Visible         =   True
      Width           =   80
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnDeleteOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   False
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   240
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
      Top             =   420
      Visible         =   True
      Width           =   80
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
      Left            =   565
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
      Tooltip         =   "Move option up"
      Top             =   420
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
      Left            =   625
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
      Tooltip         =   "Move option down"
      Top             =   420
      Visible         =   True
      Width           =   55
      _mPanelIndex    =   -1
   End
   
   Begin WebLabel lblOptionLabel
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
      TabIndex        =   7
      TabStop         =   True
      Text            =   "Option Text:"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   480
      Underline       =   False
      Visible         =   False
      Width           =   150
      _mPanelIndex    =   -1
   End
   
   Begin WebTextArea txtOptionText
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   60
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
      TabIndex        =   8
      TabStop         =   True
      Text            =   ""
      Tooltip         =   ""
      Top             =   510
      Visible         =   False
      Width           =   660
      _mPanelIndex    =   -1
   End
   
   Begin WebCheckbox chkIsCorrect
      Caption         =   "This is a correct answer"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   30
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
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
      Top             =   450
      Value           =   False
      Visible         =   False
      Width           =   250
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnSaveOption
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   480
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
      Visible         =   False
      Width           =   90
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnCancelOption
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
      Left            =   580
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
      Visible         =   False
      Width           =   100
      _mPanelIndex    =   -1
   End
   
   Begin WebButton btnClose
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Done"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   580
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   540
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebDialog

#tag WindowCode
	#tag Property, Flags = &h0
		QuestionID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EditingOptionID As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsEditMode As Boolean = False
	#tag EndProperty


	#tag Method, Flags = &h0
		Sub Initialize(questionID As Integer)
		  ' *******************************************************************************
		  ' Initialize Method
		  ' Sets up the dialog for managing options for a specific question
		  ' *******************************************************************************
		  
		  Me.QuestionID = questionID
		  LoadQuestion
		  LoadOptions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQuestion()
		  ' *******************************************************************************
		  ' LoadQuestion Method
		  ' Loads question text for display
		  ' *******************************************************************************
		  
		  Try
		    Var sql As String = "SELECT question_text FROM mcq_questions WHERE question_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, QuestionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      lblQuestionText.Text = rs.Column("question_text").StringValue
		    End If
		    
		  Catch e As DatabaseException
		    System.DebugLog("Error loading question: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadOptions()
		  ' *******************************************************************************
		  ' LoadOptions Method
		  ' Loads all options for this question
		  ' *******************************************************************************
		  
		  lstOptions.RemoveAllRows
		  
		  Try
		    Var sql As String = "SELECT option_id, option_text, option_order, is_correct FROM mcq_options " + _
		    "WHERE question_id = ? ORDER BY option_order"
		    
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, QuestionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil Then
		      While Not rs.AfterLastRow
		        Var optionID As Integer = rs.Column("option_id").IntegerValue
		        Var optionText As String = rs.Column("option_text").StringValue
		        Var optionOrder As Integer = rs.Column("option_order").IntegerValue
		        Var isCorrect As Boolean = rs.Column("is_correct").BooleanValue
		        
		        ' Truncate option text for display
		        If optionText.Length > 50 Then
		          optionText = optionText.Left(47) + "..."
		        End If
		        
		        ' Format order as letter (A, B, C, etc.)
		        Var orderLetter As String = Chr(65 + optionOrder)
		        
		        lstOptions.AddRow(Str(optionID), orderLetter, optionText, If(isCorrect, "âœ" Yes", ""))
		        lstOptions.RowTagAt(lstOptions.LastAddedRowIndex) = optionID
		        
		        rs.MoveToNextRow
		      Wend
		    End If
		    
		    System.DebugLog("Loaded " + Str(lstOptions.RowCount) + " options")
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading options: " + e.Message)
		    System.DebugLog("LoadOptions Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowOptionEditor(editMode As Boolean, Optional optionID As Integer = 0)
		  ' *******************************************************************************
		  ' ShowOptionEditor Method
		  ' Shows the option editor panel
		  ' *******************************************************************************
		  
		  IsEditMode = editMode
		  EditingOptionID = optionID
		  
		  If editMode And optionID > 0 Then
		    LoadOptionForEdit(optionID)
		  Else
		    txtOptionText.Text = ""
		    chkIsCorrect.Value = False
		  End If
		  
		  ' Show editor controls
		  lblOptionLabel.Visible = True
		  txtOptionText.Visible = True
		  chkIsCorrect.Visible = True
		  btnSaveOption.Visible = True
		  btnCancelOption.Visible = True
		  
		  ' Hide main controls
		  lstOptions.Enabled = False
		  btnAddOption.Enabled = False
		  btnEditOption.Enabled = False
		  btnDeleteOption.Enabled = False
		  btnMoveUp.Enabled = False
		  btnMoveDown.Enabled = False
		  btnClose.Visible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HideOptionEditor()
		  ' *******************************************************************************
		  ' HideOptionEditor Method
		  ' Hides the option editor panel
		  ' *******************************************************************************
		  
		  lblOptionLabel.Visible = False
		  txtOptionText.Visible = False
		  chkIsCorrect.Visible = False
		  btnSaveOption.Visible = False
		  btnCancelOption.Visible = False
		  
		  ' Re-enable main controls
		  lstOptions.Enabled = True
		  btnAddOption.Enabled = True
		  btnClose.Visible = True
		  UpdateButtonStates
		  
		  IsEditMode = False
		  EditingOptionID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadOptionForEdit(optionID As Integer)
		  ' *******************************************************************************
		  ' LoadOptionForEdit Method
		  ' Loads an option's data for editing
		  ' *******************************************************************************
		  
		  Try
		    Var sql As String = "SELECT * FROM mcq_options WHERE option_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, optionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      txtOptionText.Text = rs.Column("option_text").StringValue
		      chkIsCorrect.Value = rs.Column("is_correct").BooleanValue
		    End If
		    
		  Catch e As DatabaseException
		    MessageBox("Error loading option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveOption()
		  ' *******************************************************************************
		  ' SaveOption Method
		  ' Saves the option (insert or update)
		  ' *******************************************************************************
		  
		  ' Validation
		  If txtOptionText.Text.Trim = "" Then
		    MessageBox("Please enter option text.")
		    Return
		  End If
		  
		  Try
		    If IsEditMode And EditingOptionID > 0 Then
		      ' Update existing option
		      Var sql As String = "UPDATE mcq_options SET option_text=?, is_correct=? WHERE option_id=?"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, txtOptionText.Text.Trim)
		      ps.Bind(1, chkIsCorrect.Value)
		      ps.Bind(2, EditingOptionID)
		      ps.ExecuteSQL
		    Else
		      ' Insert new option
		      ' Get next order number
		      Var maxOrderSQL As String = "SELECT COALESCE(MAX(option_order), -1) + 1 AS next_order FROM mcq_options WHERE question_id = ?"
		      Var maxOrderPS As MySQLPreparedStatement = Session.DB.Prepare(maxOrderSQL)
		      maxOrderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      maxOrderPS.Bind(0, QuestionID)
		      Var maxOrderRS As RowSet = maxOrderPS.SelectSQL
		      
		      Var nextOrder As Integer = 0
		      If maxOrderRS <> Nil And Not maxOrderRS.AfterLastRow Then
		        nextOrder = maxOrderRS.Column("next_order").IntegerValue
		      End If
		      
		      Var sql As String = "INSERT INTO mcq_options (question_id, option_text, option_order, is_correct) VALUES (?, ?, ?, ?)"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		      ps.Bind(0, QuestionID)
		      ps.Bind(1, txtOptionText.Text.Trim)
		      ps.Bind(2, nextOrder)
		      ps.Bind(3, chkIsCorrect.Value)
		      ps.ExecuteSQL
		    End If
		    
		    HideOptionEditor
		    LoadOptions
		    
		  Catch e As DatabaseException
		    MessageBox("Error saving option: " + e.Message)
		    System.DebugLog("SaveOption Error: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteOption()
		  ' *******************************************************************************
		  ' DeleteOption Method
		  ' Deletes the selected option
		  ' *******************************************************************************
		  
		  If lstOptions.SelectedRowIndex < 0 Then Return
		  
		  Var optionID As Integer = lstOptions.RowTagAt(lstOptions.SelectedRowIndex)
		  
		  Var result As MessageBoxResult = MessageBox("Are you sure you want to delete this option?", MessageBox.ActionCancel)
		  
		  If result = MessageBoxResult.Action Then
		    Try
		      Var sql As String = "DELETE FROM mcq_options WHERE option_id = ?"
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, optionID)
		      ps.ExecuteSQL
		      
		      LoadOptions
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting option: " + e.Message)
		    End Try
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveOption(direction As String)
		  ' *******************************************************************************
		  ' MoveOption Method
		  ' Moves an option up or down
		  ' *******************************************************************************
		  
		  If lstOptions.SelectedRowIndex < 0 Then Return
		  
		  Var currentRow As Integer = lstOptions.SelectedRowIndex
		  Var optionID As Integer = lstOptions.RowTagAt(currentRow)
		  
		  ' Get current order from database
		  Try
		    Var sql As String = "SELECT option_order FROM mcq_options WHERE option_id = ?"
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, optionID)
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs = Nil Or rs.AfterLastRow Then Return
		    Var currentOrder As Integer = rs.Column("option_order").IntegerValue
		    
		    Var swapRow As Integer = If(direction = "up", currentRow - 1, currentRow + 1)
		    If swapRow < 0 Or swapRow >= lstOptions.RowCount Then Return
		    
		    Var swapOptionID As Integer = lstOptions.RowTagAt(swapRow)
		    
		    ' Get swap option order
		    ps = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, swapOptionID)
		    rs = ps.SelectSQL
		    
		    If rs = Nil Or rs.AfterLastRow Then Return
		    Var swapOrder As Integer = rs.Column("option_order").IntegerValue
		    
		    ' Swap orders
		    Var updateSQL As String = "UPDATE mcq_options SET option_order = ? WHERE option_id = ?"
		    
		    Var ps1 As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
		    ps1.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps1.Bind(0, swapOrder)
		    ps1.Bind(1, optionID)
		    ps1.ExecuteSQL
		    
		    Var ps2 As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
		    ps2.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps2.Bind(0, currentOrder)
		    ps2.Bind(1, swapOptionID)
		    ps2.ExecuteSQL
		    
		    LoadOptions
		    lstOptions.SelectedRowIndex = swapRow
		    
		  Catch e As DatabaseException
		    MessageBox("Error moving option: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateButtonStates()
		  ' *******************************************************************************
		  ' UpdateButtonStates Method
		  ' Enables/disables buttons based on selection
		  ' *******************************************************************************
		  
		  Var hasSelection As Boolean = (lstOptions.SelectedRowIndex >= 0)
		  
		  btnEditOption.Enabled = hasSelection
		  btnDeleteOption.Enabled = hasSelection
		  btnMoveUp.Enabled = hasSelection And lstOptions.SelectedRowIndex > 0
		  btnMoveDown.Enabled = hasSelection And lstOptions.SelectedRowIndex < lstOptions.RowCount - 1
		End Sub
	#tag EndMethod

#tag EndWindowCode

#tag Events lstOptions
	#tag Event
		Sub SelectionChanged()
		  UpdateButtonStates
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.ColumnAlignmentAt(0) = WebListBox.Alignments.Center  ' ID
		  Me.ColumnAlignmentAt(1) = WebListBox.Alignments.Center  ' Order
		  Me.ColumnAlignmentAt(3) = WebListBox.Alignments.Center  ' Correct
		End Sub
	#tag EndEvent
	#tag Event
		Sub RowDoublePressed(row As Integer)
		  If row >= 0 Then
		    Var optionID As Integer = Me.RowTagAt(row)
		    ShowOptionEditor(True, optionID)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddOption
	#tag Event
		Sub Pressed()
		  ShowOptionEditor(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEditOption
	#tag Event
		Sub Pressed()
		  If lstOptions.SelectedRowIndex >= 0 Then
		    Var optionID As Integer = lstOptions.RowTagAt(lstOptions.SelectedRowIndex)
		    ShowOptionEditor(True, optionID)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteOption
	#tag Event
		Sub Pressed()
		  DeleteOption
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveUp
	#tag Event
		Sub Pressed()
		  MoveOption("up")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnMoveDown
	#tag Event
		Sub Pressed()
		  MoveOption("down")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveOption
	#tag Event
		Sub Pressed()
		  SaveOption
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnCancelOption
	#tag Event
		Sub Pressed()
		  HideOptionEditor
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
