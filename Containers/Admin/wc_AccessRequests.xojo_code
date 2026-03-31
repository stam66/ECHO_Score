#tag WebContainerControl
Begin wc_base wc_AccessRequests
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   CSSClasses      =   ""
   Enabled         =   True
   Height          =   622
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
   Width           =   902
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox lstAccessReqeusts
      AllowRowReordering=   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      ControlID       =   ""
      CSSClasses      =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   541
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Name	Email	Status	Timestamp"
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
      NoRowsMessage   =   "No access requests for selected category."
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0d6efd
      SelectedRowIndex=   0
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   81
      Visible         =   True
      Width           =   902
      _mPanelIndex    =   -1
   End
   Begin WebSegmentedButton segRequestFilter
      ControlID       =   ""
      CSSClasses      =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      LastSegmentIndex=   0
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   True
      PanelIndex      =   0
      Scope           =   2
      SegmentCount    =   0
      Segments        =   "Pending\n\nTrue\rApproved\n\nFalse\rRejected\n\nFalse\rAll\n\nFalse"
      SelectedSegmentIndex=   0
      SelectionStyle  =   1
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   429
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
      Text            =   "Access Requests"
      TextAlignment   =   0
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   141
      _mPanelIndex    =   -1
   End
   Begin WebButton btnAccept
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Accept"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   3
      Left            =   674
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
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnReject
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Reject"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   5
      Left            =   782
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
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton btnPend
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Pend"
      ControlID       =   ""
      CSSClasses      =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   566
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
      TabIndex        =   5
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Self.EnableBackButton = True
		  Self.EnableLogoutButton = True
		  Self.SectionTitle = "Access Requests"
		  
		  UpdateNavigation // update shell page data
		  
		  var v as variant = nil
		  PopulateAccessRequests(v)
		  
		  btnAccept.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		  btnReject.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		  btnPend.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CreateUserFromRequest(name as String, email as String) As String
		  // Create a new user from an access request
		  // Username format: First letter of first name (uppercase) + Last name (title case)
		  // Example: "Stam Kapetanakis" → "SKapetanakis"
		  // Duplicates: "SKapetanakis1", "SKapetanakis2", etc.
		  // An OTP will be generated and emailed so the user can set their own password
		  // Returns empty string on success, or an error message on failure

		  // Parse the name to generate username
		  var username as String = GenerateUsername(name)
		  var placeholderPassword as String = EmailHelper.GenerateSecureToken // random, never seen by user

		  // Make sure username is unique
		  var checkSQL as String = "SELECT user_id FROM users WHERE username = ?"
		  var counter as Integer = 1
		  var finalUsername as String = username

		  Try
		    var checkPS as MySQLPreparedStatement = Session.DB.Prepare(checkSQL)
		    checkPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)

		    // Keep trying until we find a unique username
		    while true
		      checkPS.Bind(0, finalUsername)
		      var checkRS as RowSet = checkPS.SelectSQL

		      if checkRS = nil or checkRS.AfterLastRow then
		        exit // Username is unique
		      end if

		      finalUsername = username + Str(counter)
		      counter = counter + 1
		    wend

		  Catch e as DatabaseException
		    return "Error checking username uniqueness: " + e.Message
		  End Try

		  // Insert the new user
		  var sql as String = "INSERT INTO users (full_name, email, username, password_hash, is_admin, is_active, user_group) VALUES (?, ?, ?, SHA2(?, 256), ?, ?, ?)"

		  Try
		    var ps as MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_TINY)
		    ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_STRING)

		    ps.Bind(0, name)
		    ps.Bind(1, email)
		    ps.Bind(2, finalUsername)
		    ps.Bind(3, placeholderPassword)
		    ps.Bind(4, False) // Not admin by default
		    ps.Bind(5, True)  // Active by default
		    ps.Bind(6, "")    // No group by default

		    ps.ExecuteSQL

		    // Get the new user's ID — use SELECT LAST_INSERT_ID() for reliability
		    // with prepared statements (LastInsertRowID is unreliable after ps.ExecuteSQL in Xojo)
		    var newUserID as Integer = 0
		    Var idRS As RowSet = Session.DB.SelectSQL("SELECT LAST_INSERT_ID() AS last_id")
		    If idRS <> Nil And Not idRS.AfterLastRow Then
		      newUserID = idRS.Column("last_id").IntegerValue
		    End If
		    If newUserID = 0 Then
		      return "Failed to retrieve new user ID after insert"
		    End If

		    // Generate OTP for account setup
		    var tokenResult as Dictionary = PasswordResetHelper.CreatePasswordResetToken(newUserID, "")

		    if not tokenResult.Value("success") then
		      return "Error generating account setup token: " + tokenResult.Value("error").StringValue
		    end if

		    var otp as String = tokenResult.Value("otp").StringValue

		    // Send new account email with OTP so user can set their own password
		    Call EmailHelper.SendNewAccountEmail(email, name, finalUsername, otp)

		    return "" // empty string = success

		  Catch e as DatabaseException
		    return e.Message
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DeleteUser(email as String) As Boolean
		  // Delete a user by email (only if not admin)
		  var sql as String = "DELETE FROM users WHERE email = ? AND is_admin = 0"
		  
		  Try
		    var ps as MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, email)
		    
		    ps.ExecuteSQL
		    
		    return True
		    
		  Catch e as DatabaseException
		    System.DebugLog("Error deleting user: " + e.Message)
		    return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FilterBySegment(selectedSegment as integer)
		  var v as variant
		  Select case selectedSegment
		  case 0
		    // show pending only
		    v = nil
		  case 1
		    // show accepted only
		    v = 1
		  case 2
		    // show rejected only
		    v = 0
		  case 3
		    // show all
		    v = 2
		  end Select
		  
		  PopulateAccessRequests(v)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateUsername(fullName as String) As String
		  // Generate username from full name
		  // Format: First letter of first name (uppercase) + Last name (title case)
		  // Example: "Stam Kapetanakis" → "SKapetanakis"
		  //          "John Smith" → "JSmith"
		  //          "Mary Jane Watson" → "MWatson" (uses first and LAST word)
		  
		  var trimmedName as String = fullName.Trim
		  
		  // Handle empty or invalid names
		  if trimmedName = "" then
		    return "User"
		  end if
		  
		  // Split name into words
		  var words() as String = trimmedName.Split(" ")
		  
		  // Remove empty strings from array
		  var cleanWords() as String
		  for each word as String in words
		    if word.Trim <> "" then
		      cleanWords.Add(word.Trim)
		    end if
		  next
		  
		  // Handle single word names
		  if cleanWords.Count = 0 then
		    return "User"
		  elseif cleanWords.Count = 1 then
		    // Single word: just capitalize first letter
		    var singleWord as String = cleanWords(0)
		    return singleWord.Left(1).Uppercase + singleWord.Middle(1).Lowercase
		  end if
		  
		  // Get first letter of first word (uppercase)
		  var firstInitial as String = cleanWords(0).Left(1).Uppercase
		  
		  // Get last word (last name)
		  var lastName as String = cleanWords(cleanWords.Count - 1)
		  
		  // Title case the last name (first letter uppercase, rest lowercase)
		  var titleCaseLastName as String = lastName.Left(1).Uppercase + lastName.Middle(1).Lowercase
		  
		  // Combine: First initial + Last name
		  var username as String = firstInitial + titleCaseLastName
		  
		  return username
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsUserAdmin(email as String) As Boolean
		  // Check if a user is an admin
		  var sql as String = "SELECT is_admin FROM users WHERE email = ?"
		  
		  Try
		    var ps as MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, email)
		    
		    var rs as RowSet = ps.SelectSQL
		    
		    if rs <> nil and not rs.AfterLastRow then
		      return rs.Column("is_admin").BooleanValue
		    end if
		    
		    return False
		    
		  Catch e as DatabaseException
		    System.DebugLog("Error checking admin status: " + e.Message)
		    return False
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PopulateAccessRequests(statusFilter as variant)
		  lstAccessReqeusts.RemoveAllRows
		  
		  var sql as string
		  if statusFilter = nil then // pending
		    sql = "SELECT * FROM access_requests where request_status IS NULL ORDER BY requested_at DESC"
		  elseif statusFilter = 1 then  // accepted
		    sql = "SELECT * FROM access_requests where request_status = 1 ORDER BY requested_at DESC"
		  elseif statusFilter = 0 then // rejected
		    sql = "SELECT * FROM access_requests where request_status = 0 ORDER BY requested_at DESC"
		  elseif statusFilter = 2 then // all
		    sql = "SELECT * FROM access_requests ORDER BY requested_at DESC"
		  end 
		  
		  
		  var rs as rowset = session.DB.SelectSQL(sql)
		  
		  while not rs.AfterLastRow
		    lstAccessReqeusts.AddRow(rs.Column("name").StringValue)
		    var row as Integer = lstAccessReqeusts.LastAddedRowIndex
		    lstAccessReqeusts.CellTextAt(row, 1) = rs.Column("email").StringValue
		    
		    if rs.Column("request_status").Value = nil then
		      lstAccessReqeusts.CellTextAt(row, 2) = "Pending"
		    elseif rs.Column("request_status").IntegerValue = 1 then
		      lstAccessReqeusts.CellTextAt(row, 2) = "Approved"
		    elseif rs.Column("request_status").IntegerValue = 0 then
		      lstAccessReqeusts.CellTextAt(row, 2) = "Rejected"
		    end if
		    
		    lstAccessReqeusts.CellTextAt(row, 3) = rs.Column("requested_at").StringValue
		    lstAccessReqeusts.RowTagAt(row) = rs.Column("request_id").IntegerValue
		    
		    rs.MoveToNextRow
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetStatus(status as Variant)
		  // status options:  nil  = pending, 1 = accepted, 0 = rejected
		  
		  if lstAccessReqeusts.SelectedRowIndex = -1 then return
		  
		  var row as integer = lstAccessReqeusts.SelectedRowIndex
		  var requestID as integer = lstAccessReqeusts.RowTagAt(row)
		  
		  // Get the request details before updating
		  var getRequestSQL as String = "SELECT * FROM access_requests WHERE request_id = ?"
		  var requestName as String
		  var requestEmail as String
		  var previousStatus as Variant
		  
		  Try
		    var getPS as MySQLPreparedStatement = Session.DB.Prepare(getRequestSQL)
		    getPS.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		    getPS.Bind(0, requestID)
		    
		    var requestRS as RowSet = getPS.SelectSQL
		    
		    if requestRS <> nil and not requestRS.AfterLastRow then
		      requestName = requestRS.Column("name").StringValue
		      requestEmail = requestRS.Column("email").StringValue
		      previousStatus = requestRS.Column("request_status").Value
		    else
		      return
		    end if
		    
		  Catch e as DatabaseException
		    MessageBox("Error retrieving request details: " + e.Message)
		    return
		  End Try
		  
		  // Handle status transitions
		  if status = 1 then
		    // APPROVING - Create user if it doesn't exist
		    if not UserExists(requestEmail) then
		      var createError as String = CreateUserFromRequest(requestName, requestEmail)
		      if createError = "" then
		        System.DebugLog("User created successfully for: " + requestEmail)
		      else
		        MessageBox("Failed to create user: " + createError)
		        return
		      end if
		    end if
		    
		  elseif (previousStatus = 1) and (status = nil or status = 0) then
		    // CHANGING FROM APPROVED TO PENDING/REJECTED
		    // Delete the user if they exist and are NOT an admin
		    if UserExists(requestEmail) then
		      if not IsUserAdmin(requestEmail) then
		        if DeleteUser(requestEmail) then
		          System.DebugLog("User deleted for: " + requestEmail)
		        else
		          MessageBox("Failed to delete user. Please try again.")
		          return
		        end if
		      else
		        MessageBox("Cannot delete admin user. Please demote from admin first.")
		        return
		      end if
		    end if
		  end if
		  
		  // Update the request status
		  var sql as String
		  
		  if status = nil then 
		    sql = "UPDATE access_requests SET request_status = NULL where request_id = " + Str(requestID)
		  elseif status = 1 then
		    sql = "UPDATE access_requests SET request_status = 1 where request_id = " + Str(requestID)
		  elseif status = 0 then
		    sql = "UPDATE access_requests SET request_status = 0 where request_id = " + Str(requestID)
		  end if
		  
		  session.DB.ExecuteSQL(sql)
		  
		  // refresh filter as set by segmented button
		  var seg as integer = segRequestFilter.SelectedSegmentIndex
		  FilterBySegment(seg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UserExists(email as String) As Boolean
		  // Check if a user with this email already exists
		  var sql as String = "SELECT user_id FROM users WHERE email = ?"
		  
		  Try
		    var ps as MySQLPreparedStatement = Session.DB.Prepare(sql)
		    ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		    ps.Bind(0, email)
		    
		    var rs as RowSet = ps.SelectSQL
		    
		    return (rs <> nil and not rs.AfterLastRow)
		    
		  Catch e as DatabaseException
		    System.DebugLog("Error checking user existence: " + e.Message)
		    return False
		  End Try
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events lstAccessReqeusts
	#tag Event
		Sub Opening()
		  me.ColumnTypeAt(0) = WebListBox.CellTypes.TextField
		  me.ColumnTypeAt(1) = WebListBox.CellTypes.TextField
		  me.ColumnTypeAt(2) = WebListBox.CellTypes.TextField
		  me.ColumnTypeAt(3) = WebListBox.CellTypes.TextField
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  #Pragma Unused rows
		  
		  btnAccept.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		  btnReject.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		  btnPend.Enabled = lstAccessReqeusts.SelectedRowIndex > -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events segRequestFilter
	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  FilterBySegment(segmentIndex)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAccept
	#tag Event
		Sub Pressed()
		  var v as variant = 1
		  SetStatus(v)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnReject
	#tag Event
		Sub Pressed()
		  var v as variant = 0
		  SetStatus(v)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPend
	#tag Event
		Sub Pressed()
		  var v as variant = nil
		  SetStatus(v)
		  
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
#tag EndViewBehavior
