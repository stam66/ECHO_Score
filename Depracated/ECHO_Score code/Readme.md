# ECHOScore

A web-based echocardiography teaching and assessment platform built with Xojo 2025 r2.

## Overview

ECHOScore provides a comprehensive system for teaching and testing echocardiography interpretation skills. Students can review video cases and submit assessments, while administrators manage cases, users, and video content with sophisticated group-based access control.

### Key Features

- 🎥 **Video-Based Learning** - Stream echocardiography videos with browser-based playback
- 📊 **Automated Grading** - Instant feedback with color-coded results
- 👥 **Multi-Group Support** - Assign videos to multiple student groups simultaneously
- 🔐 **Secure Authentication** - SHA2-256 password hashing with OTP-based password reset
- 📧 **Email Integration** - SMTP-based notifications and password resets
- 🎯 **Progress Tracking** - Monitor student completion and performance
- 🛠️ **Admin Management** - Comprehensive tools for case, user, and video management

---

## Table of Contents

- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Usage](#usage)
  - [Admin Workflow](#admin-workflow)
  - [Student Workflow](#student-workflow)
- [Architecture](#architecture)
- [Components](#components)
- [Multi-Group Video Filtering](#multi-group-video-filtering)
- [API Reference](#api-reference)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## System Requirements

### Server Requirements
- **Xojo** 2025 r2 or later
- **MySQL** 8.0 or later
- **Web Server** capability (Xojo Web 2.0)
- **PHP** (optional, for deployment)

### Client Requirements
- Modern web browser with HTML5 video support
- JavaScript enabled
- Minimum 1024x768 screen resolution

### Storage Requirements
- Database: ~50MB (for moderate use)
- Video storage: Variable (depends on case count)
- Recommended: 10GB+ for video files

---

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/echoscore.git
cd echoscore
```

### 2. Install Dependencies

Ensure you have:
- Xojo 2025 r2 installed
- MySQL server running
- Access to an SMTP server for email functionality

### 3. Create Video Storage Directory

```bash
mkdir -p ~/Documents/CaseVideos
chmod 755 ~/Documents/CaseVideos
```

---

## Database Setup

### 1. Create the Database

Run the SQL script located in the `database` artifact:

```sql
CREATE DATABASE IF NOT EXISTS echoscore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE echoscore;

-- Copy the complete SQL from the echoscore_database artifact
```

### 2. Configure Database Connection

In `Session.Opening` event, update the connection parameters:

```xojo
DB = New MySQLCommunityServer
DB.Host = "127.0.0.1"
DB.Port = 3306
DB.DatabaseName = "echoscore"
DB.UserName = "root"
DB.Password = "your_mysql_root_password"  // UPDATE THIS
```

### 3. Default Admin Account

The database comes with a default admin account:
- **Username:** `admin`
- **Password:** `reject66`

⚠️ **Important:** Change this password immediately after first login!

---

## Configuration

### Email Configuration

1. Log in as admin
2. Navigate to **Email Configuration**
3. Enter SMTP settings:
   - **Server:** smtp.gmail.com (for Gmail)
   - **Port:** 587 (TLS) or 465 (SSL)
   - **Username:** Your email address
   - **Password:** App-specific password (for Gmail)
   - **From Email:** noreply@yourdomain.com
   - **From Name:** ECHOScore System

#### Gmail Setup
1. Enable 2-Factor Authentication
2. Generate App Password: [Google Account Settings](https://myaccount.google.com/apppasswords)
3. Use the 16-character app password (no spaces)

### Video Configuration

Videos must be:
- **Format:** MP4 (H.264 codec recommended)
- **Location:** `~/Documents/CaseVideos/`
- **Naming:** Descriptive names (e.g., `apical_4ch_normal.mp4`)
- **Size:** Under 50MB for optimal streaming

---

## Usage

### Admin Workflow

#### Creating Cases

1. Navigate to **Manage Cases**
2. Click **New Case**
3. Enter case description
4. Case number is auto-generated (Case 1, Case 2, etc.)

#### Adding Videos

1. Double-click a case to open details
2. Click **Upload Video**
3. Select MP4 file
4. Edit inline to set:
   - **View Description:** e.g., "Apical 4-Chamber"
   - **Purpose:** Comma-separated groups (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")
   - **Order:** Display sequence (0, 1, 2, etc.)

#### Setting Correct Answers

1. In case details, check the appropriate findings:
   - LV Size, Function
   - RV Size, Function
   - Valve conditions (Stenosis/Regurgitation)
   - Pericardial effusion
   - IVC pressure
2. Enter expert conclusions (free text)
3. Check "Requires Full ECHO?" if applicable
4. Click **Save Answers**

#### Managing Users

1. Navigate to **Manage Users**
2. Create users with:
   - Full name, email, username, password
   - Admin flag (if applicable)
   - **User Group:** e.g., "Cardiology 2025 Q1"
3. Filter by group to manage specific cohorts

### Student Workflow

1. **Login** with provided credentials
2. **Select a case** from the dashboard
   - Only cases with accessible videos appear
3. **Review videos** using Previous/Next/Replay controls
4. **Complete assessment:**
   - Check applicable findings
   - Write conclusions
   - Indicate if full ECHO is needed
5. **Save Draft** (can return later) or **Submit** (final)
6. **View Results:**
   - Color-coded answers (green=correct, red=incorrect)
   - Score out of 13
   - Expert conclusions

---

## Architecture

### Technology Stack

```
┌─────────────────────────────────────┐
│         Browser (Client)            │
│  HTML5 Video | JavaScript | CSS     │
└─────────────────┬───────────────────┘
                  │ HTTPS
┌─────────────────▼───────────────────┐
│       Xojo Web Application          │
│  Session Manager | Navigation       │
│  WebContainers | Authentication     │
└─────────────────┬───────────────────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼────┐  ┌────▼─────┐  ┌───▼────┐
│ MySQL  │  │  SMTP    │  │  File  │
│   DB   │  │  Server  │  │ System │
└────────┘  └──────────┘  └────────┘
```

### Component Architecture

```
Session (Global State)
├── WebNavigationManager (Navigation)
├── MySQLCommunityServer (Database)
└── WebContainers
    ├── Authentication
    │   ├── wc_Login
    │   ├── wc_ForgotPassword
    │   ├── wc_EnterOTP
    │   └── wc_NewPassword
    ├── Student
    │   ├── wc_UserHome
    │   └── wc_CaseReview
    └── Admin
        ├── wc_AdminHome
        ├── wc_UserAdmin
        ├── wc_CaseList
        ├── wc_CaseDetails
        └── wc_EmailConfig
```

---

## Components

### Core Classes

#### Session Class
Global application state manager.

**Properties:**
- `CurrentUserID`, `CurrentUserName`, `CurrentUserEmail`, `IsAdmin`
- `DB` - MySQL connection
- `Navigation` - WebNavigationManager instance

**Key Methods:**
- `ServeVideo(filename As String) As WebFile` - Creates streamable video URLs

#### wc_Base Class
Base class for all WebContainers.

**Properties:**
- `ContainerID` - Unique identifier
- `Position` - PositionEnum (Center or TopLeft)

**Methods:**
- `EmbedInto(target As WebContainer)` - Handles container positioning

#### WebNavigationManager
Manages navigation with history support.

**Methods:**
- `NavigateTo(container)` - Navigate to new container
- `NavigateBack()` - Return to previous container
- `NavigateForward()` - Redo navigation

### Modules

#### EmailHelper
Email and OTP functionality.

**Methods:**
- `SendPasswordResetEmail(toEmail, toName, otp, resetLink) As Boolean`
- `GenerateOTP() As String` - Creates 6-digit code
- `GenerateSecureToken() As String` - Creates 64-char token

#### PasswordResetHelper
Password reset token management.

**Methods:**
- `CreatePasswordResetToken(userID, ipAddress) As Dictionary`
- `VerifyOTP(email, otp) As Dictionary`
- `ResetPassword(tokenID, userID, newPassword) As Boolean`
- `CleanupExpiredTokens() As Integer`

---

## Multi-Group Video Filtering

### Overview

Videos can be assigned to multiple student groups, enabling flexible content delivery across different cohorts without duplicating video files.

### How It Works

1. **Admin assigns Purpose:**
   ```
   Cardiology 2025 Q1,ICU 2025 Q1,ED 2025 Q1
   ```

2. **User belongs to group:**
   ```
   User Group: "Cardiology 2025 Q1"
   ```

3. **SQL filtering:**
   ```sql
   SELECT video_filename FROM case_videos 
   WHERE case_id = ? 
   AND (video_purpose IS NULL 
        OR video_purpose = '' 
        OR FIND_IN_SET(?, REPLACE(video_purpose, ' ', '')) > 0 
        OR video_purpose LIKE ?)
   ORDER BY video_order
   ```

4. **Result:** User sees videos matching their group + videos with no purpose set

### Example Scenarios

#### Scenario 1: Shared Foundational Content
```
Video: "Basic Apical 4-Chamber"
Purpose: "Cardiology 2025 Q1,ICU 2025 Q1,Medicine 2025 Q1"
Result: Visible to all three groups
```

#### Scenario 2: Specialty-Specific Content
```
Video: "Advanced Strain Imaging"
Purpose: "Cardiology 2025 Q1"
Result: Only cardiology students see this
```

#### Scenario 3: Universal Content
```
Video: "Introduction to Echo"
Purpose: (empty)
Result: All users see this, regardless of group
```

### Benefits

- ✅ No duplicate video files
- ✅ Run multiple cohorts simultaneously
- ✅ Mix shared and specialized content
- ✅ Flexible group management
- ✅ Easy content updates

---

## API Reference

### Session.ServeVideo()

Creates a browser-accessible URL for video streaming.

```xojo
Function ServeVideo(filename As String) As WebFile
```

**Parameters:**
- `filename` - Name of video file in CaseVideos folder

**Returns:**
- `WebFile` object with `.URL` property, or `Nil` if not found

**Example:**
```xojo
Var wf As WebFile = Session.ServeVideo("apical_4ch.mp4")
If wf <> Nil Then
  Var videoURL As String = wf.URL
  // Use videoURL in HTMLViewer
End If
```

### PasswordResetHelper.CreatePasswordResetToken()

Generates OTP and token for password reset.

```xojo
Function CreatePasswordResetToken(userID As Integer, ipAddress As String) As Dictionary
```

**Returns Dictionary:**
- `success` (Boolean)
- `otp` (String) - 6-digit code
- `token` (String) - 64-char token
- `error` (String) - Only if success=False

**Example:**
```xojo
Var result As Dictionary = PasswordResetHelper.CreatePasswordResetToken(123, "192.168.1.1")
If result.Value("success") Then
  Var otp As String = result.Value("otp")
  // Send OTP via email
End If
```

---

## Troubleshooting

### Video Playback Issues

**Problem:** Videos not displaying

**Solutions:**
1. Check video file exists in `~/Documents/CaseVideos/`
2. Verify MP4 format with H.264 codec
3. Check file permissions (644 or 755)
4. Review browser console for errors
5. Test with a small sample video first

**Problem:** Video stutters or buffers

**Solutions:**
1. Reduce video file size (target < 20MB)
2. Use H.264 codec with lower bitrate
3. Check network bandwidth
4. Consider CDN for production deployment

### Email Issues

**Problem:** Password reset emails not sending

**Solutions:**
1. Verify SMTP credentials in Email Configuration
2. For Gmail, ensure App Password is used (not regular password)
3. Check firewall allows outbound port 587/465
4. Test with "Send Test Email" button
5. Review Xojo debug log for SMTP errors

**Problem:** Emails go to spam

**Solutions:**
1. Configure SPF/DKIM records for your domain
2. Use a professional email service
3. Ensure "From Email" matches authenticated domain

### Database Issues

**Problem:** Connection failed

**Solutions:**
1. Verify MySQL server is running
2. Check credentials in `Session.Opening`
3. Ensure database user has proper permissions
4. Test connection with MySQL Workbench
5. Check firewall allows port 3306

**Problem:** Query errors

**Solutions:**
1. Run database migrations in correct order
2. Verify all tables exist
3. Check for NULL handling in queries
4. Review MySQLPreparedStatement binding

### Authentication Issues

**Problem:** Cannot login

**Solutions:**
1. Verify username/password correct
2. Check SHA2 hash in database
3. Reset admin password via SQL:
   ```sql
   UPDATE users 
   SET password_hash = SHA2('newpassword', 256) 
   WHERE username = 'admin';
   ```

---

## Development

### Building from Source

1. Open project in Xojo 2025 r2
2. Configure build settings for Web
3. Set target platform (Standalone or CGI)
4. Build and test locally
5. Deploy to web server

### Running Tests

```bash
# Unit tests (if implemented)
xojo_test test_suite.xojo_binary_project

# Manual testing checklist:
# ☐ Admin can create cases
# ☐ Admin can upload videos
# ☐ Admin can set correct answers
# ☐ Students can view assigned cases only
# ☐ Students can submit assessments
# ☐ Scoring calculates correctly
# ☐ Password reset emails deliver
# ☐ Video playback works in multiple browsers
```

### Code Style

- Use descriptive variable names
- Comment complex logic
- Follow Xojo naming conventions
- Handle all exceptions with Try/Catch
- Log errors to System.DebugLog
- Validate user input

---

## Deployment

### Production Checklist

- [ ] Change default admin password
- [ ] Configure production SMTP settings
- [ ] Set up SSL/TLS certificate
- [ ] Configure backup schedule
- [ ] Set up monitoring/logging
- [ ] Test video streaming under load
- [ ] Document admin procedures
- [ ] Train users

### Security Recommendations

1. **Database:**
   - Use strong MySQL root password
   - Create dedicated database user with minimal permissions
   - Enable MySQL SSL connections
   - Regular backups (daily recommended)

2. **Application:**
   - Force HTTPS in production
   - Keep Xojo updated
   - Sanitize all user input
   - Use parameterized queries (already implemented)
   - Implement rate limiting for login attempts

3. **Server:**
   - Keep OS updated
   - Configure firewall (only ports 80, 443, 3306)
   - Use fail2ban for brute force protection
   - Regular security audits

---

## Performance Optimization

### Database

```sql
-- Add indexes for frequent queries
CREATE INDEX idx_user_responses_user ON user_responses(user_id);
CREATE INDEX idx_user_responses_case ON user_responses(case_id);
CREATE INDEX idx_case_videos_purpose ON case_videos(video_purpose(100));
```

### Video Delivery

- Use CDN for video hosting (production)
- Implement adaptive bitrate streaming
- Cache video metadata
- Consider video transcoding service

### Caching

- Cache user groups in session
- Cache case lists for students
- Use database query cache
- Implement Redis for session management (optional)

---

## Maintenance

### Regular Tasks

**Daily:**
- Monitor application logs
- Check video storage capacity

**Weekly:**
- Review user registrations
- Clean up expired password tokens:
  ```sql
  DELETE FROM password_reset_tokens 
  WHERE expires_at < NOW() AND is_used = FALSE;
  ```

**Monthly:**
- Database backup verification
- Review user activity reports
- Update user groups for new cohorts

**Quarterly:**
- Software updates (Xojo, MySQL)
- Security audit
- Performance review
- User feedback collection

---

## Contributing

We welcome contributions! Please follow these guidelines:

### Reporting Issues

1. Check existing issues first
2. Provide detailed description
3. Include steps to reproduce
4. Attach screenshots if applicable
5. Specify Xojo version and OS

### Submitting Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Review Process

- All PRs require review
- Must pass automated tests (if implemented)
- Follow existing code style
- Update documentation as needed

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Support

- **Documentation:** [GitHub Wiki](https://github.com/yourusername/echoscore/wiki)
- **Issues:** [GitHub Issues](https://github.com/yourusername/echoscore/issues)
- **Email:** support@echoscore.example.com

---

## Acknowledgments

- Built with [Xojo](https://www.xojo.com/)
- Video playback powered by HTML5
- Icons from [Lucide Icons](https://lucide.dev/) (if applicable)

---

## Changelog

### Version 1.0.0 (2025-10-12)
- Initial release
- Multi-group video filtering
- Student assessment system
- Admin management tools
- Password reset via OTP
- Email integration

---

**Made with ❤️ for medical education**