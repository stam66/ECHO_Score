# ECHOScore Application - Complete Component List

## Overview
ECHOScore is a web-based echocardiography teaching platform built with Xojo 2025 r2, featuring:
- Student case review and testing
- Admin case and user management
- Multi-group video filtering
- Password reset via email OTP
- Video streaming with WebFile support

---

## 1. Database Schema
**Artifact:** `echoscore_database`

**Tables:**
- `users` - User accounts with groups
- `cases` - Echo cases with correct answers
- `case_videos` - Videos with multi-group support (TEXT purpose field)
- `user_responses` - Student test submissions
- `password_reset_tokens` - OTP tokens
- `email_config` - SMTP settings

**Key Features:**
- Multi-group support via comma-separated values in `video_purpose`
- Cascade delete on cases (removes videos and responses)
- SHA2-256 password hashing
- Default admin account (username: admin, password: reject66)

---

## 2. Core Classes

### 2.1 Session Class
**Artifact:** `echoscore_session`

**Properties:**
- `MainShell`, `Navigation`, `DB`
- `CurrentUserID`, `CurrentUserName`, `CurrentUserEmail`, `IsAdmin`

**Key Methods:**
- `Opening()` - Database connection and initialization
- `ServeVideo(filename)` - Creates WebFile for video streaming

---

### 2.2 wc_Base Class
**Artifact:** `echoscore_wc_base`

**Purpose:** Base class for all WebContainers

**Properties:**
- `ContainerID` - Unique identifier
- `Position` - PositionEnum (Center or TopLeft)

**Methods:**
- `EmbedInto(target)` - Handles positioning logic

---

### 2.3 WebNavigationManager Class
**Artifact:** `echoscore_nav_manager`

**Purpose:** Manages navigation with history support

**Methods:**
- `NavigateTo(container)` - Navigate forward
- `NavigateBack()` - Navigate to previous
- `NavigateForward()` - Redo navigation

---

## 3. Modules

### 3.1 EmailHelper Module
**Artifact:** `echoscore_email_helper`

**Methods:**
- `SendPasswordResetEmail()` - Sends OTP via SMTP
- `GenerateOTP()` - Creates 6-digit code
- `GenerateSecureToken()` - Creates 64-char token
- `GeneratePasswordResetEmailHTML()` - Styled HTML email

---

### 3.2 PasswordResetHelper Module
**Artifact:** `echoscore_password_helper`

**Methods:**
- `CreatePasswordResetToken()` - Generates OTP and token
- `VerifyOTP()` - Validates OTP code
- `ResetPassword()` - Updates user password
- `CleanupExpiredTokens()` - Removes old tokens

---

## 4. WebPage

### 4.1 wp_MainShell
**Artifact:** `echoscore_wp_mainshell`

**Purpose:** Main page hosting all containers

**Controls:**
- `Placeholder` - WebContainer for embedding

**Property:**
- `ContentArea` - Currently visible container

---

## 5. Authentication Containers

### 5.1 wc_Login
**Artifact:** `echoscore_wc_login`
- User login with SHA2-256 authentication
- Redirects to AdminHome or UserHome based on role
- Link to password reset

### 5.2 wc_ForgotPassword
**Artifact:** `echoscore_wc_forgotpassword`
- Email validation
- Sends OTP via email
- Auto-navigates to OTP entry

### 5.3 wc_EnterOTP
**Artifact:** `echoscore_wc_enterotp`
- 6-digit OTP verification
- Resend OTP functionality
- Validates against database

### 5.4 wc_NewPassword
**Artifact:** `echoscore_wc_newpassword`
- Password strength validation (8+ chars, upper, lower, number)
- Confirmation matching
- Updates password and marks token as used

---

## 6. Student Containers

### 6.1 wc_UserHome
**Artifact:** `echoscore_wc_userhome`
- Dashboard with case list
- Multi-group filtering (only shows accessible cases)
- Shows completion status (Not Started, In Progress, Completed)
- Navigate to wc_CaseReview

### 6.2 wc_CaseReview (3 Parts)
**Artifacts:** 
- `echoscore_wc_casereview_part1` - Properties and video controls
- `echoscore_wc_casereview_part2` - Video display and save/submit
- `echoscore_wc_casereview_part3` - Correct answers and scoring

**Features:**
- Video player with navigation (Previous/Next/Replay)
- Multi-group video filtering
- 12 assessment checkboxes + conclusions
- Save draft or submit for grading
- Color-coded results (green=correct, red=incorrect)
- Score calculation (out of 13)
- Expert conclusions display

---

## 7. Admin Containers

### 7.1 wc_AdminHome
**Artifact:** `echoscore_wc_adminhome`
- Navigation hub for admin functions
- Links to User Management, Case Management, Email Config

### 7.2 wc_UserAdmin (2 Parts)
**Artifacts:**
- `echoscore_wc_useradmin` - Layout and loading
- `echoscore_wc_useradmin_part2` - Button events

**Features:**
- Add/Update/Delete users
- Assign users to groups (auto-generated or custom)
- Filter users by group
- Password optional on update
- Cannot delete own account

---

## 8. Case Management (New Two-Screen Workflow)

### 8.1 dlg_AddCase
**Artifact:** `echoscore_dlg_addcase`
- Dialog for creating new cases
- Auto-increments case numbers (Case 1, Case 2, etc.)
- Creates case with NULL correct answers

### 8.2 wc_CaseList
**Artifact:** `echoscore_wc_caselist`
- Simple list view (Screen 1)
- Double-click to navigate to details
- Delete cases with confirmation

### 8.3 wc_CaseDetails (3 Parts)
**Artifacts:**
- `echoscore_wc_casedetails_p1` - Properties and layout
- `echoscore_wc_casedetails_p2` - Video management
- `echoscore_wc_casedetails_p3` - Upload/delete/undo

**Features:**
- Read-only case info (serial, description)
- Correct answers section with Save/Cancel
- Indeterminate checkbox state for NULL values
- 4-column video list (Filename, Description, Purpose, Order)
- Inline editing for Description, Purpose, Order
- **Multi-group support:** Purpose field accepts comma-separated groups
- Video upload via WebUploader
- Video preview with auto-loop
- Delete videos with confirmation
- **Undo functionality** for video metadata changes

---

## 9. Email Configuration

### 9.1 wc_EmailConfig
**Artifact:** `echoscore_wc_emailconfig`
- Configure SMTP server settings
- Test email functionality
- Supports Gmail with App Password
- TLS/SSL options

---

## 10. Key Features Summary

### Multi-Group Video Filtering
- **Purpose:** Videos can be assigned to multiple groups
- **Format:** Comma-separated (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")
- **Filtering:** Uses `FIND_IN_SET()` and `LIKE` in SQL
- **Visibility:** Videos with empty purpose are visible to all

### Video Streaming
- Videos stored in `Documents/CaseVideos/`
- `Session.ServeVideo()` creates WebFile with browser-accessible URL
- HTMLViewer displays video with controls
- Auto-loop functionality

### Navigation System
- Custom WebNavigationManager with history
- Back/Forward support
- Automatic container embedding and positioning
- Debug logging

### Security
- SHA2-256 password hashing
- OTP expires in 30 minutes
- Single-use tokens
- Cannot delete own admin account

---

## 11. Setup Instructions

1. **Database:**
   - Run SQL script from `echoscore_database`
   - Update MySQL credentials in Session.Opening

2. **Email:**
   - Configure SMTP in wc_EmailConfig
   - For Gmail: Create App Password (no spaces)

3. **Videos:**
   - Create folder: `Documents/CaseVideos/`
   - Upload MP4 files (H.264 recommended)
   - Ensure folder has write permissions

4. **Default Login:**
   - Username: `admin`
   - Password: `reject66`

---

## 12. Deployment Checklist

- ✅ MySQL database created and configured
- ✅ Email SMTP settings configured
- ✅ CaseVideos folder created with proper permissions
- ✅ Test video playback in browser
- ✅ Test password reset email delivery
- ✅ Create user groups and assign users
- ✅ Upload cases and videos
- ✅ Set correct answers for each case
- ✅ Assign video purposes for group filtering
- ✅ Test student workflow end-to-end

---

## 13. Component Count

**Total Artifacts Created:** 28

- Database: 1
- Core Classes: 3
- Modules: 2
- WebPage: 1
- WebDialogs: 1
- WebContainers: 20 (some split into multiple parts)

**Lines of Code:** ~5,000+ (estimated)

---

## 14. Technology Stack

- **Language:** Xojo 2025 r2
- **Database:** MySQL 8.0+
- **Video Format:** MP4 (H.264)
- **Email:** SMTP with TLS
- **Authentication:** SHA2-256 hashing
- **UI Framework:** Xojo Web 2.0

---

## 15. Support & Maintenance

**Database Maintenance:**
- Run `CleanupExpiredTokens()` periodically
- Monitor video folder size
- Backup database regularly

**User Management:**
- Update user groups each quarter
- Remove inactive users
- Monitor password reset requests

**Video Management:**
- Keep video files under 50MB for best performance
- Use consistent naming convention
- Test videos in multiple browsers

---

*End of Complete Component List*