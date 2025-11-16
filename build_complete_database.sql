-- =====================================================
-- ECHOScore Complete Database Build Script
-- Creates entire database structure from scratch
-- Safe to run multiple times (uses IF NOT EXISTS)
-- Based on local development schema
-- =====================================================

-- Use the database
USE `echoscore`;

SELECT '================================================' AS '';
SELECT '=== ECHOScore Database Build ===' AS '';
SELECT '=== Creating all tables ===' AS '';
SELECT '================================================' AS '';

-- =====================================================
-- TABLE: access_requests
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: access_requests' AS '';

CREATE TABLE IF NOT EXISTS `access_requests` (
    `request_id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `requested_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `request_status` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`request_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ access_requests' AS result;

-- =====================================================
-- TABLE: available_groups
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: available_groups' AS '';

CREATE TABLE IF NOT EXISTS `available_groups` (
    `group_id` INT AUTO_INCREMENT NOT NULL,
    `group_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `group_category` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `display_order` INT NULL DEFAULT 0,
    `is_active` TINYINT(1) NULL DEFAULT 1,
    `created_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_date` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `created_by` INT NULL DEFAULT NULL,
    `notes` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    PRIMARY KEY (`group_id`),
    UNIQUE KEY `group_name` (`group_name`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ available_groups' AS result;

-- =====================================================
-- TABLE: users
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: users' AS '';

CREATE TABLE IF NOT EXISTS `users` (
    `user_id` INT AUTO_INCREMENT NOT NULL,
    `full_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `username` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `password_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_admin` TINYINT(1) NULL DEFAULT 0,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `user_group` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `last_login` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `username` (`username`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ users' AS result;

-- =====================================================
-- TABLE: cases
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: cases' AS '';

CREATE TABLE IF NOT EXISTS `cases` (
    `case_id` INT AUTO_INCREMENT NOT NULL,
    `serial_number` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `case_label` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `lv_size_dilated` TINYINT NULL DEFAULT NULL,
    `lv_function_impaired` TINYINT NULL DEFAULT NULL,
    `rv_size_dilated` TINYINT NULL DEFAULT NULL,
    `rv_function_impaired` TINYINT NULL DEFAULT NULL,
    `aortic_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `aortic_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `mitral_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `mitral_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `tricuspid_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `tricuspid_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `pericardial_effusion_significant` TINYINT NULL DEFAULT NULL,
    `ivc_high_ra_pressure` TINYINT NULL DEFAULT NULL,
    `correct_conclusions` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `requires_full_echo` TINYINT NULL DEFAULT NULL,
    `case_groups` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Comma-separated list of groups this case is assigned to',
    PRIMARY KEY (`case_id`),
    UNIQUE KEY `serial_number` (`serial_number`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ cases' AS result;

-- =====================================================
-- TABLE: case_videos
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: case_videos' AS '';

CREATE TABLE IF NOT EXISTS `case_videos` (
    `video_id` INT AUTO_INCREMENT NOT NULL,
    `case_id` INT NOT NULL,
    `video_filename` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `stored_filename` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `file_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `view_description` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `video_purpose` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `video_order` INT NULL DEFAULT 0,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`video_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ case_videos' AS result;

-- =====================================================
-- TABLE: user_responses
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: user_responses' AS '';

CREATE TABLE IF NOT EXISTS `user_responses` (
    `response_id` INT AUTO_INCREMENT NOT NULL,
    `user_id` INT NOT NULL,
    `case_id` INT NOT NULL,
    `lv_size_dilated` TINYINT NULL DEFAULT NULL,
    `lv_function_impaired` TINYINT NULL DEFAULT NULL,
    `rv_size_dilated` TINYINT NULL DEFAULT NULL,
    `rv_function_impaired` TINYINT NULL DEFAULT NULL,
    `aortic_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `aortic_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `mitral_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `mitral_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `tricuspid_stenosis_significant` TINYINT NULL DEFAULT NULL,
    `tricuspid_regurgitation_significant` TINYINT NULL DEFAULT NULL,
    `pericardial_effusion_significant` TINYINT NULL DEFAULT NULL,
    `ivc_high_ra_pressure` TINYINT NULL DEFAULT NULL,
    `user_conclusions` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    `requires_full_echo` TINYINT NULL DEFAULT NULL,
    `score` INT NULL DEFAULT NULL,
    `is_completed` TINYINT(1) NULL DEFAULT 0,
    `started_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `completed_at` TIMESTAMP NULL DEFAULT NULL,
    `mcq_score` INT NULL DEFAULT NULL COMMENT 'Score from MCQ questions only',
    `checkbox_score` INT NULL DEFAULT NULL COMMENT 'Score from checkbox questions only',
    `has_mcq_questions` TINYINT(1) NULL DEFAULT 0 COMMENT 'Whether this case includes MCQs',
    PRIMARY KEY (`response_id`),
    UNIQUE KEY `unique_user_case` (`user_id`, `case_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ user_responses' AS result;

-- =====================================================
-- TABLE: password_reset_tokens
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: password_reset_tokens' AS '';

CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
    `token_id` INT AUTO_INCREMENT NOT NULL,
    `user_id` INT NOT NULL,
    `token` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `otp` VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `expires_at` TIMESTAMP NOT NULL,
    `is_used` TINYINT(1) NULL DEFAULT 0,
    `used_at` TIMESTAMP NULL DEFAULT NULL,
    `ip_address` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
    PRIMARY KEY (`token_id`),
    UNIQUE KEY `token` (`token`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ password_reset_tokens' AS result;

-- =====================================================
-- TABLE: email_config
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: email_config' AS '';

CREATE TABLE IF NOT EXISTS `email_config` (
    `config_id` INT AUTO_INCREMENT NOT NULL,
    `smtp_server` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `smtp_port` INT NOT NULL DEFAULT 587,
    `smtp_username` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `smtp_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `from_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `from_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ECHOScore',
    `use_tls` TINYINT(1) NULL DEFAULT 1,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`config_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ email_config' AS result;

-- =====================================================
-- TABLE: mcq_questions
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: mcq_questions' AS '';

CREATE TABLE IF NOT EXISTS `mcq_questions` (
    `question_id` INT AUTO_INCREMENT NOT NULL,
    `case_id` INT NOT NULL,
    `question_text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `order_num` INT NULL DEFAULT 0 COMMENT 'Display order within case (0-based)',
    `question_type` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'single' COMMENT 'single, multiple, numeric',
    `points` INT NULL DEFAULT 1 COMMENT 'Points awarded for correct answer',
    `explanation` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Explanation shown after submission',
    `is_active` TINYINT(1) NULL DEFAULT 1,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`question_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ mcq_questions' AS result;

-- =====================================================
-- TABLE: mcq_options
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: mcq_options' AS '';

CREATE TABLE IF NOT EXISTS `mcq_options` (
    `option_id` INT AUTO_INCREMENT NOT NULL,
    `question_id` INT NOT NULL,
    `option_text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `order_num` INT NULL DEFAULT 0 COMMENT 'Display order (A=0, B=1, C=2, etc)',
    `is_correct` TINYINT(1) NULL DEFAULT 0 COMMENT 'Whether this is a correct answer',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`option_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ mcq_options' AS result;

-- =====================================================
-- TABLE: user_mcq_responses
-- =====================================================
SELECT '' AS '';
SELECT 'Creating: user_mcq_responses' AS '';

CREATE TABLE IF NOT EXISTS `user_mcq_responses` (
    `response_id` INT AUTO_INCREMENT NOT NULL,
    `user_response_id` INT NOT NULL COMMENT 'Links to user_responses.response_id',
    `question_id` INT NOT NULL,
    `selected_option_ids` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Comma-separated option_ids',
    `is_correct` TINYINT(1) NULL DEFAULT NULL COMMENT 'Whether the response is correct',
    `points_earned` INT NULL DEFAULT 0 COMMENT 'Points earned for this question',
    `answered_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`response_id`)
) CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
  ENGINE = InnoDB;

SELECT '✓ user_mcq_responses' AS result;

-- =====================================================
-- INDEXES: Add all indexes
-- =====================================================
SELECT '' AS '';
SELECT '=== Creating Indexes ===' AS '';

-- available_groups indexes
CREATE INDEX IF NOT EXISTS `idx_active` ON `available_groups` (`is_active`);
CREATE INDEX IF NOT EXISTS `idx_category` ON `available_groups` (`group_category`);
CREATE INDEX IF NOT EXISTS `idx_group_name` ON `available_groups` (`group_name`);
SELECT '✓ available_groups indexes' AS result;

-- case_videos indexes
CREATE INDEX IF NOT EXISTS `idx_case` ON `case_videos` (`case_id`);
CREATE INDEX IF NOT EXISTS `idx_video_purpose` ON `case_videos` (`video_purpose`(100));
SELECT '✓ case_videos indexes' AS result;

-- cases indexes
CREATE INDEX IF NOT EXISTS `idx_case_groups` ON `cases` (`case_groups`(100));
CREATE INDEX IF NOT EXISTS `idx_serial` ON `cases` (`serial_number`);
SELECT '✓ cases indexes' AS result;

-- mcq_options indexes
CREATE INDEX IF NOT EXISTS `idx_correct` ON `mcq_options` (`is_correct`);
CREATE INDEX IF NOT EXISTS `idx_question_options` ON `mcq_options` (`question_id`, `order_num`);
SELECT '✓ mcq_options indexes' AS result;

-- mcq_questions indexes
CREATE INDEX IF NOT EXISTS `idx_active` ON `mcq_questions` (`is_active`);
CREATE INDEX IF NOT EXISTS `idx_case_questions` ON `mcq_questions` (`case_id`, `order_num`);
SELECT '✓ mcq_questions indexes' AS result;

-- password_reset_tokens indexes
CREATE INDEX IF NOT EXISTS `idx_expires` ON `password_reset_tokens` (`expires_at`);
CREATE INDEX IF NOT EXISTS `idx_token` ON `password_reset_tokens` (`token`);
CREATE INDEX IF NOT EXISTS `idx_user` ON `password_reset_tokens` (`user_id`);
SELECT '✓ password_reset_tokens indexes' AS result;

-- user_mcq_responses indexes
CREATE INDEX IF NOT EXISTS `idx_question` ON `user_mcq_responses` (`question_id`);
CREATE INDEX IF NOT EXISTS `idx_user_response` ON `user_mcq_responses` (`user_response_id`);
SELECT '✓ user_mcq_responses indexes' AS result;

-- user_responses indexes
CREATE INDEX IF NOT EXISTS `idx_case` ON `user_responses` (`case_id`);
CREATE INDEX IF NOT EXISTS `idx_has_mcq` ON `user_responses` (`has_mcq_questions`);
CREATE INDEX IF NOT EXISTS `idx_user` ON `user_responses` (`user_id`);
SELECT '✓ user_responses indexes' AS result;

-- users indexes
CREATE INDEX IF NOT EXISTS `idx_email` ON `users` (`email`);
CREATE INDEX IF NOT EXISTS `idx_is_active` ON `users` (`is_active`);
CREATE INDEX IF NOT EXISTS `idx_user_group` ON `users` (`user_group`);
CREATE INDEX IF NOT EXISTS `idx_username` ON `users` (`username`);
SELECT '✓ users indexes' AS result;

-- =====================================================
-- CONSTRAINTS: Add unique constraints
-- =====================================================
SELECT '' AS '';
SELECT '=== Creating Unique Constraints ===' AS '';

-- Check and add unique constraint on user_mcq_responses
SET @constraint_exists = 0;
SELECT COUNT(*) INTO @constraint_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'user_mcq_responses' 
AND constraint_name = 'unique_user_question'
AND constraint_type = 'UNIQUE';

SET @sql = IF(@constraint_exists = 0,
    'ALTER TABLE `user_mcq_responses` ADD CONSTRAINT `unique_user_question` UNIQUE (`user_response_id`, `question_id`)',
    'SELECT "unique_user_question already exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ Unique constraints' AS result;

-- =====================================================
-- FOREIGN KEYS: Add all foreign key constraints
-- =====================================================
SELECT '' AS '';
SELECT '=== Creating Foreign Key Constraints ===' AS '';

-- Helper function to add FK if not exists
-- case_videos -> cases
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'case_videos' 
AND constraint_name = 'case_videos_ibfk_1';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `case_videos` ADD CONSTRAINT `case_videos_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`) ON DELETE CASCADE',
    'SELECT "FK case_videos_ibfk_1 exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: case_videos -> cases' AS result;

-- mcq_questions -> cases
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'mcq_questions' 
AND constraint_name = 'fk_mcq_case';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `mcq_questions` ADD CONSTRAINT `fk_mcq_case` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`) ON DELETE CASCADE',
    'SELECT "FK fk_mcq_case exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: mcq_questions -> cases' AS result;

-- mcq_options -> mcq_questions
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'mcq_options' 
AND constraint_name = 'fk_option_question';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `mcq_options` ADD CONSTRAINT `fk_option_question` FOREIGN KEY (`question_id`) REFERENCES `mcq_questions` (`question_id`) ON DELETE CASCADE',
    'SELECT "FK fk_option_question exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: mcq_options -> mcq_questions' AS result;

-- user_mcq_responses -> mcq_questions
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'user_mcq_responses' 
AND constraint_name = 'fk_mcq_question';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `user_mcq_responses` ADD CONSTRAINT `fk_mcq_question` FOREIGN KEY (`question_id`) REFERENCES `mcq_questions` (`question_id`) ON DELETE CASCADE',
    'SELECT "FK fk_mcq_question exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: user_mcq_responses -> mcq_questions' AS result;

-- user_mcq_responses -> user_responses
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'user_mcq_responses' 
AND constraint_name = 'fk_mcq_user_response';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `user_mcq_responses` ADD CONSTRAINT `fk_mcq_user_response` FOREIGN KEY (`user_response_id`) REFERENCES `user_responses` (`response_id`) ON DELETE CASCADE',
    'SELECT "FK fk_mcq_user_response exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: user_mcq_responses -> user_responses' AS result;

-- password_reset_tokens -> users
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'password_reset_tokens' 
AND constraint_name = 'password_reset_tokens_ibfk_1';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `password_reset_tokens` ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE',
    'SELECT "FK password_reset_tokens_ibfk_1 exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: password_reset_tokens -> users' AS result;

-- user_responses -> users
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'user_responses' 
AND constraint_name = 'user_responses_ibfk_1';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `user_responses` ADD CONSTRAINT `user_responses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE',
    'SELECT "FK user_responses_ibfk_1 exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: user_responses -> users' AS result;

-- user_responses -> cases
SET @fk_exists = 0;
SELECT COUNT(*) INTO @fk_exists 
FROM information_schema.table_constraints 
WHERE table_schema = DATABASE()
AND table_name = 'user_responses' 
AND constraint_name = 'user_responses_ibfk_2';

SET @sql = IF(@fk_exists = 0,
    'ALTER TABLE `user_responses` ADD CONSTRAINT `user_responses_ibfk_2` FOREIGN KEY (`case_id`) REFERENCES `cases` (`case_id`) ON DELETE CASCADE',
    'SELECT "FK user_responses_ibfk_2 exists" AS result');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT '✓ FK: user_responses -> cases' AS result;

-- =====================================================
-- BUILD COMPLETE
-- =====================================================

SELECT '' AS '';
SELECT '================================================' AS '';
SELECT '=== DATABASE BUILD COMPLETE ===' AS '';
SELECT '================================================' AS '';

-- Show summary
SELECT 
    (SELECT COUNT(*) FROM information_schema.tables 
     WHERE table_schema = DATABASE()) AS total_tables,
    (SELECT COUNT(*) FROM information_schema.columns
     WHERE table_schema = DATABASE()) AS total_columns,
    (SELECT COUNT(DISTINCT table_name) FROM information_schema.statistics 
     WHERE table_schema = DATABASE()) AS tables_with_indexes,
    (SELECT COUNT(*) FROM information_schema.table_constraints
     WHERE table_schema = DATABASE() 
     AND constraint_type = 'FOREIGN KEY') AS total_foreign_keys;

SELECT '✓ All tables created' AS '';
SELECT '✓ All indexes created' AS '';
SELECT '✓ All foreign keys created' AS '';
SELECT '' AS '';
SELECT 'Database structure is complete and ready to use!' AS '';
SELECT 'Run migration_validation.sql to verify' AS '';
