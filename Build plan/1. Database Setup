-- Create the database
CREATE DATABASE IF NOT EXISTS echoscore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE echoscore;

-- Users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    INDEX idx_username (username),
    INDEX idx_email (email)
);

-- Cases table
CREATE TABLE cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    serial_number VARCHAR(50) NOT NULL UNIQUE,
    case_label VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lv_size_dilated BOOLEAN,
    lv_function_impaired BOOLEAN,
    rv_size_dilated BOOLEAN,
    rv_function_impaired BOOLEAN,
    aortic_stenosis_significant BOOLEAN,
    aortic_regurgitation_significant BOOLEAN,
    mitral_stenosis_significant BOOLEAN,
    mitral_regurgitation_significant BOOLEAN,
    tricuspid_stenosis_significant BOOLEAN,
    tricuspid_regurgitation_significant BOOLEAN,
    pericardial_effusion_significant BOOLEAN,
    ivc_high_ra_pressure BOOLEAN,
    correct_conclusions TEXT,
    requires_full_echo BOOLEAN,
    INDEX idx_serial (serial_number)
);

-- Case videos table
CREATE TABLE case_videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT NOT NULL,
    video_filename VARCHAR(255) NOT NULL,
    view_description VARCHAR(100),
    video_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (case_id) REFERENCES cases(case_id) ON DELETE CASCADE,
    INDEX idx_case (case_id)
);

-- User responses table
CREATE TABLE user_responses (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    case_id INT NOT NULL,
    lv_size_dilated BOOLEAN,
    lv_function_impaired BOOLEAN,
    rv_size_dilated BOOLEAN,
    rv_function_impaired BOOLEAN,
    aortic_stenosis_significant BOOLEAN,
    aortic_regurgitation_significant BOOLEAN,
    mitral_stenosis_significant BOOLEAN,
    mitral_regurgitation_significant BOOLEAN,
    tricuspid_stenosis_significant BOOLEAN,
    tricuspid_regurgitation_significant BOOLEAN,
    pericardial_effusion_significant BOOLEAN,
    ivc_high_ra_pressure BOOLEAN,
    user_conclusions TEXT,
    requires_full_echo BOOLEAN,
    is_completed BOOLEAN DEFAULT FALSE,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
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

-- Insert default admin user
INSERT INTO users (full_name, email, username, password_hash, is_admin) VALUES ('Administrator', 'admin@echoscore.local', 'admin', 'temp', 1);
UPDATE users SET password_hash = SHA2('reject66', 256) WHERE username = 'admin';

-- Insert default email configuration
INSERT INTO email_config (smtp_server, smtp_port, smtp_username, smtp_password, from_email, from_name, use_tls) VALUES ('smtp.gmail.com', 587, 'your-email@gmail.com', 'your-app-password', 'noreply@echoscore.local', 'ECHOScore System', 1);