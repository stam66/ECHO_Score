#tag WebContainerControl
Begin wc_base wc_ForgotPassword
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   506
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
   Width           =   446
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   "arial"
      FontSize        =   24.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
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
      Scope           =   0
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Forgot password"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   406
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblEmail
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   "arial"
      FontSize        =   14.0
      Height          =   28
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
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Email"
      TextAlignment   =   1
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   162
      Underline       =   False
      Visible         =   True
      Width           =   406
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtEmail
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
      TabIndex        =   3
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   198
      Visible         =   True
      Width           =   406
      _mPanelIndex    =   -1
   End
   Begin WebButton btnBackToLogin
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Back to login"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   126
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   448
      Visible         =   True
      Width           =   146
      _mPanelIndex    =   -1
   End
   Begin WebButton btnSendCode
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Send code"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   280
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   6
      TabStop         =   True
      Tooltip         =   ""
      Top             =   448
      Visible         =   True
      Width           =   146
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblMessage
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
      TabIndex        =   9
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   276
      Underline       =   False
      Visible         =   True
      Width           =   406
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblInstructions
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   55
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   10
      TabStop         =   True
      Text            =   "Enter your email address to receive a password reset code"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   66
      Underline       =   False
      Visible         =   True
      Width           =   446
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_ForgotPassword.Opening event
		  ' *******************************************************************************
		  lblMessage.Text = ""
		  lblMessage.Visible = False
		  
		  Self.EnableBackButton = False
		  Self.EnableLogoutButton = False
		  Self.SectionTitle = "Forgot Password"
		  
		  UpdateNavigation // update shell page data
		  
		  txtEmail.SetFocus
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub NavigateToOTPEntry()
		  
		  
		  Var otpEntry As New wc_EnterOTP
		  otpEntry.ContainerID = "EnterOTP"
		  otpEntry.Position = wc_Base.PositionEnum.Center
		  otpEntry.UserEmail = txtEmail.Text.Trim
		  Session.Navigation.NavigateTo(otpEntry)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMessage(msg As String, isSuccess As Boolean)
		  lblMessage.Text = msg
		  lblMessage.TextColor = If(isSuccess, &c27ae60, &ce74c3c)
		  lblMessage.Visible = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValidateEmail(email As String) As Boolean
		  // Basic email validation
		  If email.IndexOf("@") < 1 Then Return False
		  If email.IndexOf(".") < 3 Then Return False
		  If email.Length < 5 Then Return False
		  Return True
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events btnBackToLogin
	#tag Event
		Sub Pressed()
		  Session.Navigation.NavigateBack
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSendCode
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnSendCode.Pressed Event
		  ' *******************************************************************************   
		  If txtEmail.Text.Trim = "" Then
		    ShowMessage("Please enter your email address", False)
		    Return
		  End If
		  
		  If Not ValidateEmail(txtEmail.Text.Trim) Then
		    ShowMessage("Please enter a valid email address", False)
		    Return
		  End If
		  
		  Var sql As String = "SELECT user_id, full_name, email FROM users WHERE email = ?"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, txtEmail.Text.Trim)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs = Nil Or rs.AfterLastRow Then
		      ShowMessage("If this email is registered, you will receive a password reset code shortly.", True)
		      Return
		    End If
		    
		    Var userID As Integer = rs.Column("user_id").IntegerValue
		    Var userName As String = rs.Column("full_name").StringValue
		    Var userEmail As String = rs.Column("email").StringValue
		    
		    Var ipAddress As String = "unknown"
		    
		    Var tokenResult As Dictionary = PasswordResetHelper.CreatePasswordResetToken(userID, ipAddress)
		    
		    If Not tokenResult.Value("success") Then
		      ShowMessage("An error occurred. Please try again later.", False)
		      Return
		    End If
		    
		    Var otp As String = tokenResult.Value("otp")
		    Var token As String = tokenResult.Value("token")
		    
		    Var resetLink As String = "https://your-domain.com/reset/" + token
		    
		    If EmailHelper.SendPasswordResetEmail(userEmail, userName, otp, resetLink) Then
		      ShowMessage("A password reset code has been sent to your email.", True)
		      
		      // Use WebTimer.CallLater for delayed navigation
		      WebTimer.CallLater(2000, AddressOf NavigateToOTPEntry)
		      
		    Else
		      ShowMessage("Failed to send email. Please try again later.", False)
		    End If
		    
		  Catch e As DatabaseException
		    ShowMessage("An error occurred: " + e.Message, False)
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="SectionTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="ContainerID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="Position"
		Visible=true
		Group="Subclassed Props"
		InitialValue="TopLeft"
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
