# ECHOScore — Admin Guide

This guide explains installation, configuration, user/case management, email/OTP setup, and maintenance tasks for the **ECHOScore** Xojo Web application.

> _App version:_ Xojo Web (2025 r2) • MySQL 8+ • Default DB: `echoscore`

---

## 1) System Architecture

- **Frontend**: Xojo Web UI (single-page shell: `wp_MainShell`) swapping `WebContainer`s
  - **User containers**: Login, Forgot/OTP/New Password, User Home, Case Review
  - **Admin containers**: Admin Home, Case List, Case Details, User Admin, Progress Review, Email Config
- **Backend**: Xojo session code connects to MySQL (see `Session.Opening`).
- **Storage**: Case videos folder on the server: `~/Documents/CaseVideos` (auto‑created on first run).
- **Email**: SMTP settings persisted in table `email_config` (used by `EmailHelper` and `PasswordResetHelper`).

### 1.1 Database schema (tables)
From **`DB schema.sql`**:
- `users`
- `cases`
- `case_videos`
- `user_responses`
- `password_reset_tokens`
- `email_config`

---

## 2) Install & First Run

### 2.1 Prerequisites
- **Xojo 2025 r2** (or matching version used to build)
- **MySQL 8+**
- An SMTP account for password reset emails (recommended)

### 2.2 Database
1. Create the database and tables:
   ```sql
   -- On your MySQL server
   SOURCE "DB schema.sql";
   ```
2. Verify tables:
   ```sql
   SHOW TABLES;
   -- Expect: users, cases, case_videos, user_responses, password_reset_tokens, email_config
   ```

### 2.3 Configure the app to reach MySQL
In `Session.Opening` (already present in the project):
```xojo
DB = New MySQLCommunityServer
DB.Host = "127.0.0.1"
DB.Port = 3306
DB.DatabaseName = "echoscore"
DB.UserName = "admin"
DB.Password = "<choose_a_secure_password>"
If Not DB.Connect Then
  MessageBox("Database connection failed: " + DB.ErrorMessage)
  Return
End If
```
> **Important**: Replace hard‑coded production credentials. Prefer secure injection (environment variables or an encrypted config file read at runtime).

### 2.4 Video storage
- The app creates `~/Documents/CaseVideos` on first run.
- Copy your MP4s into this folder.
- Each video is linked to a case via the **Admin → Cases** UI (or via SQL in `case_videos`).

### 2.5 Default admin account
- **Username:** `admin`  
- **Password:** `<choose_a_secure_password>`  
> *(Set during initial deployment; credentials are not distributed in code.)*

---

## 3) Admin UI Overview

### 3.1 Admin Home
Shortcuts to:
- **Email Configuration**
- **User Administration**
- **Case Management**
- **Progress Review**
