-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE DATABASE "echoscore" -----------------------------
CREATE DATABASE IF NOT EXISTS `echoscore` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `echoscore`;
-- ---------------------------------------------------------


-- CREATE TABLE "available_groups" -----------------------------
CREATE TABLE `available_groups`( 
	`group_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`group_name` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
	`group_category` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`display_order` Int( 0 ) NULL DEFAULT 0,
	`is_active` TinyInt( 1 ) NULL DEFAULT 1,
	`created_date` DateTime NULL DEFAULT CURRENT_TIMESTAMP,
	`modified_date` DateTime NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`created_by` Int( 0 ) NULL DEFAULT NULL,
	`notes` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `group_id` ),
	CONSTRAINT `group_name` UNIQUE( `group_name` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 16;
-- -------------------------------------------------------------


-- CREATE TABLE "case_videos" ----------------------------------
CREATE TABLE `case_videos`( 
	`video_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`case_id` Int( 0 ) NOT NULL,
	`video_filename` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`stored_filename` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`file_type` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`view_description` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`video_purpose` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`video_order` Int( 0 ) NULL DEFAULT 0,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `video_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 31;
-- -------------------------------------------------------------


-- CREATE TABLE "cases" ----------------------------------------
CREATE TABLE `cases`( 
	`case_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`serial_number` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`case_label` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`lv_size_dilated` TinyInt( 0 ) NULL DEFAULT NULL,
	`lv_function_impaired` TinyInt( 0 ) NULL DEFAULT NULL,
	`rv_size_dilated` TinyInt( 0 ) NULL DEFAULT NULL,
	`rv_function_impaired` TinyInt( 0 ) NULL DEFAULT NULL,
	`aortic_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`aortic_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`mitral_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`mitral_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`tricuspid_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`tricuspid_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`pericardial_effusion_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`ivc_high_ra_pressure` TinyInt( 0 ) NULL DEFAULT NULL,
	`correct_conclusions` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`requires_full_echo` TinyInt( 0 ) NULL DEFAULT NULL,
	`case_groups` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Comma-separated list of groups this case is assigned to (e.g., "Cardiology 2025 Q1,ICU 2025 Q1")',
	PRIMARY KEY ( `case_id` ),
	CONSTRAINT `serial_number` UNIQUE( `serial_number` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 15;
-- -------------------------------------------------------------


-- CREATE TABLE "email_config" ---------------------------------
CREATE TABLE `email_config`( 
	`config_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`smtp_server` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`smtp_port` Int( 0 ) NOT NULL DEFAULT 587,
	`smtp_username` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`smtp_password` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`from_email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`from_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ECHOScore',
	`use_tls` TinyInt( 1 ) NULL DEFAULT 1,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `config_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 2;
-- -------------------------------------------------------------


-- CREATE TABLE "password_reset_tokens" ------------------------
CREATE TABLE `password_reset_tokens`( 
	`token_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`token` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`otp` VarChar( 6 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`expires_at` Timestamp NOT NULL,
	`is_used` TinyInt( 1 ) NULL DEFAULT 0,
	`used_at` Timestamp NULL DEFAULT NULL,
	`ip_address` VarChar( 45 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	PRIMARY KEY ( `token_id` ),
	CONSTRAINT `token` UNIQUE( `token` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 20;
-- -------------------------------------------------------------


-- CREATE TABLE "user_responses" -------------------------------
CREATE TABLE `user_responses`( 
	`response_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 0 ) NOT NULL,
	`case_id` Int( 0 ) NOT NULL,
	`lv_size_dilated` TinyInt( 0 ) NULL DEFAULT NULL,
	`lv_function_impaired` TinyInt( 0 ) NULL DEFAULT NULL,
	`rv_size_dilated` TinyInt( 0 ) NULL DEFAULT NULL,
	`rv_function_impaired` TinyInt( 0 ) NULL DEFAULT NULL,
	`aortic_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`aortic_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`mitral_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`mitral_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`tricuspid_stenosis_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`tricuspid_regurgitation_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`pericardial_effusion_significant` TinyInt( 0 ) NULL DEFAULT NULL,
	`ivc_high_ra_pressure` TinyInt( 0 ) NULL DEFAULT NULL,
	`user_conclusions` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`requires_full_echo` TinyInt( 0 ) NULL DEFAULT NULL,
	`score` Int( 0 ) NULL DEFAULT NULL,
	`is_completed` TinyInt( 1 ) NULL DEFAULT 0,
	`started_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`completed_at` Timestamp NULL DEFAULT NULL,
	`mcq_score` Int( 0 ) NULL DEFAULT NULL COMMENT 'Score from MCQ questions only',
	`checkbox_score` Int( 0 ) NULL DEFAULT NULL COMMENT 'Score from checkbox questions only (existing score column will be total)',
	`has_mcq_questions` TinyInt( 1 ) NULL DEFAULT 0 COMMENT 'Whether this case includes MCQs',
	PRIMARY KEY ( `response_id` ),
	CONSTRAINT `unique_user_case` UNIQUE( `user_id`, `case_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`user_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`full_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`username` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`password_hash` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`is_admin` TinyInt( 1 ) NULL DEFAULT 0,
	`is_active` TinyInt( 1 ) NOT NULL DEFAULT 1,
	`user_group` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`last_login` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `user_id` ),
	CONSTRAINT `email` UNIQUE( `email` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 8;
-- -------------------------------------------------------------


-- CREATE TABLE "access_requests" ------------------------------
CREATE TABLE `access_requests`( 
	`request_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`requested_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`request_status` TinyInt( 0 ) NULL DEFAULT NULL,
	PRIMARY KEY ( `request_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 50;
-- -------------------------------------------------------------


-- CREATE TABLE "mcq_options" ----------------------------------
CREATE TABLE `mcq_options`( 
	`option_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`question_id` Int( 0 ) NOT NULL,
	`option_text` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`option_order` Int( 0 ) NULL DEFAULT 0 COMMENT 'Display order (A=0, B=1, C=2, etc)',
	`is_correct` TinyInt( 1 ) NULL DEFAULT 0 COMMENT 'Whether this is a correct answer',
	`created_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `option_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "mcq_questions" --------------------------------
CREATE TABLE `mcq_questions`( 
	`question_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`case_id` Int( 0 ) NOT NULL,
	`question_text` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`question_order` Int( 0 ) NULL DEFAULT 0 COMMENT 'Display order within case (0-based)',
	`question_type` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'single' COMMENT 'single, multiple, numeric',
	`points` Int( 0 ) NULL DEFAULT 1 COMMENT 'Points awarded for correct answer',
	`explanation` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Explanation shown after submission',
	`is_active` TinyInt( 1 ) NULL DEFAULT 1,
	`created_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `question_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE TABLE "user_mcq_responses" ---------------------------
CREATE TABLE `user_mcq_responses`( 
	`response_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`user_response_id` Int( 0 ) NOT NULL COMMENT 'Links to user_responses.response_id',
	`question_id` Int( 0 ) NOT NULL,
	`selected_option_ids` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Comma-separated option_ids for selected answers',
	`is_correct` TinyInt( 1 ) NULL DEFAULT NULL COMMENT 'Whether the response is correct',
	`points_earned` Int( 0 ) NULL DEFAULT 0 COMMENT 'Points earned for this question',
	`answered_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `response_id` ),
	CONSTRAINT `unique_user_question` UNIQUE( `user_response_id`, `question_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- CREATE INDEX "idx_active" -----------------------------------
CREATE INDEX `idx_active` USING BTREE ON `available_groups`( `is_active` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_category" ---------------------------------
CREATE INDEX `idx_category` USING BTREE ON `available_groups`( `group_category` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_group_name" -------------------------------
CREATE INDEX `idx_group_name` USING BTREE ON `available_groups`( `group_name` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case" -------------------------------------
CREATE INDEX `idx_case` USING BTREE ON `case_videos`( `case_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_video_purpose" ----------------------------
CREATE INDEX `idx_video_purpose` USING BTREE ON `case_videos`( `video_purpose`( 100 ) );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case_groups" ------------------------------
CREATE INDEX `idx_case_groups` USING BTREE ON `cases`( `case_groups`( 100 ) );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_serial" -----------------------------------
CREATE INDEX `idx_serial` USING BTREE ON `cases`( `serial_number` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_expires" ----------------------------------
CREATE INDEX `idx_expires` USING BTREE ON `password_reset_tokens`( `expires_at` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_token" ------------------------------------
CREATE INDEX `idx_token` USING BTREE ON `password_reset_tokens`( `token` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user" -------------------------------------
CREATE INDEX `idx_user` USING BTREE ON `password_reset_tokens`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case" -------------------------------------
CREATE INDEX `idx_case` USING BTREE ON `user_responses`( `case_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user" -------------------------------------
CREATE INDEX `idx_user` USING BTREE ON `user_responses`( `user_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_has_mcq" ----------------------------------
CREATE INDEX `idx_has_mcq` USING BTREE ON `user_responses`( `has_mcq_questions` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_email" ------------------------------------
CREATE INDEX `idx_email` USING BTREE ON `users`( `email` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_is_active" --------------------------------
CREATE INDEX `idx_is_active` USING BTREE ON `users`( `is_active` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user_group" -------------------------------
CREATE INDEX `idx_user_group` USING BTREE ON `users`( `user_group` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_username" ---------------------------------
CREATE INDEX `idx_username` USING BTREE ON `users`( `username` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_correct" ----------------------------------
CREATE INDEX `idx_correct` USING BTREE ON `mcq_options`( `is_correct` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_question_options" -------------------------
CREATE INDEX `idx_question_options` USING BTREE ON `mcq_options`( `question_id`, `option_order` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_active" -----------------------------------
CREATE INDEX `idx_active` USING BTREE ON `mcq_questions`( `is_active` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case_questions" ---------------------------
CREATE INDEX `idx_case_questions` USING BTREE ON `mcq_questions`( `case_id`, `question_order` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_question" ---------------------------------
CREATE INDEX `idx_question` USING BTREE ON `user_mcq_responses`( `question_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user_response" ----------------------------
CREATE INDEX `idx_user_response` USING BTREE ON `user_mcq_responses`( `user_response_id` );
-- -------------------------------------------------------------


-- CREATE LINK "case_videos_ibfk_1" ----------------------------
ALTER TABLE `case_videos`
	ADD CONSTRAINT `case_videos_ibfk_1` FOREIGN KEY ( `case_id` )
	REFERENCES `cases`( `case_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "password_reset_tokens_ibfk_1" ------------------
ALTER TABLE `password_reset_tokens`
	ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY ( `user_id` )
	REFERENCES `users`( `user_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_responses_ibfk_1" -------------------------
ALTER TABLE `user_responses`
	ADD CONSTRAINT `user_responses_ibfk_1` FOREIGN KEY ( `user_id` )
	REFERENCES `users`( `user_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "user_responses_ibfk_2" -------------------------
ALTER TABLE `user_responses`
	ADD CONSTRAINT `user_responses_ibfk_2` FOREIGN KEY ( `case_id` )
	REFERENCES `cases`( `case_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_mcq_case" -----------------------------------
ALTER TABLE `mcq_questions`
	ADD CONSTRAINT `fk_mcq_case` FOREIGN KEY ( `case_id` )
	REFERENCES `cases`( `case_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_mcq_question" -------------------------------
ALTER TABLE `user_mcq_responses`
	ADD CONSTRAINT `fk_mcq_question` FOREIGN KEY ( `question_id` )
	REFERENCES `mcq_questions`( `question_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_mcq_user_response" --------------------------
ALTER TABLE `user_mcq_responses`
	ADD CONSTRAINT `fk_mcq_user_response` FOREIGN KEY ( `user_response_id` )
	REFERENCES `user_responses`( `response_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


-- CREATE LINK "fk_option_question" ----------------------------
ALTER TABLE `mcq_options`
	ADD CONSTRAINT `fk_option_question` FOREIGN KEY ( `question_id` )
	REFERENCES `mcq_questions`( `question_id` )
	ON DELETE Cascade
	ON UPDATE No Action;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


