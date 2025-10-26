-- =============================================================================
-- ECHOScore Database Setup - Complete Updated Version
-- Includes all fixes and updates from multiple development conversations
-- Run this script to create the complete database structure
-- =============================================================================

CREATE DATABASE IF NOT EXISTS echoscore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE echoscore;

-- Users table (with user_group added for multi-group support)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    user_group VARCHAR(50) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    INDEX idx_username (username),
    INDEX idx_email (email),
    INDEX idx_user_group (user_group)
);

-- Cases table (with case_groups for tag-based group assignment)
CREATE TABLE cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    serial_number VARCHAR(50) NOT NULL UNIQUE,
    case_label VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    case_groups TEXT NULL,
    lv_size_dilated TINYINT NULL,
    lv_function_impaired TINYINT NULL,
    rv_size_dilated TINYINT NULL,
    rv_function_impaired TINYINT NULL,
    aortic_stenosis_significant TINYINT NULL,
    aortic_regurgitation_significant TINYINT NULL,
    mitral_stenosis_significant TINYINT NULL,
    mitral_regurgitation_significant TINYINT NULL,
    tricuspid_stenosis_significant TINYINT NULL,
    tricuspid_regurgitation_significant TINYINT NULL,
    pericardial_effusion_significant TINYINT NULL,
    ivc_high_ra_pressure TINYINT NULL,
    correct_conclusions TEXT,
    requires_full_echo TINYINT NULL,
    INDEX idx_serial (serial_number),
    INDEX idx_case_groups (case_groups(100))
);

-- Case videos table (video_purpose retained for future use)
CREATE TABLE case_videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    video_filename VARCHAR(255) NOT NULL,
    view_description VARCHAR(100),
    video_purpose TEXT NULL,
    video_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (case_id) REFERENCES cases(case_id) ON DELETE CASCADE,
    INDEX idx_case (case_id),
    INDEX idx_video_purpose (video_purpose(100))
);

-- User responses table (with nullable checkboxes for indeterminate state support)
CREATE TABLE user_responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    case_id INT NOT NULL,
    lv_size_dilated TINYINT NULL,
    lv_function_impaired TINYINT NULL,
    rv_size_dilated TINYINT NULL,
    rv_function_impaired TINYINT NULL,
    aortic_stenosis_significant TINYINT NULL,
    aortic_regurgitation_significant TINYINT NULL,
    mitral_stenosis_significant TINYINT NULL,
    mitral_regurgitation_significant TINYINT NULL,
    tricuspid_stenosis_significant TINYINT NULL,
    tricuspid_regurgitation_significant TINYINT NULL,
    pericardial_effusion_significant TINYINT NULL,
    ivc_high_ra_pressure TINYINT NULL,
    user_conclusions TEXT,
    requires_full_echo TINYINT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
    score INT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (case_id) REFERENCES cases(case_id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_case (user_id, case_id),
    INDEX idx_user (user_id),
    INDEX idx_case (case_id)
);

-- Password reset tokens table
CREATE TABLE password_reset_tokens (
    token_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    token VARCHAR(64) NOT NULL UNIQUE,
    otp VARCHAR(6) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    is_used BOOLEAN DEFAULT FALSE,
    used_at TIMESTAMP NULL,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_token (token),
    INDEX idx_user (user_id),
    INDEX idx_expires (expires_at)
);

-- Email configuration table
CREATE TABLE email_config (
    config_id INT AUTO_INCREMENT PRIMARY KEY,
    smtp_server VARCHAR(255) NOT NULL,
    smtp_port INT NOT NULL DEFAULT 587,
    smtp_username VARCHAR(255) NOT NULL,
    smtp_password VARCHAR(255) NOT NULL,
    from_email VARCHAR(255) NOT NULL,
    from_name VARCHAR(255) NOT NULL DEFAULT 'ECHOScore',
    use_tls BOOLEAN DEFAULT TRUE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default admin user (password: reject66)
INSERT INTO users (full_name, email, username, password_hash, is_admin) 
VALUES ('Administrator', 'admin@echoscore.local', 'admin', 'temp', 1);
UPDATE users SET password_hash = SHA2('reject66', 256) WHERE username = 'admin';

-- Insert default email configuration (UPDATE WITH YOUR CREDENTIALS)
INSERT INTO email_config (smtp_server, smtp_port, smtp_username, smtp_password, from_email, from_name, use_tls) 
VALUES ('smtp.gmail.com', 587, 'your-email@gmail.com', 'your-app-password', 'noreply@echoscore.local', 'ECHOScore System', 1);

-- =============================================================================
-- Database Change Summary:
-- =============================================================================
-- 
-- KEY CHANGES FROM ORIGINAL DESIGN:
-- 
-- 1. NULLABLE CHECKBOXES (ALL 13 FIELDS):
--    - All boolean findings fields are now TINYINT NULL instead of BOOLEAN
--    - Supports indeterminate state (NULL) for partially completed assessments
--    - Applies to both cases (admin correct answers) and user_responses tables
--    - Fixed binding errors: use MYSQL_TYPE_NULL when binding Nil
-- 
-- 2. TAG-BASED GROUP MANAGEMENT:
--    - Added cases.case_groups (TEXT) for comma-separated group assignments
--    - Added index on case_groups for performance
--    - Migrated from video-level to case-level group assignment
--    - Students see cases if their user_group matches ANY value in case_groups
-- 
-- 3. VIDEO PURPOSE RETAINED:
--    - video_purpose changed from VARCHAR(50) to TEXT
--    - No longer used for group filtering
--    - Available for future features (skill level, video type tags, etc.)
-- 
-- 4. SCORE TRACKING:
--    - Added user_responses.score (INT NULL) for storing calculated scores
--    - Automatic calculation: 13-point scale (12 findings + requires_full_echo)
-- 
-- 5. PERFORMANCE INDEXES:
--    - Added index on user_group for faster student filtering
--    - Added index on case_groups (first 100 chars) for group matching
--    - Added index on video_purpose (first 100 chars) for future use
-- 
-- =============================================================================
-- Migration Notes:
-- =============================================================================
-- 
-- If upgrading from an earlier version, run these ALTER statements:
-- 
-- ALTER TABLE cases ADD COLUMN case_groups TEXT NULL AFTER updated_at;
-- ALTER TABLE cases ADD INDEX idx_case_groups (case_groups(100));
-- 
-- ALTER TABLE cases 
--   MODIFY COLUMN lv_size_dilated TINYINT NULL,
--   MODIFY COLUMN lv_function_impaired TINYINT NULL,
--   MODIFY COLUMN rv_size_dilated TINYINT NULL,
--   MODIFY COLUMN rv_function_impaired TINYINT NULL,
--   MODIFY COLUMN aortic_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN aortic_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN mitral_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN mitral_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN tricuspid_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN tricuspid_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN pericardial_effusion_significant TINYINT NULL,
--   MODIFY COLUMN ivc_high_ra_pressure TINYINT NULL,
--   MODIFY COLUMN requires_full_echo TINYINT NULL;
-- 
-- ALTER TABLE user_responses 
--   MODIFY COLUMN lv_size_dilated TINYINT NULL,
--   MODIFY COLUMN lv_function_impaired TINYINT NULL,
--   MODIFY COLUMN rv_size_dilated TINYINT NULL,
--   MODIFY COLUMN rv_function_impaired TINYINT NULL,
--   MODIFY COLUMN aortic_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN aortic_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN mitral_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN mitral_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN tricuspid_stenosis_significant TINYINT NULL,
--   MODIFY COLUMN tricuspid_regurgitation_significant TINYINT NULL,
--   MODIFY COLUMN pericardial_effusion_significant TINYINT NULL,
--   MODIFY COLUMN ivc_high_ra_pressure TINYINT NULL,
--   MODIFY COLUMN requires_full_echo TINYINT NULL;
-- 
-- ALTER TABLE user_responses ADD COLUMN score INT NULL AFTER completed_at;
-- 
-- ALTER TABLE case_videos MODIFY COLUMN video_purpose TEXT NULL;
-- 
-- =============================================================================
