#tag WebContainerControl
Begin wc_base wc_CaseAdmin
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   760
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
   Width           =   1114
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel lblCasesTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
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
      Text            =   "Cases"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   199
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstCases
      AllowRowReordering=   False
      ColumnCount     =   2
      ColumnWidths    =   "40%,60%"
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   628
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Serial	Case Label"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   True
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
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   112
      Visible         =   True
      Width           =   333
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAddCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add Case"
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
      Scope           =   0
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   121
      _mPanelIndex    =   -1
   End
   Begin WebButton btnUpdateCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Update Case"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   149
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   121
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteCase
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Case"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   278
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   121
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblCaseDetails
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   388
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
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Case Details"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   199
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblSerial
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   388
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
      TabIndex        =   6
      TabStop         =   True
      Text            =   "Serial number"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   112
      Underline       =   False
      Visible         =   True
      Width           =   145
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
      Left            =   388
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
      TabIndex        =   7
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   151
      Visible         =   True
      Width           =   178
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblLabel
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   585
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
      Text            =   "Case Label"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   112
      Underline       =   False
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtCaseLabel
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
      Left            =   585
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
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   151
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblCorrectAnswers
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   388
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
      TabIndex        =   10
      TabStop         =   True
      Text            =   "Correct Answers"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   185
      Underline       =   False
      Visible         =   True
      Width           =   145
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkLVSizeDilated
      Caption         =   "LV Size - Dilated"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   11
      TabStop         =   True
      Tooltip         =   ""
      Top             =   214
      Value           =   False
      Visible         =   True
      Width           =   167
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkLVFunctionImpaired
      Caption         =   "LV Function - Significantly Impaired"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabStop         =   True
      Tooltip         =   ""
      Top             =   250
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkRVSizeDilated
      Caption         =   "RV Size - Dilated"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   13
      TabStop         =   True
      Tooltip         =   ""
      Top             =   285
      Value           =   False
      Visible         =   True
      Width           =   167
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkRVFunctionImpaired
      Caption         =   "RV Function - Significantly Impaired"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   14
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkAorticStenosis
      Caption         =   "Aortic Valve - Significant Stenosis"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   15
      TabStop         =   True
      Tooltip         =   ""
      Top             =   355
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkAorticRegurgitation
      Caption         =   "Aortic Valve - Significant Regurgitation"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   16
      TabStop         =   True
      Tooltip         =   ""
      Top             =   390
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkMitralStenosis
      Caption         =   "Mitral Valve - Significant Stenosis"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   17
      TabStop         =   True
      Tooltip         =   ""
      Top             =   425
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkMitralRegurgitation
      Caption         =   "Mitral Valve - Significant Regurgitation"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   18
      TabStop         =   True
      Tooltip         =   ""
      Top             =   460
      Value           =   False
      Visible         =   True
      Width           =   307
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkTricuspidStenosis
      Caption         =   "Tricuspid Valve - Significant Stenosis"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   19
      TabStop         =   True
      Tooltip         =   ""
      Top             =   495
      Value           =   False
      Visible         =   True
      Width           =   342
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkTricuspidRegurgitation
      Caption         =   "Tricuspid Valve - Significant Regurgitation"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   20
      TabStop         =   True
      Tooltip         =   ""
      Top             =   530
      Value           =   False
      Visible         =   True
      Width           =   342
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkPericardialEffusion
      Caption         =   "Pericardium - Significant Effusion"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   21
      TabStop         =   True
      Tooltip         =   ""
      Top             =   565
      Value           =   False
      Visible         =   True
      Width           =   342
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkIVCHighPressure
      Caption         =   "IVC - High RA Pressure"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   22
      TabStop         =   True
      Tooltip         =   ""
      Top             =   600
      Value           =   False
      Visible         =   True
      Width           =   342
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox chkRequiresFullEcho
      Caption         =   "Requires full ECHO?"
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   True
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   23
      TabStop         =   True
      Tooltip         =   ""
      Top             =   706
      Value           =   False
      Visible         =   True
      Width           =   178
      _mPanelIndex    =   -1
   End
   Begin WebTextArea txtCorrectConclusions
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   53
      Hint            =   "Correct conclusions"
      Index           =   -2147483648
      Indicator       =   0
      Left            =   388
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   24
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   655
      Visible         =   True
      Width           =   342
      _mPanelIndex    =   -1
   End
   Begin WebListBox lstVideos
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
      Height          =   235
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "File	View	Order"
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   25
      TabStop         =   True
      Tooltip         =   ""
      Top             =   112
      Visible         =   True
      Width           =   332
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblVideosTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   762
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
      TabIndex        =   26
      TabStop         =   True
      Text            =   "Videos for case"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   199
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblVideoPreview
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   27
      TabStop         =   True
      Text            =   "Video Preview"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   354
      Underline       =   False
      Visible         =   True
      Width           =   199
      _mPanelIndex    =   -1
   End
   Begin WebHTMLViewer htmlVideoPreview
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   215
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   28
      TabStop         =   True
      Tooltip         =   ""
      Top             =   389
      UseSandbox      =   False
      Visible         =   True
      Width           =   332
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblAddVideo
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   29
      TabStop         =   True
      Text            =   "Add Video"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   612
      Underline       =   False
      Visible         =   True
      Width           =   114
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtVideoFilename
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   "Filename"
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   30
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   656
      Visible         =   True
      Width           =   332
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtViewDescription
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   "Filename"
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   762
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   31
      TabStop         =   True
      Text            =   "View Description"
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   702
      Visible         =   True
      Width           =   230
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtVideoOrder
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   "Filename"
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   1000
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   32
      TabStop         =   True
      Text            =   "Order"
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   702
      Visible         =   True
      Width           =   94
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAddVideo
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add Video"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   895
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   33
      TabStop         =   True
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   139
      _mPanelIndex    =   -1
   End
   Begin WebButton btnDeleteVideo
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Delete Video"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   969
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   34
      TabStop         =   True
      Tooltip         =   ""
      Top             =   612
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
   Begin WebButton btnBack
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Back"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   407
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   35
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   125
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  LoadCases
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearCaseFields()
		  ' *******************************************************************************
		  ' ClearCaseFields Method
		  ' *******************************************************************************
		  txtSerialNumber.Text = ""
		  txtCaseLabel.Text = ""
		  chkLVSizeDilated.Value = False
		  chkLVFunctionImpaired.Value = False
		  chkRVSizeDilated.Value = False
		  chkRVFunctionImpaired.Value = False
		  chkAorticStenosis.Value = False
		  chkAorticRegurgitation.Value = False
		  chkMitralStenosis.Value = False
		  chkMitralRegurgitation.Value = False
		  chkTricuspidStenosis.Value = False
		  chkTricuspidRegurgitation.Value = False
		  chkPericardialEffusion.Value = False
		  chkIVCHighPressure.Value = False
		  txtCorrectConclusions.Text = ""
		  chkRequiresFullEcho.Value = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleDeleteCaseConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
		  Select Case button
		  Case dialog.ActionButton
		    Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
		    Var sql As String = "DELETE FROM cases WHERE case_id = ?"
		    
		    Try
		      Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.Bind(0, caseID)
		      
		      ps.ExecuteSQL
		      
		      MessageBox("Case deleted successfully!")
		      ClearCaseFields
		      LoadCases
		      lstVideos.RemoveAllRows
		      htmlVideoPreview.LoadHTML("")
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting case: " + e.Message)
		    End Try
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleDeleteVideoConfirm(dialog As WebMessageDialog, button As WebMessageDialogButton)
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
		      
		      If lstCases.SelectedRowIndex >= 0 Then
		        Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
		        LoadCaseVideos(caseID)
		      End If
		      
		      htmlVideoPreview.LoadHTML("")
		      
		    Catch e As DatabaseException
		      MessageBox("Error deleting video: " + e.Message)
		    End Try
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCaseDetails(caseID As Integer)
		  ' *******************************************************************************
		  ' LoadCaseDetails Method
		  ' *******************************************************************************
		  Var sql As String = "SELECT * FROM cases WHERE case_id = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, caseID)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      txtSerialNumber.Text = rs.Column("serial_number").StringValue
		      txtCaseLabel.Text = rs.Column("case_label").StringValue
		      
		      chkLVSizeDilated.Value = rs.Column("lv_size_dilated").BooleanValue
		      chkLVFunctionImpaired.Value = rs.Column("lv_function_impaired").BooleanValue
		      chkRVSizeDilated.Value = rs.Column("rv_size_dilated").BooleanValue
		      chkRVFunctionImpaired.Value = rs.Column("rv_function_impaired").BooleanValue
		      chkAorticStenosis.Value = rs.Column("aortic_stenosis_significant").BooleanValue
		      chkAorticRegurgitation.Value = rs.Column("aortic_regurgitation_significant").BooleanValue
		      chkMitralStenosis.Value = rs.Column("mitral_stenosis_significant").BooleanValue
		      chkMitralRegurgitation.Value = rs.Column("mitral_regurgitation_significant").BooleanValue
		      chkTricuspidStenosis.Value = rs.Column("tricuspid_stenosis_significant").BooleanValue
		      chkTricuspidRegurgitation.Value = rs.Column("tricuspid_regurgitation_significant").BooleanValue
		      chkPericardialEffusion.Value = rs.Column("pericardial_effusion_significant").BooleanValue
		      chkIVCHighPressure.Value = rs.Column("ivc_high_ra_pressure").BooleanValue
		      txtCorrectConclusions.Text = rs.Column("correct_conclusions").StringValue
		      chkRequiresFullEcho.Value = rs.Column("requires_full_echo").BooleanValue
		    End If
		  Catch e As DatabaseException
		    MessageBox("Error loading case details: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCases()
		  ' *******************************************************************************
		  ' LoadCases Method 
		  ' *******************************************************************************
		  lstCases.RemoveAllRows
		  
		  Var sql As String = "SELECT case_id, serial_number, case_label FROM cases ORDER BY serial_number"
		  
		  Try
		    Var rs As RowSet = Session.DB.SelectSQL(sql)
		    
		    While Not rs.AfterLastRow
		      lstCases.AddRow(rs.Column("serial_number").StringValue)
		      lstCases.CellTextAt(lstCases.LastAddedRowIndex, 1) = rs.Column("case_label").StringValue
		      lstCases.RowTagAt(lstCases.LastAddedRowIndex) = rs.Column("case_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		  Catch e As DatabaseException
		    MessageBox("Error loading cases: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCaseVideos(caseID As Integer)
		  ' *******************************************************************************
		  ' LoadCaseVideos Method
		  ' *******************************************************************************
		  lstVideos.RemoveAllRows
		  
		  Var sql As String = "SELECT video_id, video_filename, view_description, video_order FROM case_videos WHERE case_id = ? ORDER BY video_order"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(0, caseID)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    While Not rs.AfterLastRow
		      lstVideos.AddRow(rs.Column("video_filename").StringValue)
		      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 1) = rs.Column("view_description").StringValue
		      lstVideos.CellTextAt(lstVideos.LastAddedRowIndex, 2) = rs.Column("video_order").IntegerValue.ToString
		      lstVideos.RowTagAt(lstVideos.LastAddedRowIndex) = rs.Column("video_id").IntegerValue
		      
		      rs.MoveToNextRow
		    Wend
		  Catch e As DatabaseException
		    MessageBox("Error loading videos: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lstCases
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' *******************************************************************************
		  ' lstCases.SelectionChanged Event
		  ' *******************************************************************************
		  If Me.SelectedRowIndex < 0 Then Return
		  
		  Var caseID As Integer = Me.RowTagAt(Me.SelectedRowIndex)
		  LoadCaseDetails(caseID)
		  LoadCaseVideos(caseID)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddCase
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnAddCase.Pressed Event 
		  ' *******************************************************************************
		  If txtSerialNumber.Text.Trim = "" Or txtCaseLabel.Text.Trim = "" Then
		    MessageBox("Please enter serial number and case label")
		    Return
		  End If
		  
		  Var sql As String = "INSERT INTO cases (serial_number, case_label, lv_size_dilated, lv_function_impaired, rv_size_dilated, rv_function_impaired, aortic_stenosis_significant, aortic_regurgitation_significant, mitral_stenosis_significant, mitral_regurgitation_significant, tricuspid_stenosis_significant, tricuspid_regurgitation_significant, pericardial_effusion_significant, ivc_high_ra_pressure, correct_conclusions, requires_full_echo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, txtSerialNumber.Text.Trim)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(1, txtCaseLabel.Text.Trim)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(2, chkLVSizeDilated.Value)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(3, chkLVFunctionImpaired.Value)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(4, chkRVSizeDilated.Value)
		    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(5, chkRVFunctionImpaired.Value)
		    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(6, chkAorticStenosis.Value)
		    ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(7, chkAorticRegurgitation.Value)
		    ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(8, chkMitralStenosis.Value)
		    ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(9, chkMitralRegurgitation.Value)
		    ps.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(10, chkTricuspidStenosis.Value)
		    ps.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(11, chkTricuspidRegurgitation.Value)
		    ps.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(12, chkPericardialEffusion.Value)
		    ps.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(13, chkIVCHighPressure.Value)
		    ps.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(14, txtCorrectConclusions.Text)
		    ps.BindType(15, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(15, chkRequiresFullEcho.Value)
		    
		    ps.ExecuteSQL
		    
		    MessageBox("Case added successfully!")
		    ClearCaseFields
		    LoadCases
		    
		  Catch e As DatabaseException
		    MessageBox("Error adding case: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpdateCase
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnUpdateCase.Pressed Event
		  ' *******************************************************************************
		  If lstCases.SelectedRowIndex < 0 Then
		    MessageBox("Please select a case to update")
		    Return
		  End If
		  
		  If txtSerialNumber.Text.Trim = "" Or txtCaseLabel.Text.Trim = "" Then
		    MessageBox("Please enter serial number and case label")
		    Return
		  End If
		  
		  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
		  
		  Var sql As String = "UPDATE cases SET serial_number=?, case_label=?, lv_size_dilated=?, lv_function_impaired=?, rv_size_dilated=?, rv_function_impaired=?, aortic_stenosis_significant=?, aortic_regurgitation_significant=?, mitral_stenosis_significant=?, mitral_regurgitation_significant=?, tricuspid_stenosis_significant=?, tricuspid_regurgitation_significant=?, pericardial_effusion_significant=?, ivc_high_ra_pressure=?, correct_conclusions=?, requires_full_echo=? WHERE case_id=?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, txtSerialNumber.Text.Trim)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(1, txtCaseLabel.Text.Trim)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(2, chkLVSizeDilated.Value)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(3, chkLVFunctionImpaired.Value)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(4, chkRVSizeDilated.Value)
		    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(5, chkRVFunctionImpaired.Value)
		    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(6, chkAorticStenosis.Value)
		    ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(7, chkAorticRegurgitation.Value)
		    ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(8, chkMitralStenosis.Value)
		    ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(9, chkMitralRegurgitation.Value)
		    ps.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(10, chkTricuspidStenosis.Value)
		    ps.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(11, chkTricuspidRegurgitation.Value)
		    ps.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(12, chkPericardialEffusion.Value)
		    ps.BindType(13, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(13, chkIVCHighPressure.Value)
		    ps.BindType(14, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(14, txtCorrectConclusions.Text)
		    ps.BindType(15, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.Bind(15, chkRequiresFullEcho.Value)
		    ps.BindType(16, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.Bind(16, caseID)
		    
		    ps.SQLExecute
		    
		    MessageBox("Case updated successfully!")
		    LoadCases
		    
		  Catch e As DatabaseException
		    MessageBox("Error updating case: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteCase
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnDeleteCase.Pressed Event:
		  ' *******************************************************************************
		  If lstCases.SelectedRowIndex < 0 Then
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
	#tag EndEvent
#tag EndEvents
#tag Events lstVideos
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  ' *******************************************************************************
		  ' lstVideos.SelectionChanged Event
		  ' *******************************************************************************
		  If Me.SelectedRowIndex < 0 Then
		    htmlVideoPreview.LoadHTML("")
		    Return
		  End If
		  
		  Var videoFilename As String = Me.CellTextAt(Me.SelectedRowIndex, 0)
		  Var videoPath As String = "../Documents/CaseVideos/" + videoFilename
		  
		  Var html As String = "<!DOCTYPE html><html><head><meta charset='UTF-8'><style>"
		  html = html + "body{margin:0;padding:10px;background:#1a1a1a;display:flex;justify-content:center;align-items:center;min-height:100%;}"
		  html = html + ".video-container{width:100%;max-width:600px;background:#000;border-radius:8px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.5);}"
		  html = html + "video{width:100%;height:auto;display:block;background:#000;}"
		  html = html + "</style></head><body><div class='video-container'>"
		  html = html + "<video controls loop autoplay playsinline>"
		  html = html + "<source src='" + videoPath + "' type='video/mp4'>"
		  html = html + "Your browser does not support the video tag.</video></div>"
		  html = html + "<script>var v=document.querySelector('video');"
		  html = html + "v.addEventListener('ended',function(){this.currentTime=0;this.play();});</script>"
		  html = html + "</body></html>"
		  
		  htmlVideoPreview.LoadHTML(html)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddVideo
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnAddVideo.Pressed Event
		  ' *******************************************************************************
		  If lstCases.SelectedRowIndex < 0 Then
		    MessageBox("Please select a case first")
		    Return
		  End If
		  
		  If txtVideoFilename.Text.Trim = "" Then
		    MessageBox("Please enter video filename")
		    Return
		  End If
		  
		  Var caseID As Integer = lstCases.RowTagAt(lstCases.SelectedRowIndex)
		  
		  Var videoOrder As Integer
		  If txtVideoOrder.Text.Trim = "" Then
		    Var orderSQL As String = "SELECT COALESCE(MAX(video_order), -1) + 1 AS next_order FROM case_videos WHERE case_id = ?"
		    
		    Try
		      Var orderPS As MySQLPreparedStatement = Session.DB.Prepare(orderSQL)
		      orderPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      orderPS.Bind(0, caseID)
		      
		      Var orderRS As RowSet = orderPS.SelectSQL
		      If orderRS <> Nil And Not orderRS.AfterLastRow Then
		        videoOrder = orderRS.Column("next_order").IntegerValue
		      Else
		        videoOrder = 0
		      End If
		    Catch e As DatabaseException
		      MessageBox("Error getting video order: " + e.Message)
		      Return
		    End Try
		  Else
		    videoOrder = Val(txtVideoOrder.Text.Trim)
		  End If
		  
		  Var sql As String = "INSERT INTO case_videos (case_id, video_filename, view_description, video_order) VALUES (?, ?, ?, ?)"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    
		    ps.Bind(0, caseID)
		    ps.Bind(1, txtVideoFilename.Text.Trim)
		    ps.Bind(2, txtViewDescription.Text.Trim)
		    ps.Bind(3, videoOrder)
		    
		    ps.ExecuteSQL
		    
		    MessageBox("Video added successfully!")
		    txtVideoFilename.Text = ""
		    txtViewDescription.Text = ""
		    txtVideoOrder.Text = ""
		    LoadCaseVideos(caseID)
		    
		  Catch e As DatabaseException
		    MessageBox("Error adding video: " + e.Message)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteVideo
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnDeleteVideo.Pressed Event
		  ' *******************************************************************************
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
	#tag EndEvent
#tag EndEvents
#tag Events btnBack
	#tag Event
		Sub Pressed()
		  Session.Navigation.NavigateBack
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
#tag EndViewBehavior
