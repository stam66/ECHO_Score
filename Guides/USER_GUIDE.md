# ECHOScore — User Guide

Welcome to **ECHOScore**, a web-based platform for learning and assessing echocardiography skills through brief looping video clips and structured answers.

This guide covers how to sign in, review cases, record answers, and view your progress.

> _App version:_ Xojo Web app (2025 r2) • Database: MySQL 8+

---

## 1) Getting Started

### 1.1 Browser support
- Chrome, Edge, Firefox, and Safari (latest versions) are supported.
- Enable cookies and JavaScript.

### 1.2 Sign in
1. Go to the app URL provided by your instructor/administrator.
2. Enter your **Username** and **Password** on the **Login** screen.
3. Select **Sign in**.

> Forgot your password? Use **“Forgot Password”** and follow the emailed instructions (see §1.3).

### 1.3 Password reset
- Click **Forgot Password** on the login page.
- Enter the email associated with your account.
- You’ll receive:
  - a one-time passcode (OTP), and
  - a reset link.
- Enter the OTP, then set a new password.

If you don’t receive the email, check spam or contact your admin.

---

## 2) Home & Navigation

After sign-in you’ll land on **Home**. From here you can:
- See your assignments (cases available to your **group(s)**).
- Resume incomplete cases.
- Review completed case summaries.
- Start new cases.

Navigation highlights:
- **Back / Forward**: move through your navigation history in the session.
- **Home**: return to your dashboard.
- **Logout**: end your session safely.

> If your session is idle, it may time out. Simply sign in again to continue where you left off.

---

## 3) Working Through a Case

### 3.1 Case overview
Each **case** contains ~10 short looping echocardiography **videos** plus a checklist of findings. Videos are presented in order and can be replayed as needed.

### 3.2 Video playback
- Videos play in your browser (HTML5).
- Use the on‑screen controls to play/pause and loop.
- If a video stutters, ensure a stable connection and try again.

### 3.3 Recording answers
For each case, complete the structured checklist. Typical prompts include:
- **LV size** (dilated / not dilated)
- **LV function** (significantly impaired / not)
- **RV size** (dilated / not)
- **RV function** (significantly impaired / not)
- **Valve disease significance** (AS/AR/MS/MR/TS/TR)
- **Pericardial effusion** (significant / not)
- **IVC suggesting high RA pressure** (yes / no)
- **Does this case require a full echo?** (yes / no)
- **Conclusions** (free text)

Tips:
- Your selections are saved when you **Save** or **Submit** (see below).
- You can move between videos at any time.

### 3.4 Saving vs Submitting
- **Save**: stores your current answers; you can come back later.
- **Submit**: finalises the case for scoring/review (you may be locked from further edits, depending on admin settings).

### 3.5 Feedback & scoring
- Where enabled, you’ll see whether your answers match the reference answers.
- Admins may release feedback later; if you don’t see feedback, check with your instructor.

---

## 4) Progress & Results

From **Home**, open **Progress / Results** to see:
- Completed cases
- In‑progress cases
- Scores (if enabled)
- Dates & time spent

You can reopen **saved** (not yet submitted) cases to finish them.

---

## 5) Account & Support

### 5.1 Updating your details
- If user self‑service is enabled, you can update your **name** or **email** from your profile area.
- For username or group changes, contact your admin.

### 5.2 Logging out
Use **Logout** in the top‑right menu. This is recommended on shared or public computers.

### 5.3 Getting help
- For access issues or missing cases, contact your instructor/admin.
- For technical problems (video won’t play, errors), note the time and the case number and share with your admin.

---

## 6) Privacy & Security

- Your account is personal—don’t share your password.
- Data is stored in a MySQL database controlled by your institution.
- Cases may contain sensitive clinical data; do not download or redistribute content without permission.
