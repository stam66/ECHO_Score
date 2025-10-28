# ECHOScore

A web-based echocardiography teaching and assessment platform built with Xojo 2025 r2.

![Version](https://img.shields.io/badge/version-2.0-blue)
![Xojo](https://img.shields.io/badge/Xojo-2025%20r2-green)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

## 📋 Overview

ECHOScore provides a comprehensive system for teaching and testing echocardiography interpretation skills. Students can review video cases and submit assessments, while administrators manage cases, users, and video content with sophisticated group-based access control.

### ✨ Key Features

- 🎥 **Video-Based Learning** - Stream echocardiography videos with browser-based HTML5 playback
- 📊 **Automated Grading** - Instant feedback with color-coded results (green=correct, red=incorrect)
- 👥 **Case-Level Group Management** - Assign entire cases to multiple student groups simultaneously
- 🏷️ **Tag-Based Group Selection** - Intuitive UI for adding/removing groups with visual feedback
- 🔐 **Secure Authentication** - SHA2-256 password hashing with OTP-based password reset
- 📧 **Email Integration** - SMTP-based notifications and password resets with styled HTML emails
- 🎯 **Progress Tracking** - Monitor student completion status and performance
- 🛠️ **Admin Management** - Comprehensive tools for case, user, and video management
- ↩️ **Undo Functionality** - Revert last video metadata change
- 📝 **Indeterminate State Support** - Handle NULL values for correct answers appropriately
- 🔢 **Smart Numerical Sorting** - Cases display in proper numerical order (Case 1, 2, 3... 10, 11)

---

## 📚 Table of Contents

- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Usage Guide](#usage-guide)
  - [Admin Workflow](#admin-workflow)
  - [Student Workflow](#student-workflow)
- [Architecture](#architecture)
- [Recent Changes](#recent-changes)
- [Components Reference](#components-reference)
- [Group Management System](#group-management-system)
- [API Reference](#api-reference)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## 💻 System Requirements

### Server Requirements
- **Xojo** 2025 r2 or later
- **MySQL** 8.0 or later
- **Web Server** capability (Xojo Web 2.0)
- **PHP** (optional, for deployment)

### Client Requirements
- Modern web browser with HTML5 video support (Chrome, Firefox, Safari, Edge)
- JavaScript enabled
- Minimum 1024x768 screen resolution
- Recommended: 1920x1080 or higher

### Storage Requirements
- Database: ~50MB (for moderate use)
- Video storage: Variable (depends on case count)
- Recommended: 10GB+ for video files

### Network Requirements
- SMTP server access for email functionality
- Stable internet connection for video streaming
- Minimum 5 Mbps for smooth video playback

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/echoscore.git
cd echoscore
```

### 2. Install Dependencies

Ensure you have:
- Xojo 2025 r2 installed
- MySQL 8.0+ server running
- Access to an SMTP server (Gmail, SendGrid, etc.)

### 3. Create Video Storage Directory

```bash
mkdir -p ~/Documents/CaseVideos
chmod 755 ~/Documents/CaseVideos
```

**Note:** This directory must be writable by the web application.

---

## 🗄️ Database Setup

### 1. Create the Database

Create a new database and run the complete SQL schema:

```bash
mysql -u root -p < database/echoscore_schema.sql
```

Or manually:

```sql
CREATE DATABASE IF NOT EXISTS echoscore 
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE echoscore;

-- Run the complete schema from echoscore_database artifact
-- Includes: users, cases, case_videos, user_responses, 
-- password_reset_tokens, email_config tables
```

### 2. Run Migration for Case-Level Groups

**IMPORTANT:** If upgrading from an earlier version, run the migration:

```sql
-- Add case_groups column to cases table
ALTER TABLE cases 
ADD COLUMN case_groups TEXT NULL;

ALTER TABLE cases 
ADD INDEX idx_case_groups (case_groups(100));
```

### 3. Configure Database Connection

In `Session.Opening` event, update the connection parameters:

```xojo
DB = New MySQLCommunityServer
DB.Host = "127.0.0.1"
DB.Port = 3306
DB.DatabaseName = "echoscore"
DB.UserName = "root"
DB.Password = "your_secure_password_here"  // UPDATE THIS!

Try
  DB.Connect
  System.DebugLog("Database connected successfully")
Catch e As DatabaseException
  System.DebugLog("Database connection failed: " + e.Message)
End Try
```

### 4. Verify Installation

Check that all tables exist:

```sql
SHOW TABLES;
-- Should show: users, cases, case_videos, user_responses, 
-- password_reset_tokens, email_config
```

### 5. Default Admin Account

A default admin account is created automatically:
- **Username:** `admin`
- **Password:** `reject66`

**⚠️ SECURITY WARNING:** Change this password immediately in production!

---

## ⚙️ Configuration

### Email Configuration

1. Login as admin
2. Navigate to **Admin Home** → **Configure Email**
3. Enter SMTP settings:
   - **SMTP Server:** `smtp.gmail.com` (for Gmail)
   - **Port:** `587` (TLS) or `465` (SSL)
   - **Username:** Your email address
   - **Password:** App password (for Gmail, generate at https://myaccount.google.com/apppasswords)
   - **From Name:** ECHOScore System
   - **From Email:** noreply@yourdomain.com

4. Click **Test Email** to verify configuration
5. Click **Save Settings**

### Video Storage Configuration

Videos are stored in `~/Documents/CaseVideos/` by default. To change this location, modify `Session.ServeVideo()`:

```xojo
Var videoFolder As FolderItem = SpecialFolder.Documents.Child("CaseVideos")
```

---

## 📖 Usage Guide

### Admin Workflow

#### Creating Cases

1. **Navigate** to Admin Home → Manage Cases
2. **Click** "New Case"
3. **Enter** case details:
   - Description (e.g., "Dilated Cardiomyopathy")
   - Assign initial group (optional)
4. **Click** "Create Case"
5. **Double-click** the new case to open Case Details

#### Managing Case Details

**Case Information:**
- Serial Number is auto-generated (read-only)
- Description is editable
- Assign groups using tag-based UI:
  1. Select group from dropdown
  2. Click "Add Group"
  3. Group appears in "Currently Assigned" list
  4. To remove: select group, click "Remove Selected"

**Setting Correct Answers:**
- Check applicable findings (12 checkboxes)
- Leave unchecked for "No" answers
- Use indeterminate state (gray) for NULL/unknown values
- Enter expert conclusions
- Indicate if full ECHO is required
- Click **"Save All Changes"** to save description + answers together

**Managing Videos:**
- **Upload:** 
  1. Click "Choose File"
  2. Select MP4 video
  3. Click "Upload Selected Video"
  4. Video is automatically saved and added to list
- **Edit Metadata:** Click directly in Description or Order columns to edit
  - Changes auto-save immediately
  - Last change can be undone with "Undo Last Edit"
- **Preview:** Click on any video to preview with auto-loop
- **Delete:** Select video, click "Delete Video" (confirmation required)
- **Order:** Videos display to students in numerical order

**Note:** The "Purpose" field has been replaced by case-level groups. It's retained in the database for potential future use.

#### Managing Users

1. Navigate to **Admin Home** → **Manage Users**
2. **Create users** with:
   - Full name, email, username, password
   - Admin flag (if applicable)
   - **User Group:** e.g., "Cardiology 2025 Q1"
3. **Filter by group** to manage specific cohorts
4. **Update/Delete** users as needed

**Note:** Admins cannot delete their own account for security.

### Student Workflow

1. **Login** with provided credentials
2. **Dashboard** displays available cases:
   - Only cases assigned to your group are visible
   - Status indicators: Not Started, In Progress, Completed
3. **Select a case** to begin review
4. **Watch videos:**
   - Use Previous/Next/Replay controls
   - Videos play in assigned order
   - All videos must be viewed
5. **Complete assessment:**
   - Check applicable findings (12 categories)
   - Write detailed conclusions
   - Indicate if full ECHO is needed
6. **Save Draft** (can return later) or **Submit** (final, triggers grading)
7. **View Results:**
   - Color-coded answers (✅ green=correct, ❌ red=incorrect)
   - Score out of 13 points
   - Expert conclusions displayed for comparison

---

## 🏗️ Architecture

### Technology Stack

```
┌──────────────────────────────────────────────┐
│         Browser (Client)                     │
│  HTML5 Video | JavaScript | CSS             │
└─────────────────┬────────────────────────────┘
                  │ HTTPS
┌─────────────────▼────────────────────────────┐
│       Xojo Web Application 2.0               │
│  Session Manager | WebNavigationManager      │
│  WebContainers | Authentication              │
│  MySQLPreparedStatements | Email Helper      │
└─────────────────┬────────────────────────────┘
                  │
    ┌─────────────┼──────────────┐
    │             │              │
┌───▼─────┐  ┌───▼──────┐  ┌───▼──────┐
│ MySQL   │  │  SMTP    │  │   File   │
│  8.0+   │  │  Server  │  │  System  │
└─────────┘  └──────────┘  └──────────┘
```

### Component Architecture

```
Session (Global State)
├── WebNavigationManager (History-based navigation)
├── MySQLCommunityServer (Database connection)
└── WebContainers
    ├── Authentication Flow
    │   ├── wc_Login
    │   ├── wc_ForgotPassword
    │   ├── wc_EnterOTP
    │   └── wc_NewPassword
    ├── Student Views
    │   ├── wc_UserHome (Dashboard)
    │   └── wc_CaseReview (Video player + assessment)
    └── Admin Views
        ├── wc_AdminHome (Navigation hub)
        ├── wc_UserAdmin (User management)
        ├── wc_CaseList (Case browser)
        ├── wc_CaseDetails (Case editor with tag-based groups)
        └── wc_EmailConfig (SMTP settings)
```

---

## 🆕 Recent Changes

### Version 2.0 - Case-Level Group Management Refactoring

#### Major Changes

**1. Migration to Case-Level Groups**
- ✅ Groups are now assigned to entire cases, not individual videos
- ✅ Added `case_groups` column to `cases` table
- ✅ Retained `video_purpose` field for potential future use
- ✅ More logical approach: all videos in a case are shown together

**2. Tag-Based Group Selection UI**
- ✅ Intuitive dropdown + "Add Group" button interface
- ✅ Visual list showing currently assigned groups
- ✅ Easy removal of groups with "Remove Selected" button
- ✅ Multi-group assignment in a single save operation

**3. Critical Bug Fixes**

**Case List Sorting:**
- ✅ Fixed: Cases now sort numerically (Case 1, 2... 10, 11) instead of alphabetically
- ✅ Uses `CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)` for proper ordering

**Selection Preservation:**
- ✅ Fixed: Case selection now properly preserved after operations
- ✅ Uses `mSelectedCaseID` property to track selection
- ✅ Delete and DoubleClick operations use stored ID, not row index

**Dialog Integration:**
- ✅ Fixed: Uses `dlg.Dismissed` event (WebDialog doesn't have `Closed`)
- ✅ Properly reloads cases and groups after dialog closes

**4. Enhanced Features**

**Video Management:**
- ✅ Two-step upload workflow (select file → upload)
- ✅ Undo last metadata change functionality
- ✅ Auto-save for inline edits (immediate database update)
- ✅ Video preview with auto-loop

**Correct Answers:**
- ✅ Indeterminate checkbox state for NULL values
- ✅ Unified save for description + answers (single transaction)
- ✅ Smart change tracking (only saves what changed)

**5. Simplified Architecture**
- ✅ Removed per-video group filtering logic
- ✅ Single filtering query at case level
- ✅ Consistent group assignment across all videos
- ✅ Easier maintenance and debugging

#### Migration Guide

If upgrading from version 1.x:

```sql
-- 1. Add new column
ALTER TABLE cases ADD COLUMN case_groups TEXT NULL;
ALTER TABLE cases ADD INDEX idx_case_groups (case_groups(100));

-- 2. Verify schema
DESCRIBE cases;
-- Should see case_groups column

-- 3. Update existing cases (optional)
-- Manually assign groups through the new UI
```

---

## 🧩 Components Reference

### Core Classes

#### Session Class
Global application state manager and database connector.

**Properties:**
- `CurrentUserID`, `CurrentUserName`, `CurrentUserEmail`, `IsAdmin`
- `DB` - MySQLCommunityServer connection
- `Navigation` - WebNavigationManager instance
- `MainShell` - wp_MainShell reference

**Key Methods:**
```xojo
Function ServeVideo(filename As String) As WebFile
  // Creates browser-accessible URL for video streaming
  // Returns WebFile with .URL property, or Nil if not found
End Function
```

#### wc_Base Class
Base class for all WebContainers with positioning logic.

**Properties:**
- `ContainerID` - Unique string identifier
- `Position` - PositionEnum (Center or TopLeft)

**Methods:**
```xojo
Sub EmbedInto(target As WebContainer)
  // Handles automatic positioning and embedding
End Sub
```

#### WebNavigationManager
Manages navigation with browser-like history support.

**Methods:**
```xojo
Sub NavigateTo(container As WebContainer)
  // Navigate forward, adds to history

Sub NavigateBack()
  // Navigate to previous container

Sub NavigateForward()
  // Redo navigation (if available)
```

### Modules

#### EmailHelper
Email and OTP functionality with styled HTML templates.

**Methods:**
```xojo
Function SendPasswordResetEmail(toEmail, toName, otp, resetLink) As Boolean
Function GenerateOTP() As String // Creates 6-digit code
Function GenerateSecureToken() As String // Creates 64-char token
Function GeneratePasswordResetEmailHTML(toName, otp) As String
```

#### PasswordResetHelper
Password reset token management and validation.

**Methods:**
```xojo
Function CreatePasswordResetToken(userID, ipAddress) As Dictionary
Function VerifyOTP(email, otp) As Dictionary
Function ResetPassword(tokenID, userID, newPassword) As Boolean
Function CleanupExpiredTokens() As Integer
```

### Authentication Containers

#### wc_Login
User login with SHA2-256 authentication.
- Validates credentials against database
- Redirects to AdminHome or UserHome based on role
- Link to password reset flow

#### wc_ForgotPassword
Initiates password reset process.
- Validates email exists
- Generates OTP and secure token
- Sends styled HTML email
- Auto-navigates to OTP entry

#### wc_EnterOTP
OTP verification screen.
- 6-digit code validation
- 30-minute expiration
- Resend OTP functionality
- Single-use tokens

#### wc_NewPassword
Password reset completion.
- Password strength validation (8+ chars, upper, lower, number)
- Confirmation field matching
- Updates password with SHA2-256
- Marks token as used

### Student Containers

#### wc_UserHome
Student dashboard and case browser.
- Displays cases filtered by user's group
- Shows completion status (Not Started, In Progress, Completed)
- Case filtering: only accessible cases appear
- Navigate to case review with single click

#### wc_CaseReview
Video player and assessment interface (3 parts).

**Part 1:** Video controls and state management
- Previous/Next/Replay buttons
- Video sequence tracking
- All videos loaded from case

**Part 2:** Assessment interface
- 12 finding checkboxes
- Conclusions textarea
- Requires full ECHO checkbox
- Save Draft / Submit buttons

**Part 3:** Grading and results display
- Color-coded answers (green/red)
- Score calculation (out of 13)
- Expert conclusions comparison
- Results only visible after submission

### Admin Containers

#### wc_AdminHome
Admin navigation hub with links to:
- User Management
- Case Management
- Email Configuration

#### wc_UserAdmin
User management interface (2 parts).

**Features:**
- Add new users with auto-generated or custom groups
- Update existing users (password optional)
- Delete users (with confirmation)
- Filter users by group
- Cannot delete own admin account

#### wc_CaseList
Case browser with filtering and search (Screen 1 of 2).

**Features:**
- Four-column display: Serial Number, Description, Groups, Video Count
- Group filter dropdown (extracts from comma-separated values)
- Real-time search (serial number + description)
- Clear filters button
- Numerical sorting (Case 1, 2... 10, 11)
- Selection preservation after operations
- Double-click to open Case Details
- Delete cases with confirmation

**Critical Fix:** Selection now properly tracked with `mSelectedCaseID` property.

#### wc_CaseDetails
Comprehensive case editor (Screen 2 of 2, split into 3 parts).

**Part 1:** Layout and properties
- Read-only serial number display
- Editable case description
- Tag-based group selection UI
- Correct answers section with indeterminate state support
- Change tracking flags

**Part 2:** Video management
- 4-column video list (Filename, Description, Purpose, Order)
- Inline editing for Description and Order (auto-saves)
- Video preview with auto-loop in HTMLViewer
- Selection change handling

**Part 3:** Video operations
- Two-step upload (select → upload button)
- Delete videos with confirmation
- Undo last metadata change
- Navigation back to case list

**Save Strategy:**
- Case description + correct answers: Unified save with transaction
- Video metadata: Auto-save on inline edit (immediate feedback)
- Video upload: Two-step process for better UX
- Video delete: Immediate with confirmation

#### dlg_AddCase
Case creation dialog.
- Auto-increments case serial numbers
- Optional initial group assignment
- Creates case with NULL correct answers (to be filled later)

#### wc_EmailConfig
SMTP configuration interface.
- Server, port, credentials
- TLS/SSL options
- Test email functionality
- Supports Gmail App Passwords

---

## 👥 Group Management System

### Overview

The group management system allows flexible content delivery across different student cohorts without duplicating cases or videos. As of version 2.0, groups are assigned at the **case level** for logical consistency.

### How It Works

#### Case-Level Assignment

1. **Admin assigns groups to case:**
   ```
   Case: "Dilated Cardiomyopathy"
   Groups: "Cardiology 2025 Q1, ICU 2025 Q1, ED 2025 Q1"
   ```

2. **User belongs to group:**
   ```
   Student: Jane Smith
   User Group: "Cardiology 2025 Q1"
   ```

3. **Filtering logic:**
   ```sql
   SELECT c.* FROM cases c
   WHERE c.case_groups IS NULL 
      OR c.case_groups = '' 
      OR FIND_IN_SET(?, REPLACE(c.case_groups, ' ', '')) > 0 
      OR c.case_groups LIKE ?
   ORDER BY CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)
   ```

4. **Result:** Jane sees all cases assigned to "Cardiology 2025 Q1" + cases with no group restrictions

### Tag-Based UI

The Case Details screen provides an intuitive tag-based interface:

```
┌─────────────────────────────────────────┐
│ Assigned Groups                         │
├─────────────────────────────────────────┤
│ Select a group and click Add. Students  │
│ in any assigned group will see this     │
│ case.                                    │
├─────────────────────────────────────────┤
│ [Select group... ▼] [Add Group]         │
├─────────────────────────────────────────┤
│ Currently Assigned:                      │
│ ┌───────────────────────────────────┐   │
│ │ Cardiology 2025 Q1                │   │
│ │ ICU 2025 Q1                       │   │
│ │ ED 2025 Q1                        │   │
│ └───────────────────────────────────┘   │
│ [Remove Selected]                        │
└─────────────────────────────────────────┘
```

**Workflow:**
1. Select group from dropdown
2. Click "Add Group"
3. Group appears in list
4. To remove: select and click "Remove Selected"
5. Click "Save All Changes" to persist

### Example Scenarios

#### Scenario 1: Shared Foundational Content
```
Case: "Basic Apical 4-Chamber Views"
Groups: "Cardiology 2025 Q1, ICU 2025 Q1, Medicine 2025 Q1"
Result: Visible to all three groups
```

#### Scenario 2: Specialty-Specific Content
```
Case: "Advanced Strain Imaging Analysis"
Groups: "Cardiology 2025 Q1"
Result: Only cardiology students see this
```

#### Scenario 3: Universal Content
```
Case: "Introduction to Echocardiography"
Groups: (empty)
Result: All users see this, regardless of group
```

### Benefits of Case-Level Groups

✅ **Logical consistency** - Matches how content is consumed  
✅ **Simplified filtering** - Single query per case  
✅ **No duplicate files** - Share cases across groups  
✅ **Easy multi-group assignment** - Tag-based UI  
✅ **Maintainable code** - Less complex logic  
✅ **Better UX** - Clear visual representation  

### Migration from Video-Level Groups

**Before (Version 1.x):**
- Groups assigned per video
- Confusing: all videos shown together anyway
- Required filtering in multiple places
- Could have inconsistent groups within case

**After (Version 2.0):**
- Groups assigned to entire case
- Logical: matches consumption pattern
- Single filtering point
- Consistent group assignment
- `video_purpose` field retained for future use

---

## 🔌 API Reference

### Session.ServeVideo()

Creates a browser-accessible URL for video streaming.

**Signature:**
```xojo
Function ServeVideo(filename As String) As WebFile
```

**Parameters:**
- `filename` - Name of video file in CaseVideos folder (e.g., "apical_4ch.mp4")

**Returns:**
- `WebFile` object with `.URL` property for use in HTMLViewer
- `Nil` if file not found or error occurred

**Example:**
```xojo
Var wf As WebFile = Session.ServeVideo("apical_4ch.mp4")
If wf <> Nil Then
  Var videoURL As String = wf.URL
  // Use videoURL in HTMLViewer video tag
Else
  MessageBox("Video not found")
End If
```

**Error Handling:**
```xojo
Try
  Var wf As WebFile = Session.ServeVideo(videoFilename)
  If wf = Nil Then
    System.DebugLog("Video file not found: " + videoFilename)
    Return
  End If
  // Use wf.URL
Catch e As RuntimeException
  System.DebugLog("Error serving video: " + e.Message)
End Try
```

### PasswordResetHelper.CreatePasswordResetToken()

Generates OTP and secure token for password reset.

**Signature:**
```xojo
Function CreatePasswordResetToken(userID As Integer, ipAddress As String) As Dictionary
```

**Parameters:**
- `userID` - Database ID of user requesting reset
- `ipAddress` - IP address of requester (for security logging)

**Returns:**
Dictionary with keys:
- `"success"` (Boolean) - True if token created
- `"otp"` (String) - 6-digit OTP code
- `"token"` (String) - 64-character secure token
- `"expires"` (DateTime) - Expiration time (30 minutes)
- `"error"` (String) - Error message if failed

**Example:**
```xojo
Var result As Dictionary = PasswordResetHelper.CreatePasswordResetToken(userID, "192.168.1.1")
If result.Value("success") Then
  Var otp As String = result.Value("otp")
  Var token As String = result.Value("token")
  // Send OTP via email
Else
  Var errorMsg As String = result.Value("error")
  MessageBox("Error: " + errorMsg)
End If
```

### PasswordResetHelper.VerifyOTP()

Validates OTP code against database.

**Signature:**
```xojo
Function VerifyOTP(email As String, otp As String) As Dictionary
```

**Parameters:**
- `email` - User's email address
- `otp` - 6-digit OTP code entered by user

**Returns:**
Dictionary with keys:
- `"success"` (Boolean) - True if OTP valid
- `"userID"` (Integer) - User's database ID
- `"token"` (String) - Secure token for password reset
- `"tokenID"` (Integer) - Token database ID
- `"error"` (String) - Error message if failed

**Example:**
```xojo
Var result As Dictionary = PasswordResetHelper.VerifyOTP("user@example.com", "123456")
If result.Value("success") Then
  Var userID As Integer = result.Value("userID")
  Var tokenID As Integer = result.Value("tokenID")
  // Proceed to password reset screen
Else
  MessageBox("Invalid or expired OTP")
End If
```

### PasswordResetHelper.ResetPassword()

Updates user password and marks token as used.

**Signature:**
```xojo
Function ResetPassword(tokenID As Integer, userID As Integer, newPassword As String) As Boolean
```

**Parameters:**
- `tokenID` - Token database ID from VerifyOTP
- `userID` - User database ID
- `newPassword` - New password (plain text, will be hashed)

**Returns:**
- `True` if password reset successful
- `False` if error occurred

**Example:**
```xojo
Var success As Boolean = PasswordResetHelper.ResetPassword(tokenID, userID, "newSecurePass123")
If success Then
  MessageBox("Password reset successfully!")
Else
  MessageBox("Error resetting password")
End If
```

---

## 🔧 Troubleshooting

### Database Issues

**Problem:** Cannot connect to database

**Solutions:**
1. Verify MySQL server is running:
   ```bash
   sudo systemctl status mysql
   ```
2. Check credentials in `Session.Opening`
3. Verify port 3306 is open:
   ```bash
   sudo netstat -tlnp | grep 3306
   ```
4. Check MySQL user permissions:
   ```sql
   SHOW GRANTS FOR 'root'@'localhost';
   ```

**Problem:** "Table doesn't exist" error

**Solutions:**
1. Verify database schema is loaded:
   ```sql
   USE echoscore;
   SHOW TABLES;
   ```
2. Check for migration completion (case_groups column):
   ```sql
   DESCRIBE cases;
   ```
3. Review MySQLPreparedStatement bindings for type mismatches

### Video Playback Issues

**Problem:** Videos not playing in browser

**Solutions:**
1. Verify video format is H.264 MP4:
   ```bash
   ffmpeg -i video.mp4
   ```
2. Check CaseVideos folder permissions:
   ```bash
   ls -la ~/Documents/CaseVideos/
   ```
3. Verify `Session.ServeVideo()` returns WebFile (not Nil)
4. Check browser console for MIME type errors
5. Test video in standalone HTML:
   ```html
   <video src="video.mp4" controls></video>
   ```

**Problem:** Video loads but won't autoplay

**Solution:**
- Modern browsers require user interaction for autoplay
- Videos with `muted` attribute can autoplay without interaction
- Check browser autoplay policy settings

### Authentication Issues

**Problem:** Cannot login with correct credentials

**Solutions:**
1. Verify password hash in database:
   ```sql
   SELECT username, password_hash FROM users WHERE username = 'admin';
   ```
2. Test SHA2 hashing:
   ```sql
   SELECT SHA2('reject66', 256);
   -- Compare with database value
   ```
3. Reset admin password manually:
   ```sql
   UPDATE users 
   SET password_hash = SHA2('newpassword', 256) 
   WHERE username = 'admin';
   ```

**Problem:** Password reset email not received

**Solutions:**
1. Check SMTP settings in wc_EmailConfig
2. Verify SMTP credentials (use App Password for Gmail)
3. Check spam/junk folder
4. Test email with "Send Test Email" button
5. Review Xojo logs for SMTP errors:
   ```
   System.DebugLog output
   ```

### Case Management Issues

**Problem:** Cases not sorting numerically

**Solution:**
- Verify SQL uses `CAST(SUBSTRING(c.serial_number, 6) AS UNSIGNED)`
- Check that serial numbers follow "Case N" format
- Review `wc_CaseList.LoadCases()` ORDER BY clause

**Problem:** Selection lost after deleting case

**Solution:**
- Ensure `mSelectedCaseID` property exists and is used
- Verify `lstCases.SelectionType = Single` in IDE
- Check that delete operations use stored ID, not row index

**Problem:** Groups not displaying in Case Details

**Solutions:**
1. Verify case_groups column exists:
   ```sql
   DESCRIBE cases;
   ```
2. Check data format (comma-separated):
   ```sql
   SELECT case_id, case_groups FROM cases;
   ```
3. Review `GetCurrentGroups()` method implementation

### Video Upload Issues

**Problem:** Upload button stays disabled

**Solutions:**
1. Check WebFileUploader `FileAdded` event is wired
2. Verify `btnStartUpload.Enabled = True` in FileAdded
3. Check browser console for JavaScript errors

**Problem:** Upload fails silently

**Solutions:**
1. Verify CaseVideos folder exists and is writable
2. Check file size limits (default: 50MB)
3. Review UploadError event handler
4. Check System.DebugLog for error messages

---

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

### Reporting Issues

1. **Check existing issues** first to avoid duplicates
2. **Provide detailed description** including:
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Screenshots (if applicable)
3. **Specify environment:**
   - Xojo version
   - Operating system
   - MySQL version
   - Browser (for frontend issues)

### Submitting Pull Requests

1. **Fork the repository**
2. **Create a feature branch:**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes:**
   - Follow existing code style
   - Add comments for complex logic
   - Update documentation as needed
4. **Test thoroughly:**
   - Test all affected workflows
   - Verify database migrations
   - Check browser compatibility
5. **Commit with clear messages:**
   ```bash
   git commit -m 'Add feature: description of feature'
   ```
6. **Push to branch:**
   ```bash
   git push origin feature/amazing-feature
   ```
7. **Open a Pull Request** with:
   - Clear title and description
   - Reference related issues
   - Screenshots of UI changes
   - Test results

### Code Style Guidelines

**Xojo Code:**
- Use descriptive variable names
- Add XML comments for methods
- Handle exceptions with Try/Catch
- Log errors to System.DebugLog
- Use MySQLPreparedStatements (never string concatenation)
- Follow Xojo naming conventions (camelCase for methods, PascalCase for classes)

**SQL:**
- Use parameterized queries exclusively
- Add indexes for frequently queried columns
- Include comments explaining complex queries
- Test queries with EXPLAIN for performance

**Comments:**
- Explain "why", not "what"
- Document non-obvious logic
- Include examples for complex functionality
- Keep comments up-to-date with code changes

### Code Review Process

- All PRs require review from maintainer
- Must pass manual testing
- Follow existing architecture patterns
- Update relevant documentation
- Address review feedback promptly

---

## 📊 Performance Optimization

### Database

**Add indexes for frequent queries:**
```sql
CREATE INDEX idx_user_responses_user ON user_responses(user_id);
CREATE INDEX idx_user_responses_case ON user_responses(case_id);
CREATE INDEX idx_case_groups ON cases(case_groups(100));
CREATE INDEX idx_users_group ON users(user_group(50));
```

**Enable query cache:**
```sql
SET GLOBAL query_cache_size = 1048576;
SET GLOBAL query_cache_type = ON;
```

**Optimize tables periodically:**
```sql
OPTIMIZE TABLE users, cases, case_videos, user_responses;
```

### Video Delivery

**Production recommendations:**
- Use CDN for video hosting (CloudFront, CloudFlare)
- Implement adaptive bitrate streaming (HLS/DASH)
- Cache video metadata in session
- Consider video transcoding service (AWS MediaConvert)
- Compress videos with H.264 (CRF 23)

**Video optimization:**
```bash
# Convert to web-optimized H.264
ffmpeg -i input.mp4 -c:v libx264 -crf 23 -preset slow \
  -c:a aac -b:a 128k -movflags +faststart output.mp4
```

### Caching Strategy

- Cache user groups in session after login
- Cache case lists for students (refresh on changes)
- Use MySQL query cache for repeated queries
- Consider Redis for session management (advanced)

---

## 🔒 Security Best Practices

### Database Security

1. **Use strong MySQL root password** (20+ characters, mixed types)
2. **Create dedicated database user** with minimal permissions:
   ```sql
   CREATE USER 'echoscore'@'localhost' IDENTIFIED BY 'strong_password';
   GRANT SELECT, INSERT, UPDATE, DELETE ON echoscore.* TO 'echoscore'@'localhost';
   FLUSH PRIVILEGES;
   ```
3. **Enable SSL connections:**
   ```sql
   REQUIRE SSL FOR 'echoscore'@'localhost';
   ```
4. **Regular backups** (daily recommended):
   ```bash
   mysqldump -u root -p echoscore > echoscore_backup_$(date +%Y%m%d).sql
   ```

### Application Security

1. **Force HTTPS in production** (redirect HTTP to HTTPS)
2. **Keep Xojo updated** to latest stable version
3. **Validate and sanitize all user input**
4. **Use MySQLPreparedStatements exclusively** (prevents SQL injection)
5. **Implement rate limiting** for login attempts (prevent brute force)
6. **Set secure session timeout** (30 minutes recommended)

### Server Security

1. **Keep OS updated:**
   ```bash
   sudo apt update && sudo apt upgrade
   ```
2. **Configure firewall** (allow only necessary ports):
   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   sudo ufw allow 3306/tcp
   sudo ufw enable
   ```
3. **Use fail2ban** for brute force protection:
   ```bash
   sudo apt install fail2ban
   sudo systemctl enable fail2ban
   ```
4. **Regular security audits** with tools like Lynis

### Password Policies

- Minimum 8 characters
- Require uppercase, lowercase, and number
- SHA2-256 hashing (never plain text)
- OTP expires in 30 minutes
- Single-use tokens
- Force password change on first login (recommended)

---

## 🛠️ Maintenance

### Daily Tasks

- Monitor application logs for errors
- Check video storage capacity
- Verify backup completion
- Review login attempts for suspicious activity

### Weekly Tasks

- Review new user registrations
- Clean up expired password tokens:
  ```sql
  DELETE FROM password_reset_tokens 
  WHERE expires_at < NOW() AND is_used = FALSE;
  ```
- Monitor database size and performance
- Check email delivery status

### Monthly Tasks

- **Database maintenance:**
  ```sql
  OPTIMIZE TABLE users, cases, case_videos, user_responses;
  ANALYZE TABLE users, cases, case_videos, user_responses;
  ```
- Verify backup restoration process
- Review user activity reports
- Update user groups for new cohorts
- Archive old test submissions (optional)

### Quarterly Tasks

- **Software updates:**
  - Xojo framework
  - MySQL server
  - Operating system
- Security audit and penetration testing
- Performance review and optimization
- User feedback collection and analysis
- Review and update documentation

### Backup Strategy

**Automated daily backups:**
```bash
#!/bin/bash
# /etc/cron.daily/echoscore-backup
DATE=$(date +%Y%m%d)
BACKUP_DIR="/var/backups/echoscore"
mysqldump -u root -p${MYSQL_ROOT_PASSWORD} echoscore | \
  gzip > ${BACKUP_DIR}/echoscore_${DATE}.sql.gz
# Keep last 30 days
find ${BACKUP_DIR} -name "echoscore_*.sql.gz" -mtime +30 -delete
```

**Backup verification:**
```bash
# Monthly: Test restore to verify backup integrity
gunzip < echoscore_backup.sql.gz | mysql -u root -p echoscore_test
```

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### MIT License

```
Copyright (c) 2025 ECHOScore Project

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🙏 Acknowledgments

- Built with [Xojo](https://www.xojo.com/) 2025 r2
- Video playback powered by HTML5
- Database: MySQL 8.0+
- Email functionality via SMTP
- Inspired by the need for better medical education tools

---

## 📞 Support

- **Documentation:** [GitHub Wiki](https://github.com/yourusername/echoscore/wiki)
- **Issues:** [GitHub Issues](https://github.com/yourusername/echoscore/issues)
- **Discussions:** [GitHub Discussions](https://github.com/yourusername/echoscore/discussions)
- **Email:** support@echoscore.example.com

---

## 📈 Roadmap

### Planned Features (Version 3.0)

- [ ] Bulk case assignment across groups
- [ ] Historical group tracking and analytics
- [ ] Student performance analytics dashboard
- [ ] Export results to CSV/Excel
- [ ] Video annotation and bookmarking
- [ ] Mobile-responsive interface
- [ ] Multi-language support
- [ ] Integration with LMS (Canvas, Moodle)
- [ ] Advanced search with filters
- [ ] Automated email reminders for incomplete cases

### Under Consideration

- [ ] Video speed controls (0.5x, 1x, 1.5x, 2x)
- [ ] Frame-by-frame navigation
- [ ] Split-screen comparison views
- [ ] Collaborative case reviews
- [ ] AI-powered image analysis
- [ ] DICOM file support
- [ ] Live session scheduling
- [ ] Student discussion forums

---

## 📝 Changelog

### Version 2.0.0 (2025-01-27)
- ✅ **Major:** Migration to case-level group management
- ✅ **UI:** Tag-based group selection interface
- ✅ **Fix:** Numerical sorting of cases (Case 1, 2... 10, 11)
- ✅ **Fix:** Selection preservation in case list
- ✅ **Fix:** Dialog integration with proper event handling
- ✅ **Feature:** Undo functionality for video metadata
- ✅ **Feature:** Auto-save for inline video edits
- ✅ **Feature:** Two-step video upload workflow
- ✅ **Feature:** Indeterminate state for NULL correct answers
- ✅ **Enhancement:** Unified save for case description + answers
- ✅ **Enhancement:** Smart change tracking (only save what changed)
- ✅ **Database:** Added case_groups column with index
- ✅ **Architecture:** Simplified filtering logic

### Version 1.0.0 (2025-01-12)
- ✅ Initial release
- ✅ Multi-group video filtering (video-level)
- ✅ Student assessment system
- ✅ Admin management tools
- ✅ Password reset via OTP
- ✅ Email integration
- ✅ Video streaming with HTML5
- ✅ Automated grading

---

**Made with ❤️ for medical education**

**Star ⭐ this repository if you find it useful!**
