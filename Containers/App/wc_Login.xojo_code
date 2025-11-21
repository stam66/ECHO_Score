#tag WebContainerControl
Begin wc_base wc_Login
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
   Width           =   780
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebRectangle Rectangle2
      BorderColor     =   &c42424200
      BorderThickness =   1
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   False
      FillColor       =   &cFFFFFF
      HasFillColor    =   False
      Height          =   506
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Parent          =   "nil"
      Scope           =   0
      TabIndex        =   2
      TabStop         =   False
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   780
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblTitle
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   False
      FontName        =   "arial"
      FontSize        =   24.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Text            =   "Log into the application"
      TextAlignment   =   2
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   306
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblUsername
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   False
      FontName        =   "arial"
      FontSize        =   14.0
      Height          =   28
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Text            =   "Username"
      TextAlignment   =   1
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   129
      Underline       =   False
      Visible         =   True
      Width           =   300
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtUsername
      AllowAutoComplete=   True
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
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   165
      Visible         =   True
      Width           =   300
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblError
      Bold            =   False
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   62
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   True
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   8
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &cFF260000
      Tooltip         =   ""
      Top             =   355
      Underline       =   False
      Visible         =   True
      Width           =   306
      _mPanelIndex    =   -1
   End
   Begin WebLabel lblForgotPassword
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
      Left            =   609
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabStop         =   True
      Text            =   "Reset password"
      TextAlignment   =   3
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   309
      Underline       =   False
      Visible         =   True
      Width           =   126
      _mPanelIndex    =   -1
   End
   Begin WebRectangle rectBackground
      BorderColor     =   &c42424200
      BorderThickness =   1
      ControlCount    =   0
      ControlID       =   ""
      CornerSize      =   0
      CSSClasses      =   ""
      Enabled         =   True
      FillColor       =   &c005EB800
      HasFillColor    =   True
      Height          =   506
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   "LayoutDirections.LeftToRight"
      LayoutType      =   "LayoutTypes.Fixed"
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   390
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebImageViewer imgAppIcon1
         ControlID       =   ""
         CSSClasses      =   ""
         DisplayMode     =   2
         Enabled         =   True
         Height          =   275
         Image           =   0
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rectBackground"
         Left            =   43
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         PanelIndex      =   0
         Parent          =   "rectBackground"
         Scope           =   0
         SVGData         =   "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""no""?>\n<!DOCTYPE svg PUBLIC ""-//W3C//DTD SVG 1.1//EN"" ""http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"">\n<svg width=""100%"" height=""100%"" viewBox=""0 0 907 822"" version=""1.1"" xmlns=""http://www.w3.org/2000/svg"" xmlns:xlink=""http://www.w3.org/1999/xlink"" xml:space=""preserve"" xmlns:serif=""http://www.serif.com/"" style=""fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;"">\n    <g transform=""matrix(1,0,0,1,-75.2805,-149.094)"">\n        <g transform=""matrix(0.230216,0.119843,-0.131152,0.246928,841.007,199.575)"">\n            <path d=""M877.234,889.907L877.234,899.415C806.35,971.809 707.545,1016.76 598.324,1016.76C490.462,1016.76 392.759,972.921 322.074,902.106L322.074,892.582C309.633,885.332 301.365,872.548 301.365,858L301.365,811.681C301.365,789.111 321.264,770.787 345.774,770.787L362.64,770.787C360.997,765.445 360.102,759.916 360.035,754.254L355.897,406.035C355.357,360.622 408.265,323.752 473.973,323.752L712.081,323.752C774.703,323.752 826.495,357.24 831.689,399.695L835.978,760.593C835.637,764.055 834.984,767.457 834.039,770.787L849.467,770.787C873.977,770.787 893.876,789.111 893.876,811.681L893.876,858C893.876,870.898 887.378,882.409 877.234,889.907Z"" style=""fill:white;""/>\n        </g>\n        <g transform=""matrix(1.54263,0,0,1.54263,-294.914,-278.119)"">\n            <g transform=""matrix(1.11056,0,0,1.15593,-0.223517,-161.833)"">\n                <g id=""path3925-8"" transform=""matrix(2.35666,0,0,2.35666,-224.819,-3647.89)"">\n                    <clipPath id=""_clip1"">\n                        <rect x=""168.838"" y=""1703.29"" width=""150.672"" height=""216.715""/>\n                    </clipPath>\n                    <g clip-path=""url(#_clip1)"">\n                        <path d=""M243.452,1708.98C265.504,1708.79 285.985,1721.68 296.038,1741C300.696,1732.06 307.744,1724.48 315.97,1718.69C338.58,1702.77 372.09,1707.23 390.34,1727.94C409.981,1750.24 408.053,1785.54 390.878,1808.35C373.082,1831.98 348.995,1849.48 327.262,1869.35C321.273,1874.83 315.464,1880.49 310.013,1886.51C305.064,1891.97 300.177,1899.35 295.786,1904.03C289.651,1894.99 282.639,1886.77 275.124,1879.02C255.421,1858.69 232.257,1841.62 212.339,1821.49C195.7,1804.67 185.257,1781.12 188.371,1757.27C191.872,1730.45 216.518,1709.21 243.452,1708.98ZM243.548,1719.26C221.701,1719.44 201.826,1736.8 198.986,1758.55C196.274,1779.32 205.6,1799.76 220.093,1814.4C240.035,1834.56 263.225,1851.66 282.952,1872.01C287.557,1876.76 291.979,1881.68 296.146,1886.84C298.05,1884.37 299.991,1881.91 301.943,1879.76C307.614,1873.5 313.655,1867.61 319.885,1861.91C341.145,1842.47 364.802,1825.44 382.21,1802.33C396.68,1783.11 398.721,1753.37 382.174,1734.59C367.475,1717.9 340.505,1714.16 322.294,1726.98C315.419,1731.82 309.498,1738.13 305.605,1745.6C303.792,1749.09 300.087,1751.28 296.035,1751.28C291.984,1751.28 288.28,1749.08 286.469,1745.6C278.245,1729.8 261.587,1719.1 243.548,1719.26Z"" style=""fill:white;fill-opacity:0.98;""/>\n                    </g>\n                </g>\n                <g id=""path3925-81"" serif:id=""path3925-8"" transform=""matrix(2.35666,0,0,2.35666,-226.347,-3646.71)"">\n                    <clipPath id=""_clip2"">\n                        <rect x=""303.792"" y=""1703.97"" width=""132.876"" height=""85.728""/>\n                    </clipPath>\n                    <g clip-path=""url(#_clip2)"">\n                        <path d=""M243.452,1708.98C265.504,1708.79 285.985,1721.68 296.038,1741C300.696,1732.06 307.744,1724.48 315.97,1718.69C338.58,1702.77 372.09,1707.23 390.34,1727.94C400.533,1739.51 404.917,1754.59 404.375,1769.6C403.873,1783.52 399.14,1797.38 390.878,1808.35C389.926,1809.62 388.956,1810.86 387.969,1812.09C370.511,1833.86 347.832,1850.54 327.262,1869.35C321.273,1874.83 315.464,1880.49 310.013,1886.51C305.064,1891.97 300.177,1899.35 295.786,1904.03C289.651,1894.99 282.639,1886.77 275.124,1879.02C255.421,1858.69 232.257,1841.62 212.339,1821.49C195.7,1804.67 185.257,1781.12 188.371,1757.27C191.872,1730.45 216.518,1709.21 243.452,1708.98ZM243.548,1719.26C221.701,1719.44 201.826,1736.8 198.986,1758.55C196.274,1779.32 205.6,1799.76 220.093,1814.4C240.035,1834.56 263.225,1851.66 282.952,1872.01C287.557,1876.76 291.979,1881.68 296.146,1886.84C298.05,1884.37 299.991,1881.91 301.943,1879.76C307.614,1873.5 313.655,1867.61 319.885,1861.91C340.06,1843.46 362.373,1827.17 379.494,1805.82C380.416,1804.67 381.321,1803.51 382.21,1802.33C389.26,1792.96 393.255,1781.12 393.683,1769.25C394.134,1756.77 390.644,1744.2 382.174,1734.59C367.475,1717.9 340.505,1714.16 322.294,1726.98C315.419,1731.82 309.498,1738.13 305.605,1745.6C303.792,1749.09 300.087,1751.28 296.035,1751.28C291.984,1751.28 288.28,1749.08 286.469,1745.6C278.245,1729.8 261.587,1719.1 243.548,1719.26Z"" style=""fill:white;fill-opacity:0.98;""/>\n                    </g>\n                </g>\n            </g>\n            <g transform=""matrix(0.886855,0.462048,-0.462048,0.886855,561.547,-91.4014)"">\n                <g transform=""matrix(0.176363,-3.82509e-17,-0.00189359,0.22874,334.733,263.077)"">\n                    <path d=""M828.986,941.274C764.344,988.723 684.582,1016.76 598.324,1016.76C509.727,1016.76 427.983,987.182 362.437,937.372"" style=""fill:none;stroke:white;stroke-width:63.73px;""/>\n                </g>\n                <g transform=""matrix(0.442329,5.55112e-17,-0.00363284,0.438837,177.486,222.105)"">\n                    <path d=""M898.7,875.625C844.194,941.22 768.629,988.705 682.421,1007.66C655.332,1013.62 627.192,1016.76 598.324,1016.76C581.482,1016.76 564.887,1015.69 548.605,1013.62C445.793,1000.52 355.415,947.378 293.629,870.335"" style=""fill:none;stroke:white;stroke-width:29.55px;""/>\n                </g>\n                <g transform=""matrix(0.379775,2.77556e-17,-0.00311909,0.376777,215.054,239.455)"">\n                    <path d=""M880.108,896.448C809.034,970.579 709.029,1016.76 598.324,1016.76C483.498,1016.76 380.184,967.077 308.724,888.055"" style=""fill:none;stroke:white;stroke-width:34.42px;""/>\n                </g>\n                <g transform=""matrix(0.323373,0,-0.00265586,0.32082,247.117,251.112)"">\n                    <path d=""M866.417,910.044C796.465,976.183 702.095,1016.76 598.324,1016.76C494.039,1016.76 399.249,975.78 329.194,909.06"" style=""fill:none;stroke:white;stroke-width:40.42px;""/>\n                </g>\n                <g transform=""matrix(0.230001,0,-0.001889,0.228185,302.238,304.145)"">\n                    <path d=""M866.417,910.044C796.465,976.183 702.095,1016.76 598.324,1016.76C494.039,1016.76 399.249,975.78 329.194,909.06"" style=""fill:none;stroke:white;stroke-width:56.83px;""/>\n                </g>\n            </g>\n        </g>\n    </g>\n</svg>\n"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   43
         URL             =   ""
         Visible         =   True
         Width           =   305
         _mPanelIndex    =   -1
         _ProtectImage   =   False
      End
      Begin WebLabel lblAppVersion
         Bold            =   True
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   False
         FontName        =   "arial"
         FontSize        =   24.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rectBackground"
         Italic          =   False
         Left            =   42
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   True
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rectBackground"
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "ECHOscore v1.0.1"
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   320
         Underline       =   False
         Visible         =   True
         Width           =   306
         _mPanelIndex    =   -1
      End
      Begin WebButton btnRequestAccess
         AllowAutoDisable=   False
         Cancel          =   False
         Caption         =   "Request access"
         ControlID       =   ""
         CSSClasses      =   ""
         Default         =   False
         Enabled         =   True
         Height          =   38
         Index           =   -2147483648
         Indicator       =   7
         InitialParent   =   "rectBackground"
         Left            =   107
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   True
         Outlined        =   False
         PanelIndex      =   0
         Parent          =   "rectBackground"
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   448
         Visible         =   True
         Width           =   175
         _mPanelIndex    =   -1
      End
      Begin WebLabel lblDescription
         Bold            =   False
         ControlID       =   ""
         CSSClasses      =   ""
         Enabled         =   False
         FontName        =   "arial"
         FontSize        =   15.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "rectBackground"
         Italic          =   False
         Left            =   42
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   True
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         LockVertical    =   True
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "rectBackground"
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "ECHO assessment platform"
         TextAlignment   =   2
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   345
         Underline       =   False
         Visible         =   True
         Width           =   306
         _mPanelIndex    =   -1
      End
   End
   Begin WebLabel lblPassword
      Bold            =   True
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   False
      FontName        =   "arial"
      FontSize        =   14.0
      Height          =   28
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Parent          =   "nil"
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Password"
      TextAlignment   =   1
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   239
      Underline       =   False
      Visible         =   True
      Width           =   300
      _mPanelIndex    =   -1
   End
   Begin WebTextField txtPassword
      AllowAutoComplete=   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      FieldType       =   1
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   435
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      MaximumCharactersAllowed=   0
      PanelIndex      =   0
      Parent          =   "nil"
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   275
      Visible         =   True
      Width           =   300
      _mPanelIndex    =   -1
   End
   Begin WebButton btnLogin
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Log in"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   503
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Outlined        =   False
      PanelIndex      =   0
      Parent          =   "nil"
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   448
      Visible         =   True
      Width           =   175
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  ' *******************************************************************************
		  ' wc_Login.Opening event
		  ' *******************************************************************************
		  ResetUI
		  lblAppVersion.Text = "ECHOscore " + GetAppVersion(AppVersionType.Short)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ResetUI
		  
		  session.CurrentUserID = 0
		  session.CurrentUserName = ""
		  session.CurrentUserEmail = ""
		  session.IsAdmin = False
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PerformLogin()
		  ' *******************************************************************************
		  ' Shared authentication logic
		  ' *******************************************************************************
		  If txtUsername.Text.Trim = "" Or txtPassword.Text.Trim = "" Then
		    lblError.Text = "Please enter username and password"
		    lblError.Visible = True
		    Return
		  End If
		  
		  Var sql As String = "SELECT user_id, full_name, email, is_admin FROM users WHERE username = ? AND password_hash = SHA2(?, 256) AND is_active = 1"
		  
		  Try
		    Var ps As MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    
		    ps.Bind(0, txtUsername.Text.Trim)
		    ps.Bind(1, txtPassword.Text.Trim)
		    
		    Var rs As RowSet = ps.SelectSQL
		    
		    If rs <> Nil And Not rs.AfterLastRow Then
		      ' Store user session data
		      Session.CurrentUserID = rs.Column("user_id").IntegerValue
		      Session.CurrentUserName = rs.Column("full_name").StringValue
		      Session.CurrentUserEmail = rs.Column("email").StringValue
		      Session.IsAdmin = rs.Column("is_admin").BooleanValue
		      
		      ' Update last login timestamp
		      Var updateSQL As String = "UPDATE users SET last_login = NOW() WHERE user_id = ?"
		      Var updatePS As MySQLPreparedStatement = Session.DB.Prepare(updateSQL)
		      updatePS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      updatePS.Bind(0, Session.CurrentUserID)
		      updatePS.ExecuteSQL
		      
		      ' Navigate based on user role
		      If Session.IsAdmin Then
		        Var adminHome As New wc_AdminHome
		        adminHome.ContainerID = "AdminHome"
		        adminHome.Position = wc_Base.PositionEnum.Center
		        Session.Navigation.NavigateTo(adminHome)
		      Else
		        Var userHome As New wc_UserHome
		        userHome.ContainerID = "UserHome"
		        userHome.Position = wc_Base.PositionEnum.Center
		        Session.Navigation.NavigateTo(userHome)
		      End If
		    Else
		      lblError.Text = "Invalid username or password"
		      lblError.Visible = True
		    End If
		    
		  Catch e As DatabaseException
		    lblError.Text = "Database error: " + e.Message
		    lblError.Visible = True
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetUI()
		  lblError.Text = ""
		  lblError.Visible = False
		  lblForgotPassword.TextColor = &c3498db
		  lblForgotPassword.Underline = True
		  txtUsername.Text = ""
		  txtPassword.Text = ""
		  
		  // update shell page
		  Self.EnableBackButton = False
		  Self.EnableLogoutButton = False
		  Self.SectionTitle = "Login Page"
		  UpdateNavigation // update shell page data
		  
		  txtUsername.SetFocus
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lblForgotPassword
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' lblForgotPassword.MouseDown Event:
		  ' *******************************************************************************
		  Var forgotPassword As New wc_ForgotPassword
		  forgotPassword.ContainerID = "ForgotPassword"
		  forgotPassword.Position = wc_Base.PositionEnum.Center
		  Session.Navigation.NavigateTo(forgotPassword)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRequestAccess
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnRequestAccess.Pressed Event:
		  ' *******************************************************************************
		  var wc as new wc_RequestAccess
		  session.Navigation.NavigateTo(wc)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtPassword
	#tag Event
		Sub Opening()
		  Var js As String = _
		  "this.addEventListener('keypress', function(e) {" + _
		  "  if (e.key === 'Enter' || e.keyCode === 13) {" + _
		  "    e.preventDefault();" + _
		  "    document.getElementById('" + btnLogin.ControlID + "').click();" + _
		  "  }" + _
		  "});"
		  
		  Me.ExecuteJavaScript(js)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnLogin
	#tag Event
		Sub Pressed()
		  ' *******************************************************************************
		  ' btnLogin.Pressed Event:
		  ' *******************************************************************************
		  ' Force input sync then authenticate
		  Me.ExecuteJavaScript("document.getElementById('" + txtUsername.ControlID + "').dispatchEvent(new Event('input', { bubbles: true }));" + _
		  "document.getElementById('" + txtPassword.ControlID + "').dispatchEvent(new Event('input', { bubbles: true }));")
		  
		  WebTimer.CallLater(50, AddressOf PerformLogin)
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
