# ECHOScore - Medical Education Platform for Echocardiography Assessment

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Xojo%20Web-green.svg)
![Database](https://img.shields.io/badge/database-MySQL%208.0%2B-orange.svg)

**ECHOScore** is a comprehensive web-based medical education platform designed for teaching and assessing echocardiography interpretation skills. Built with Xojo Web, it provides a complete case management system with video-based assessments, automated scoring, and robust group management.

---

## 🎯 Overview

ECHOScore allows medical educators to create echocardiography cases with multiple video clips, assign them to student groups, and automatically grade student assessments against expert-defined correct answers. Students review cases, make clinical assessments, and receive immediate color-coded feedback with detailed scoring.

### Key Features

- **📹 Video-Based Case Management** - Upload and organize echocardiography video clips
- **👥 Group-Based Access Control** - Assign cases to specific rotation groups (e.g., "Cardiology 2025 Q1")
- **✅ Automated Assessment & Grading** - 13-point scoring system with instant feedback
- **🎨 Color-Coded Results** - Green (correct) / Red (incorrect) visual feedback
- **📊 Progress Tracking** - Monitor student completion and scores
- **🔐 Secure Authentication** - SHA2-256 password hashing with reset functionality
- **📧 Email Integration** - SMTP-based password reset with OTP verification
- **🔄 Draft Saving** - Students can save progress and return later
- **↩️ Navigation History** - Persistent back button with navigation stack

---

## 🏗️ Architecture

### Technology Stack

- **Framework**: Xojo 2025 r2 (Web Application)
- **Database**: MySQL 8.0+
- **Video Storage**: File system (MP4 format)
- **Email**: SMTP with TLS/SSL support

### Application Structure

```
ECHOScore/
├── Session (WebSession)
│   ├── Database connection
│   ├── User authentication
│   ├── Navigation management
│   └── Video file serving
├── Core Classes
│   ├── WebNavigationManager - History stack & navigation
│   └── wc_Base - Parent class for all containers
├── Modules
│   ├── EmailHelper - SMTP email sending
│   └── PasswordResetHelper - Token/OTP management
├── Pages
│   └── wp_MainShell - Main page with content placeholder
├── Authentication Containers
│   ├── wc_Login
│   ├── wc_ForgotPassword
│   ├── wc_EnterOTP
│   └── wc_NewPassword
├── Admin Containers
│   ├── wc_AdminHome
│   ├── wc_UserAdmin - User management
│   ├── wc_EmailConfig - SMTP configuration
│   ├── wc_CaseList - Case list view
│   └── wc_CaseDetails - Case editor with videos
└── Student Containers
    ├── wc_UserHome - My cases dashboard
    └── wc_CaseReview - Video review & assessment
```

---

## 📋 Features in Detail

### For Administrators

#### User Management
- Create, edit, and delete user accounts
- Assign users to rotation groups (e.g., "Cardiology 2025 Q1")
- Set admin privileges
- Filter users by group

#### Case Management
- Create cases with auto-generated serial numbers (Case001, Case002, etc.)
- Upload multiple video clips per case
- Edit video descriptions and display order
- Define correct answers for 12 clinical findings:
  - LV Size & Function
  - RV Size & Function
  - Aortic Valve (Stenosis & Regurgitation)
  - Mitral Valve (Stenosis & Regurgitation)
  - Tricuspid Valve (Stenosis & Regurgitation)
  - Pericardial Effusion
  - IVC Assessment
- Add expert conclusions (text)
- Mark if case "Requires Full ECHO"
- Assign cases to multiple groups using tag-based system

#### Email Configuration
- Configure SMTP settings (server, port, credentials)
- Support for TLS/SSL encryption
- Test email functionality
- Used for password reset emails

### For Students

#### Case Access
- View cases assigned to their rotation group
- See completion status: "Not Started", "In Progress", "Completed"
- View scores for completed cases
- Navigate cases with Previous/Next buttons

#### Case Review
- Watch all video clips for a case
- Video controls: Play, Pause, Previous, Next, Replay
- Auto-loop videos for continuous review
- Make assessments on 12 clinical findings
- Write conclusions (free text)
- Indicate if "Requires Full ECHO"
- Save draft (allows indeterminate/unsure answers)
- Submit for grading

#### Immediate Feedback
- Color-coded results (green = correct, red = incorrect)
- Score display: "X/13 (percentage%)"
- View expert conclusions
- Review correct answers

---

## 🗄️ Database Schema

### Core Tables

- **users** - User accounts with SHA2-256 password hashing
- **cases** - Case information with group assignments
- **case_videos** - Video files linked to cases
- **user_responses** - Student assessments and scores
- **email_config** - SMTP configuration
- **password_reset_tokens** - OTP and token management

### Key Features

- **Nullable Columns**: All assessment fields support NULL (indeterminate/unsure)
- **Tag-Based Groups**: Cases use `case_groups TEXT` for comma-separated group assignment
- **Automatic Timestamps**: `created_at` and `updated_at` on all tables
- **Foreign Keys**: Proper relationships with cascade deletes

---

## 🚀 Getting Started

### Prerequisites

- Xojo 2025 r2 or later (with Web Edition license)
- MySQL 8.0 or later
- Web server capable of hosting Xojo CGI applications
- SMTP server for email functionality (optional but recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/echoscore.git
   cd echoscore
   ```

2. **Set up the database**
   ```bash
   mysql -u root -p < ECHOScore_Complete_Database_Schema.sql
   ```

3. **Configure database connection**
   - Open project in Xojo
   - Edit `Session.Opening` event
   - Update database credentials:
     ```xojo
     mDB = New MySQLCommunityServer
     mDB.Host = "localhost"
     mDB.Port = 3306
     mDB.DatabaseName = "echoscore"
     mDB.UserName = "your_username"
     mDB.Password = "your_password"
     ```

4. **Create video storage folder**
   ```bash
   mkdir CaseVideos
   chmod 755 CaseVideos
   ```

5. **Build and deploy**
   - Build as CGI application in Xojo
   - Deploy to your web server
   - Configure web server for CGI execution

6. **Initial login**
   - Username: `admin`
   - Password: `reject66`
   - **⚠️ Change this immediately after first login!**

7. **Configure email (optional)**
   - Login as admin
   - Navigate to Email Configuration
   - Enter SMTP settings
   - Test configuration

---

## 📊 Assessment Scoring System

### 13-Point Scale

Students are scored on 13 questions:

1. **LV Size** - Dilated? (Yes/No)
2. **LV Function** - Significantly Impaired? (Yes/No)
3. **RV Size** - Dilated? (Yes/No)
4. **RV Function** - Significantly Impaired? (Yes/No)
5. **Aortic Valve Stenosis** - Significant? (Yes/No)
6. **Aortic Valve Regurgitation** - Significant? (Yes/No)
7. **Mitral Valve Stenosis** - Significant? (Yes/No)
8. **Mitral Valve Regurgitation** - Significant? (Yes/No)
9. **Tricuspid Valve Stenosis** - Significant? (Yes/No)
10. **Tricuspid Valve Regurgitation** - Significant? (Yes/No)
11. **Pericardial Effusion** - Significant? (Yes/No)
12. **IVC Assessment** - High RA Pressure? (Yes/No)
13. **Requires Full ECHO?** (Yes/No)

### Scoring Logic

- Each correct answer = 1 point
- Maximum score = 13 points
- Both "abnormal" AND "normal" findings are equally weighted
- Rewards accurate identification of normal findings (not just pathology)
- Indeterminate answers (unsaved) = 0 points

### Visual Feedback

- ✅ **Green text** = Correct answer
- ❌ **Red text** = Incorrect answer
- Score displayed as: **"11/13 (84.6%)"**

---

## 🔐 Security Features

### Authentication
- SHA2-256 password hashing (never stored in plain text)
- Session-based authentication
- Role-based access control (Admin/Student)
- Last login timestamp tracking

### Password Reset
- Email verification required
- 6-digit OTP (One-Time Password)
- 15-minute expiration window
- One-time use tokens
- IP address tracking
- Secure token generation (cryptographic randomness)

### Data Protection
- Prepared statements (prevents SQL injection)
- Input validation throughout
- Admin cannot delete own account
- Admin cannot remove own privileges

---

## 🎓 Usage Workflow

### Admin Workflow

1. **Setup**
   - Configure SMTP settings
   - Create user accounts
   - Assign users to groups

2. **Create Case**
   - Add new case (auto-generated serial number)
   - Upload video clips
   - Edit video descriptions and order
   - Define correct answers (12 findings + requires full echo)
   - Add expert conclusions
   - Assign to one or more groups

3. **Monitor Progress**
   - View student completion status
   - Review scores
   - Manage users and cases

### Student Workflow

1. **Login**
   - Enter credentials
   - View assigned cases

2. **Review Case**
   - Select case from list
   - Watch all video clips
   - Use Previous/Next/Replay controls

3. **Complete Assessment**
   - Check all applicable findings
   - Write conclusions
   - Indicate if full echo needed
   - Save draft OR submit

4. **View Results** (after submission)
   - See color-coded feedback
   - Review score and percentage
   - Read expert conclusions
   - Identify learning opportunities

---

## 🎨 User Interface

### Design Principles

- **Clean & Professional** - Medical education focused
- **Responsive Layout** - Adapts to different screen sizes
- **Intuitive Navigation** - Persistent back button, clear hierarchy
- **Visual Feedback** - Color coding, progress indicators
- **Minimal Clicks** - Streamlined workflows

### Key UI Components

- **Persistent Navigation Bar** - Back and Logout buttons always visible
- **Content Area** - Dynamic container embedding
- **Video Player** - Full-screen capable with controls
- **Checkbox Assessments** - Three-state (Yes/No/Indeterminate)
- **List Views** - Sortable, clickable rows
- **Modal Dialogs** - For confirmations and input

---

## 🔧 Technical Implementation

### NULL Checkbox Support

Critical feature allowing "indeterminate" state for unsure answers:

```xojo
' Setting indeterminate state
If chkLVSizeDilated.Indeterminate Then
  ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_NULL)
  ps.Bind(0, Nil)
Else
  ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_TINY)
  ps.Bind(0, chkLVSizeDilated.Value)
End If
```

### Tag-Based Group Management

Flexible group assignment using comma-separated values:

```sql
-- Check if student's group matches any case group
WHERE FIND_IN_SET(?, REPLACE(case_groups, ' ', '')) > 0
   OR case_groups LIKE ?
```

### Video Serving

WebFile-based video delivery for browser compatibility:

```xojo
Function ServeVideo(filename As String) As WebFile
  Var videoFile As FolderItem = CurrentVideoFolder.Child(filename)
  If videoFile.Exists Then
    Var wf As New WebFile
    wf.Data = videoFile.ReadAll
    wf.MIMEType = "video/mp4"
    wf.Filename = filename
    wf.ForceDownload = False
    Return wf
  End If
  Return Nil
End Function
```

### Navigation History Stack

Browser-like back button functionality:

```xojo
' Navigate to new container
Sub NavigateTo(container As wc_Base)
  ' Clear forward history
  If mCurrentIndex < mHistory.LastIndex Then
    For i As Integer = mHistory.LastIndex DownTo mCurrentIndex + 1
      mHistory.RemoveAt(i)
    Next
  End If
  
  ' Add to history
  mHistory.Add(containerInfo)
  mCurrentIndex = mHistory.LastIndex
  
  ' Embed and update navigation
  mainPage.ContentArea.EmbedWithin(container)
  container.UpdateNavigation()
End Sub
```

---

## 📁 Code Statistics

- **Total Lines**: ~4,800 lines
- **Core Infrastructure**: ~1,524 lines
- **Authentication**: ~493 lines
- **Admin Functionality**: ~1,929 lines
- **Student Functionality**: ~802 lines
- **Documentation**: ~271 lines

### Component Breakdown

| Component | Lines | Description |
|-----------|-------|-------------|
| Database Schema | 210 | Complete database structure |
| Session Class | 136 | Database connection & video serving |
| WebNavigationManager | 217 | Navigation history stack |
| wc_Base | 119 | Parent class for containers |
| wp_MainShell | 156 | Main page shell |
| EmailHelper | 188 | SMTP email sending |
| PasswordResetHelper | 298 | Token/OTP management |
| wc_Login | 196 | Authentication |
| Auth Containers | 297 | Password reset flow |
| wc_AdminHome | 214 | Admin dashboard |
| wc_UserAdmin | 458 | User management |
| wc_CaseList | 197 | Case list view |
| wc_CaseDetails | 850 | Case editor (2 parts) |
| wc_UserHome | 231 | Student dashboard |
| wc_CaseReview | 771 | Case review (3 parts) |

---

## 🐛 Known Issues & Limitations

### Current Limitations

1. **Video Format**: Only MP4 supported (browser compatibility)
2. **File Size**: Large video uploads may timeout (server dependent)
3. **Concurrent Editing**: No locking mechanism for simultaneous case edits
4. **Mobile Support**: Optimized for desktop, mobile experience varies
5. **Browser Compatibility**: Tested on Chrome/Firefox/Safari (latest versions)

### Future Enhancements

- [ ] Multi-language support
- [ ] Advanced analytics dashboard
- [ ] Export student progress reports
- [ ] Batch video upload
- [ ] Video compression/optimization
- [ ] DICOM format support
- [ ] Mobile app version
- [ ] Real-time collaboration features
- [ ] Custom assessment templates

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Use single-quote `'` for comments (not `--`)
- Follow Xojo naming conventions (PascalCase for classes, camelCase for variables)
- Include inline documentation for complex logic
- Add usage examples for new features
- Test thoroughly before submitting PR

---

## 📧 Support

For questions, issues, or feature requests:

- **Issues**: [GitHub Issues](https://github.com/yourusername/echoscore/issues)
- **Email**: support@echoscore.example.com
- **Documentation**: See artifact files in `/artifacts` directory

---

## 🙏 Acknowledgments

- Built with [Xojo](https://www.xojo.com/) - Cross-platform development tool
- Database design inspired by medical education best practices
- Video playback implementation leverages modern HTML5 standards

---

## 📚 Additional Resources

- [Xojo Documentation](https://documentation.xojo.com/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Echocardiography Guidelines](https://www.asecho.org/)

---

## 🔄 Version History

### Version 1.0.0 (October 2025)
- Initial release
- Complete case management system
- Automated grading with 13-point scale
- Tag-based group management
- Video-based assessments
- Email-based password reset
- Navigation history stack
- NULL checkbox support for indeterminate answers

---

**Made with ❤️ for medical education**
