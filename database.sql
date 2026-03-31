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
AUTO_INCREMENT = 52;
-- -------------------------------------------------------------


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
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 22;
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
AUTO_INCREMENT = 67;
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
AUTO_INCREMENT = 18;
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


-- CREATE TABLE "mcq_options" ----------------------------------
CREATE TABLE `mcq_options`( 
	`option_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`question_id` Int( 0 ) NOT NULL,
	`option_text` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`order_num` Int( 0 ) NULL DEFAULT 0 COMMENT 'Display order (A=0, B=1, C=2, etc)',
	`is_correct` TinyInt( 1 ) NULL DEFAULT 0 COMMENT 'Whether this is a correct answer',
	`created_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `option_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 32;
-- -------------------------------------------------------------


-- CREATE TABLE "mcq_questions" --------------------------------
CREATE TABLE `mcq_questions`( 
	`question_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`case_id` Int( 0 ) NOT NULL,
	`question_text` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`order_num` Int( 0 ) NULL DEFAULT 0 COMMENT 'Display order within case (0-based)',
	`question_type` VarChar( 20 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'single' COMMENT 'single, multiple, numeric',
	`points` Int( 0 ) NULL DEFAULT 1 COMMENT 'Points awarded for correct answer',
	`explanation` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Explanation shown after submission',
	`is_active` TinyInt( 1 ) NULL DEFAULT 1,
	`created_at` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` Timestamp NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `question_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 9;
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
AUTO_INCREMENT = 19;
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
ENGINE = InnoDB
AUTO_INCREMENT = 6;
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
AUTO_INCREMENT = 11;
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
	`user_group` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`last_login` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `user_id` ),
	CONSTRAINT `email` UNIQUE( `email` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 11;
-- -------------------------------------------------------------


-- Dump data of "access_requests" --------------------------
BEGIN;

INSERT INTO `access_requests`(`request_id`,`name`,`email`,`requested_at`,`request_status`) VALUES 
( '5', 'test user', 'noone@nowhere.com', '2025-11-04 16:52:31', '1' ),
( '6', 'sdfsdf', 'sdfsdf', '2025-11-04 23:05:08', '0' ),
( '7', 'random person', 'stam66@kapetanakis.uk', '2025-11-07 07:39:45', '0' ),
( '8', 'Test Person', 'stam@kapetanakis.uk', '2025-11-07 15:47:17', NULL ),
( '9', 'test user', 'someone@somewhere.com', '2025-11-07 15:58:53', NULL ),
( '10', 'sdfs', 'sdffs@sdfsdj.com', '2025-11-07 16:01:49', NULL ),
( '11', 'sdsfls', 'sldfkjs@slkd.com', '2025-11-07 16:06:10', NULL ),
( '12', 'ds', 'sd@ds.com', '2025-11-07 16:07:21', NULL ),
( '13', 'ab', 'ab@ba.com', '2025-11-07 16:20:30', NULL ),
( '14', 'dd', 'dd@dd.com', '2025-11-07 16:38:59', NULL ),
( '15', 'abab', 'abab@baba.com', '2025-11-07 16:41:55', NULL ),
( '16', 'ASD', 'aSD@ASD.COM', '2025-11-07 16:54:10', NULL ),
( '17', '12', '12@SD.COM', '2025-11-07 16:55:06', NULL ),
( '18', 'SLDKFJ', 'SLDFKJS@LSDKJS.COM', '2025-11-07 16:57:26', NULL ),
( '19', 'sdkls', 'sdlskf@sdklsd.com', '2025-11-07 17:02:31', NULL ),
( '20', 'sadkfj', 'sldfkl@sdkfl.com', '2025-11-07 17:04:38', NULL ),
( '21', 'sdjfs', 'sdkfl@ds.com', '2025-11-07 17:31:01', NULL ),
( '22', 'sdfis', 'sdk@sdkfdls.com', '2025-11-07 17:31:35', NULL ),
( '23', 'another test', 'stam.kapetanakis@gstt.nhs.uk', '2025-11-08 02:21:55', NULL ),
( '24', 'testing', 'sdf@sdf.com', '2025-11-08 02:56:25', NULL ),
( '25', 'final test?', 'testing@test.com', '2025-11-08 02:56:53', NULL ),
( '26', 'sdkfs', 'sdfkl@sdksl.com', '2025-11-08 02:58:15', NULL ),
( '27', 'fgsdf', 'dfggd@dssf.com', '2025-11-08 03:08:35', NULL ),
( '28', 'sdlkfsj', 'sfdkls@dk.com', '2025-11-08 03:28:50', NULL ),
( '29', 'sdfsd', 'sdf@sdf.com', '2025-11-08 03:33:25', NULL ),
( '30', 'sdfjl', 'dfskd@dfksld.com', '2025-11-08 03:58:06', NULL ),
( '31', 'dksf', 'fdslk@fdkssl.com', '2025-11-08 03:59:59', NULL ),
( '32', 'sdifjsl', 'sdkfjsl@skdfjsldf.com', '2025-11-08 13:55:55', NULL ),
( '33', 'testing', 'sdkfsldjf@test.com', '2025-11-08 14:10:42', NULL ),
( '34', 'dskflj', 'sfsldk@sfksl.com', '2025-11-08 14:12:26', NULL ),
( '35', 'slfdjksl', 'fskldsl@falskdj.com', '2025-11-08 14:15:42', NULL ),
( '36', 'sdkfjsl', 'fskdsf@sfsjkdl.com', '2025-11-08 14:24:00', NULL ),
( '37', 'flksdjfsl', 'fskdjls@fksdjls.com', '2025-11-08 14:54:19', NULL ),
( '38', 'sdfjlsdf', 'fskfdls@slkdfjsl.com', '2025-11-08 14:57:39', NULL ),
( '39', 'sdkfjsl', 'fksjd@mac.com', '2025-11-08 15:01:23', NULL ),
( '40', 'sdifjsl', 'fsdf@mac.com', '2025-11-08 15:07:00', NULL ),
( '41', 'lksajdf', 'sflkdj@sdflkjsl.com', '2025-11-08 15:11:03', NULL ),
( '42', 'dlsfjsldkf', 'fskdl@mac.com', '2025-11-08 15:20:35', NULL ),
( '43', 'sdifjils', 'dlfkjs@sdfkjl.com', '2025-11-08 15:35:02', NULL ),
( '44', 'sdifjsl', 'stam@mac.com', '2025-11-08 15:41:22', NULL ),
( '45', 'sdlkfsjl', 'fsdlkfj@fjkds.com', '2025-11-08 18:46:00', NULL ),
( '46', 'sdfkjsdlf', 'fsldjf@faslkdjsl.com', '2025-11-08 18:48:05', NULL ),
( '47', 'sdifjs', 'sdkfjsl@slfkdslf.com', '2025-11-08 18:49:09', NULL ),
( '48', 'sdifjls', 'fadkal@fskdlfjl.com', '2025-11-08 18:55:44', NULL ),
( '49', 'Stam Kapetanakis II', 'stam@kapetanakis.uk', '2025-11-08 19:02:37', NULL ),
( '50', 'sdkjfk', 'sdlkfjls@dkfsldjs.com', '2025-11-09 13:35:16', NULL ),
( '51', 'Another Tester', 'stam66@hey.com', '2026-03-28 11:06:53', '1' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "available_groups" -------------------------
BEGIN;

INSERT INTO `available_groups`(`group_id`,`group_name`,`group_category`,`display_order`,`is_active`,`created_date`,`modified_date`,`created_by`,`notes`) VALUES 
( '1', 'Cardiology 2025 Q1', 'Year-Quarter', '10', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '2', 'Cardiology 2025 Q2', 'Year-Quarter', '20', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '3', 'Cardiology 2025 Q3', 'Year-Quarter', '30', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '4', 'Cardiology 2025 Q4', 'Year-Quarter', '40', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '5', 'ICU 2025 Q1', 'Year-Quarter', '50', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '6', 'ICU 2025 Q2', 'Year-Quarter', '60', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '7', 'ED 2025 Q1', 'Year-Quarter', '70', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '8', 'Medicine 2025 Q1', 'Year-Quarter', '80', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '9', 'Surgery 2025 Q1', 'Year-Quarter', '90', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '11', 'Geriatrics', 'Specialty', '110', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '12', 'Research Cases', 'Custom', '200', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '13', 'Teaching Cases', 'Custom', '210', '1', '2025-10-29 00:11:23', '2025-10-29 00:11:23', NULL, NULL ),
( '15', 'GSTT Induction', 'Specialty', '1', '1', '2025-10-30 01:02:21', '2025-10-30 03:17:48', '2', NULL ),
( '16', 'KCH', 'Year-Quarter', '0', '1', '2025-11-11 20:33:53', '2025-11-11 20:33:53', '2', NULL ),
( '21', 'QA Level I', 'Custom', '0', '1', '2025-11-21 12:20:31', '2025-11-21 12:20:31', '2', NULL );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "case_videos" ------------------------------
BEGIN;

INSERT INTO `case_videos`(`video_id`,`case_id`,`video_filename`,`stored_filename`,`file_type`,`view_description`,`video_purpose`,`video_order`,`created_at`) VALUES 
( '5', '3', '1-1.mp4', '1-1.mp4', 'video', 'PLAX', '3', '0', '2025-10-15 11:02:55' ),
( '6', '3', '1-2.mp4', '1-2.mp4', 'video', 'Colour PLAX', '', '1', '2025-10-15 16:31:31' ),
( '8', '3', '1-3.mp4', '1-3.mp4', 'video', '', '', '2', '2025-10-20 15:23:55' ),
( '9', '3', '1-4.mp4', '1-4.mp4', 'video', '', '', '3', '2025-10-20 15:24:07' ),
( '10', '3', '1-5.mp4', '1-5.mp4', 'video', '', '', '4', '2025-10-20 15:24:17' ),
( '11', '4', '2-1.mp4', '2-1.mp4', 'video', '', '', '0', '2025-10-21 02:05:57' ),
( '12', '5', '3-1.mp4', '3-1.mp4', 'video', '', '', '0', '2025-10-22 12:04:27' ),
( '13', '11', '9-1.mp4', '9-1.mp4', 'video', '', '', '0', '2025-10-27 13:51:37' ),
( '14', '11', '9-2.mp4', '9-2.mp4', 'video', '', '', '1', '2025-10-27 13:51:44' ),
( '15', '11', '9-3.mp4', '9-3.mp4', 'video', '', '', '2', '2025-10-27 13:51:55' ),
( '16', '11', '9-4.mp4', '9-4.mp4', 'video', '', '', '3', '2025-10-27 13:52:05' ),
( '17', '11', '9-5.mp4', '9-5.mp4', 'video', '', '', '4', '2025-10-27 13:52:15' ),
( '18', '11', '9-6.mp4', '9-6.mp4', 'video', '', '', '5', '2025-10-27 13:52:41' ),
( '19', '11', '9-7.mp4', '9-7.mp4', 'video', '', '', '6', '2025-10-27 13:52:55' ),
( '20', '11', '9-8.mp4', '9-8.mp4', 'video', '', '', '7', '2025-10-27 13:53:10' ),
( '21', '11', '9-9.mp4', '9-9.mp4', 'video', '', '', '8', '2025-10-27 13:53:23' ),
( '22', '11', '9-10.mp4', '9-10.mp4', 'video', '', '', '9', '2025-10-27 13:53:35' ),
( '23', '11', '9-11.mp4', '9-11.mp4', 'video', '', '', '10', '2025-10-27 13:53:57' ),
( '26', '3', '1-6.mp4', '1-6.mp4', 'video', '', '', '5', '2025-10-27 16:19:18' ),
( '27', '10', '8-1.mp4', '8-1.mp4', 'video', '', '', '0', '2025-10-28 09:23:41' ),
( '28', '11', '9 12.mp4', '9 12.mp4', 'video', '', '', '11', '2025-10-30 15:30:47' ),
( '31', '15', '2-1.mp4', '4627606a-bf34-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '0', '2025-11-11 19:26:08' ),
( '32', '15', '2-2.mp4', '6c27f3d8-bf34-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '1', '2025-11-11 19:27:12' ),
( '34', '4', '2-2.mp4', '80912ed0-bf3d-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '1', '2025-11-11 20:32:11' ),
( '35', '15', '2-3.mp4', 'df97eb8a-bf3d-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '2', '2025-11-11 20:34:51' ),
( '36', '4', '2-3.mp4', '38a23f6c-bf63-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '2', '2025-11-12 01:02:12' ),
( '37', '4', '2-4.mp4', '43a73c32-bf63-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '3', '2025-11-12 01:02:30' ),
( '38', '15', '2-4.mp4', 'b344293e-bf67-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '3', '2025-11-12 01:34:15' ),
( '39', '15', '2-5.mp4', 'b740dd3e-bf67-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '4', '2025-11-12 01:34:22' ),
( '40', '15', '2-6.mp4', 'be97ccc8-bf67-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '5', '2025-11-12 01:34:34' ),
( '42', '15', '2-7.png', '84fe23d8-bf6a-11f0-94ce-ced7ca6ec9a4.png', 'image', '', '', '6', '2025-11-12 01:54:26' ),
( '43', '16', '1-1.mp4', 'adfc5ece-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '0', '2025-11-16 02:12:19' ),
( '44', '16', '1-2.mp4', 'b0b00e40-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '1', '2025-11-16 02:12:23' ),
( '45', '16', '1-3.mp4', 'b9489252-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '2', '2025-11-16 02:12:38' ),
( '46', '16', '1-4.mp4', 'bd4ed44c-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '3', '2025-11-16 02:12:45' ),
( '47', '16', '1-5.mp4', 'c17db1d2-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '4', '2025-11-16 02:12:52' ),
( '48', '15', '2-8.mp4', 'f6c4ebee-c291-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '7', '2025-11-16 02:14:21' ),
( '49', '15', '2-9.png', 'fda39960-c291-11f0-94ce-ced7ca6ec9a4.png', 'image', '', '', '8', '2025-11-16 02:14:32' ),
( '50', '15', '2-10.mp4', '01880098-c292-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '9', '2025-11-16 02:14:39' ),
( '51', '15', '2-11.mp4', '05494ea8-c292-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '10', '2025-11-16 02:14:45' ),
( '52', '17', '3-1.mp4', '7a68cd3e-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '0', '2025-11-16 02:25:11' ),
( '53', '17', '3-2.mp4', '7dfc7f22-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '1', '2025-11-16 02:25:17' ),
( '54', '17', '3-3.mp4', '8214e4b4-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '2', '2025-11-16 02:25:24' ),
( '55', '17', '3-4.mp4', '8520171e-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '3', '2025-11-16 02:25:29' ),
( '56', '17', '3-5.mp4', '887c121e-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '4', '2025-11-16 02:25:35' ),
( '57', '17', '3-6.png', '8dbadc06-c293-11f0-94ce-ced7ca6ec9a4.png', 'image', '', '', '5', '2025-11-16 02:25:44' ),
( '58', '17', '3-7.mp4', '91626fae-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '6', '2025-11-16 02:25:50' ),
( '59', '17', '3-8.mp4', '9671ce22-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '7', '2025-11-16 02:25:58' ),
( '60', '17', '3-9.mp4', '9a562e3e-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '8', '2025-11-16 02:26:05' ),
( '61', '17', '3-10.mp4', '9ed81616-c293-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '9', '2025-11-16 02:26:12' ),
( '63', '11', '9-12a.mp4', '061fca0c-c2a4-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '12', '2025-11-16 04:23:38' ),
( '64', '11', '9-12.mp4', 'fb882120-c2a8-11f0-94ce-ced7ca6ec9a4.mp4', 'video', '', '', '13', '2025-11-16 04:59:07' ),
( '65', '17', '1-3.mp4', 'c966ce3c-c6d4-11f0-93a8-b09cfd22ae06.mp4', 'video', 'SAX', '', '11', '2025-11-21 12:22:46' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "cases" ------------------------------------
BEGIN;

INSERT INTO `cases`(`case_id`,`serial_number`,`case_label`,`created_at`,`updated_at`,`lv_size_dilated`,`lv_function_impaired`,`rv_size_dilated`,`rv_function_impaired`,`aortic_stenosis_significant`,`aortic_regurgitation_significant`,`mitral_stenosis_significant`,`mitral_regurgitation_significant`,`tricuspid_stenosis_significant`,`tricuspid_regurgitation_significant`,`pericardial_effusion_significant`,`ivc_high_ra_pressure`,`correct_conclusions`,`requires_full_echo`,`case_groups`) VALUES 
( '3', 'Case 1', 'AR / Dilated LV', '2025-10-14 12:20:58', '2025-10-30 02:18:46', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', 'Severe eccentric AR compressing AMVL. Moderately dilated LV.', '1', 'GSTT Induction' ),
( '4', 'Case 2', 'LVSD, MR, TR', '2025-10-14 12:21:34', '2025-10-31 20:49:59', '1', '1', '0', '1', '0', '0', '0', '1', '0', '1', '0', '0', 'Severe LV dysfunction, signficant MR/TR, pleural effusion', '1', 'GSTT Induction' ),
( '5', 'Case 3', 'LV function / RV function / TR', '2025-10-14 12:22:04', '2025-10-31 20:56:07', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'GSTT Induction' ),
( '6', 'Case 4', 'Normal / Dilated LA', '2025-10-14 12:22:41', '2025-10-31 20:55:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '7', 'Case 5', 'Impaired LV / Mild-Moderate MR / Moderate TR', '2025-10-14 12:23:41', '2025-10-31 20:56:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '8', 'Case 6', 'AS / TR / Bi-atrial dilatation', '2025-10-14 12:24:07', '2025-10-31 20:56:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '9', 'Case 7', 'MV PROLAPSE with severe MR / severe TR / dilated LV/RV / reduced RV function / Bi-atrial dilatation', '2025-10-14 12:24:47', '2025-10-31 20:57:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '10', 'Case 8', 'MS / dilated LA / AR', '2025-10-14 12:25:11', '2025-10-31 20:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '11', 'Case 9', 'PERICARDIAL EFFUSION â€“ features of tamponade LVH', '2025-10-14 12:25:42', '2025-10-31 20:57:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '12', 'Case 10', 'VEGATATION / MR / AR / TR / Dilated LV / borderline LBSD / borderline RVSD', '2025-10-14 12:26:39', '2025-10-31 20:57:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GSTT Induction' ),
( '15', 'Case 11', 'KCH 2', '2025-11-11 19:25:09', '2025-11-22 22:46:25', NULL, NULL, NULL, NULL, '1', '0', '0', NULL, NULL, NULL, NULL, NULL, '', NULL, 'KCH' ),
( '16', 'Case 12', 'KCH 1', '2025-11-16 02:10:57', '2025-11-22 22:53:44', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, '', NULL, 'KCH' ),
( '17', 'Case 13', 'KCH 3', '2025-11-16 02:24:55', '2025-11-22 18:27:32', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'KCH' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "email_config" -----------------------------
BEGIN;

INSERT INTO `email_config`(`config_id`,`smtp_server`,`smtp_port`,`smtp_username`,`smtp_password`,`from_email`,`from_name`,`use_tls`,`updated_at`) VALUES 
( '1', 'smtp.gmail.com', '587', 'echoscore.app@gmail.com', 'kqfzidauezxfugda', 'echoscore.app@gmail.com', 'ECHO_score app', '1', '2025-10-14 10:11:32' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "mcq_options" ------------------------------
BEGIN;

INSERT INTO `mcq_options`(`option_id`,`question_id`,`option_text`,`order_num`,`is_correct`,`created_at`,`updated_at`) VALUES 
( '3', '1', 'Large anterior MI', '0', '0', '2025-11-13 08:39:39', '2025-11-13 14:54:23' ),
( '4', '1', 'Pulmonary embolism', '1', '0', '2025-11-13 08:40:45', '2025-11-13 14:54:40' ),
( '5', '1', 'Aortic stenosis', '2', '1', '2025-11-13 08:41:01', '2025-11-15 22:02:16' ),
( '6', '1', 'Atrial fibrillation', '3', '0', '2025-11-13 08:41:18', '2025-11-15 22:02:16' ),
( '7', '2', 'Maximum aortic valve velocity with pulsed-wave Doppler.', '0', '1', '2025-11-13 14:56:19', '2025-11-13 14:56:26' ),
( '8', '2', 'Mean pressure gradient across the aortic valve', '1', '0', '2025-11-13 14:56:39', '2025-11-13 14:56:39' ),
( '9', '2', 'Aortic valve area', '2', '0', '2025-11-13 14:56:51', '2025-11-13 14:56:51' ),
( '10', '2', 'Dimensionless Index', '3', '0', '2025-11-13 14:57:02', '2025-11-13 14:57:02' ),
( '11', '3', 'Flow across the aortic valve', '0', '0', '2025-11-13 14:58:40', '2025-11-13 14:58:40' ),
( '12', '3', 'Doppler alignment', '1', '0', '2025-11-13 14:58:54', '2025-11-13 14:58:54' ),
( '13', '3', 'Mitral regurgitation', '2', '0', '2025-11-13 14:59:06', '2025-11-13 14:59:06' ),
( '14', '3', 'Age', '3', '1', '2025-11-13 14:59:19', '2025-11-13 14:59:19' ),
( '15', '4', 'Option 1', '0', '0', '2025-11-21 12:23:56', '2025-11-21 12:23:56' ),
( '16', '4', 'option 2', '1', '1', '2025-11-21 12:24:06', '2025-11-21 12:24:06' ),
( '17', '5', 'LV systolic dysfunction', '0', '0', '2025-11-21 12:49:02', '2025-11-21 12:49:02' ),
( '18', '5', 'RV systolic dysfunction', '1', '0', '2025-11-21 12:49:12', '2025-11-21 12:49:12' ),
( '19', '5', 'Tamponade', '2', '1', '2025-11-21 12:49:23', '2025-11-21 12:49:44' ),
( '20', '5', 'LV dyssynchrony', '3', '0', '2025-11-21 12:49:37', '2025-11-21 12:49:37' ),
( '21', '6', 'A greater than 40% relative inspiratory augmentation of blood flow across the tricuspid valve', '0', '0', '2025-11-21 12:51:47', '2025-11-21 12:51:47' ),
( '22', '6', 'Early systolic collapse of the right ventricular free wall', '1', '0', '2025-11-21 12:53:54', '2025-11-21 12:53:54' ),
( '23', '6', 'A greater than 25% relative decrease in inspiratory flow across the mitral valve', '2', '0', '2025-11-21 12:54:10', '2025-11-21 12:54:10' ),
( '24', '6', 'Septal bounce into the left ventricle during inspiration', '3', '1', '2025-11-21 12:54:23', '2025-11-21 12:55:42' ),
( '25', '7', 'The maximum size of the effusion in systole', '0', '1', '2025-11-21 12:56:09', '2025-11-21 12:57:38' ),
( '26', '7', 'The location of the maximum effusion', '1', '0', '2025-11-21 12:56:16', '2025-11-21 12:56:16' ),
( '27', '7', 'The haemodynamic consequences as assessed by Doppler Echocardiography', '2', '0', '2025-11-21 12:56:26', '2025-11-21 12:56:26' ),
( '28', '7', 'The size of the effusion around the RV in the subcostal view', '3', '0', '2025-11-21 12:56:34', '2025-11-21 12:56:34' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "mcq_questions" ----------------------------
BEGIN;

INSERT INTO `mcq_questions`(`question_id`,`case_id`,`question_text`,`order_num`,`question_type`,`points`,`explanation`,`is_active`,`created_at`,`updated_at`) VALUES 
( '1', '15', 'The cause of syncope is most likely:', '1', 'single', '1', NULL, '1', '2025-11-13 08:23:24', '2025-11-15 22:02:10' ),
( '2', '15', 'The severity of aortic stenosis is defined by the following echo parameters, EXCEPT:', '2', 'single', '1', NULL, '1', '2025-11-13 14:53:04', '2025-11-15 22:02:10' ),
( '3', '15', 'The AV pressure gradients are affected by the following parameters, EXCEPT:', '3', 'single', '1', NULL, '1', '2025-11-13 14:58:05', '2025-11-13 14:58:05' ),
( '4', '17', 'Some question', '1', 'single', '1', NULL, '1', '2025-11-21 12:23:30', '2025-11-21 12:23:30' ),
( '5', '16', 'What is the cause of hypotension', '1', 'single', '1', NULL, '1', '2025-11-21 12:47:37', '2025-11-21 12:47:37' ),
( '6', '16', 'Which of the following is NOT an echocardiographic feature of tamponade:', '2', 'single', '1', NULL, '1', '2025-11-21 12:48:51', '2025-11-21 12:48:51' ),
( '7', '16', 'When describing a pericardial effusion it is important to mention the following findings, EXCEPT:', '3', 'single', '1', NULL, '1', '2025-11-21 12:55:54', '2025-11-21 12:55:54' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "password_reset_tokens" --------------------
BEGIN;

INSERT INTO `password_reset_tokens`(`token_id`,`user_id`,`token`,`otp`,`created_at`,`expires_at`,`is_used`,`used_at`,`ip_address`) VALUES 
( '1', '6', 'BCE6D8438AC43FB0F1FE4356DD5A77C6A2018F1B53E5D457ED0C940C75DA1753', '586460', '2025-11-02 00:44:40', '2025-11-02 01:14:40', '0', NULL, 'unknown' ),
( '2', '6', '6B32B2E1F185F1391E6ADB7E390B4F478BA749748954476A1CBEE961D73376FE', '261946', '2025-11-02 00:44:47', '2025-11-02 01:14:47', '0', NULL, 'unknown' ),
( '3', '6', '44D20112ADD82A689BEB0350D6808160DDAC9E57B447ED80A95BC348E7BC8D03', '102901', '2025-11-02 01:02:21', '2025-11-02 01:32:21', '0', NULL, 'unknown' ),
( '4', '6', '1A88ECE660807014A0B464DA7957CBF577AC9BC177FFF42CE1DEA30DF7C27596', '119685', '2025-11-02 01:02:26', '2025-11-02 01:32:26', '0', NULL, 'unknown' ),
( '5', '6', 'C3772ECBB0A9CA069D7ECC2D3869922ED616BA0C88AC94C91FAB977BB3EA060B', '454022', '2025-11-02 01:03:44', '2025-11-02 01:33:44', '0', NULL, 'unknown' ),
( '6', '6', 'C4CF02CA04DA5AE1292B46240D845F019CF69D48128D52B1137100E74AAA23ED', '862162', '2025-11-02 01:03:51', '2025-11-02 01:33:51', '0', NULL, 'unknown' ),
( '7', '6', '866B0D753267ED15833351ABD70206D99CDC0D6715B8F498B93FC9E791A248B0', '290625', '2025-11-02 01:15:48', '2025-11-02 01:45:48', '0', NULL, 'unknown' ),
( '8', '6', 'F41FCCD47861A3C42A6D4D5B35FE49A28D061DD268DF18F760CCA0A9F0213FE3', '874886', '2025-11-02 01:15:57', '2025-11-02 01:45:57', '0', NULL, 'unknown' ),
( '9', '6', '3C763D0470F311C1C3D90389E533ABF180B59DF34239AB10AEDEFB8F7BC73853', '393917', '2025-11-02 01:20:04', '2025-11-02 01:50:04', '0', NULL, 'unknown' ),
( '10', '6', 'C5A6AF6FB424D53FD00EC0B71EA581912FEF606F7EDDE317445130385D22CE47', '530843', '2025-11-02 01:20:14', '2025-11-02 01:50:14', '0', NULL, 'unknown' ),
( '11', '6', 'ACFB99DCE6148F3921CD2607BA1A32AAC4FC0E9E287323DFB1D61C44713B4DD5', '965073', '2025-11-02 01:23:38', '2025-11-02 01:53:38', '0', NULL, 'unknown' ),
( '12', '6', '8F287C3299DD42558CE829E0D3E3BC45E64223B7B49BDDC4E81D3E3E047756CB', '510507', '2025-11-02 01:23:48', '2025-11-02 01:53:48', '0', NULL, 'unknown' ),
( '13', '6', 'E2176F1EA8370B9CA29A62214FBDA8D53F2D434AAA8A38A824267C569D18218B', '044830', '2025-11-02 01:29:06', '2025-11-02 01:59:06', '0', NULL, 'unknown' ),
( '14', '6', 'C157554D85338531DDE8B469CE76D8F20A8345DADDEC1A6612EF86475D5E4F02', '619976', '2025-11-02 01:29:12', '2025-11-02 01:59:12', '1', '2025-11-02 01:29:45', 'unknown' ),
( '15', '6', '51CDE814D3B3FC94D832893A8109FB53161E38EFB39481EA4CEFC78C1D930935', '902297', '2025-11-02 01:45:06', '2025-11-02 02:15:06', '0', NULL, 'unknown' ),
( '16', '6', 'EDC47F61F1E36762739928FC7A956417C4FC86DD4B93EB3B3474CEB1D66E442F', '483289', '2025-11-02 01:45:34', '2025-11-02 02:15:34', '1', '2025-11-02 01:46:14', 'unknown' ),
( '17', '6', '3082B03970B2561F4B4FA2E1AA165EBEAC4167447BADD478060AFC37800AF1AC', '188917', '2025-11-02 01:58:26', '2025-11-02 02:28:26', '0', NULL, 'unknown' ),
( '18', '6', '37ACEB0FC51546D160B374595828D7A2D9D573D56D1BB6B414A6A1EBC9AC9043', '375591', '2025-11-02 02:01:13', '2025-11-02 02:31:13', '0', NULL, 'unknown' ),
( '19', '6', '48D1ADF3664028373272E43DA69BDFB77FA614A94CDC41E39E9639AFE60D6566', '294768', '2025-11-02 02:03:22', '2025-11-02 02:33:22', '0', NULL, 'unknown' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_mcq_responses" -----------------------
BEGIN;

INSERT INTO `user_mcq_responses`(`response_id`,`user_response_id`,`question_id`,`selected_option_ids`,`is_correct`,`points_earned`,`answered_at`) VALUES 
( '1', '8', '1', '5', '1', '1', '2025-11-13 14:50:06' ),
( '2', '8', '2', '7', '1', '1', '2025-11-13 15:02:45' ),
( '3', '8', '3', '14', '1', '1', '2025-11-13 15:02:53' ),
( '4', '9', '5', '', NULL, '0', '2025-11-21 13:04:35' ),
( '5', '10', '1', '', NULL, '0', '2026-03-28 01:22:06' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "user_responses" ---------------------------
BEGIN;

INSERT INTO `user_responses`(`response_id`,`user_id`,`case_id`,`lv_size_dilated`,`lv_function_impaired`,`rv_size_dilated`,`rv_function_impaired`,`aortic_stenosis_significant`,`aortic_regurgitation_significant`,`mitral_stenosis_significant`,`mitral_regurgitation_significant`,`tricuspid_stenosis_significant`,`tricuspid_regurgitation_significant`,`pericardial_effusion_significant`,`ivc_high_ra_pressure`,`user_conclusions`,`requires_full_echo`,`score`,`is_completed`,`started_at`,`completed_at`,`mcq_score`,`checkbox_score`,`has_mcq_questions`) VALUES 
( '6', '3', '3', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', 'Severe AR, dilated LV', '1', '13', '1', '2025-11-02 17:37:52', '2025-11-02 17:38:02', NULL, NULL, '0' ),
( '7', '3', '4', '1', '1', '1', '1', '0', '0', '0', '1', '0', '1', '0', '0', '', '1', '12', '1', '2025-11-02 21:32:06', '2025-11-20 09:20:18', NULL, NULL, '0' ),
( '8', '8', '15', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '', '1', '0', '1', '2025-11-13 08:42:05', '2025-11-20 11:12:20', '3', NULL, '1' ),
( '9', '8', '16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2025-11-21 13:04:27', NULL, NULL, NULL, '0' ),
( '10', '3', '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2026-03-28 01:22:03', NULL, NULL, NULL, '0' );
COMMIT;
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
BEGIN;

INSERT INTO `users`(`user_id`,`full_name`,`email`,`username`,`password_hash`,`is_admin`,`is_active`,`user_group`,`created_at`,`last_login`) VALUES 
( '1', 'Administrator', 'echoscore.app@gmail.com', 'dbadmin', 'e36f9a2e5af14188390ae0739e19505c7e98c71bd808839b9318fc3f517040d1', '1', '1', NULL, '2025-10-13 02:29:06', '2025-10-20 01:16:58' ),
( '2', 'Stam Kapetanakis', 'skapetanakis@nhs.net', 'skapetanakis', '5e9293d879732c749b3542f5d0fa6b47c6b96c852ef8162723bfe36ad88557c6', '1', '1', NULL, '2025-10-14 02:26:46', '2026-03-30 20:31:01' ),
( '3', 'Test User', 'stam66@icloud.com', 'TUser', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '0', '1', 'GSTT Induction', '2025-10-14 02:27:30', '2026-03-30 12:50:05' ),
( '5', 'Test Admin', 'stam66@gmail.com', 'TAdmin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '1', '1', NULL, '2025-10-28 03:05:37', NULL ),
( '6', 'Temp Login', 'stam@kapetanakis.uk', 'TLogin', 'b4097964ff6009aa53d1725cfdb904b9751b5046e95e3f07ee26a74194a3806d', '0', '1', NULL, '2025-11-02 00:27:37', NULL ),
( '7', 'test user', 'noone@nowhere.com', 'TUser1', 'd27584aff496a5a7b69c88508104cd8e39d855e8dd14289703b84e81dca1cf23', '0', '1', NULL, '2025-11-05 02:48:45', NULL ),
( '8', 'KCH Test', '1@2.com', 'KTest', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '0', '1', 'KCH', '2025-11-12 02:13:36', '2025-11-22 02:16:11' ),
( '10', 'Another Tester', 'stam66@hey.com', 'ATester', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '0', '1', NULL, '2026-03-29 00:26:07', NULL );
COMMIT;
-- ---------------------------------------------------------


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


-- CREATE INDEX "idx_correct" ----------------------------------
CREATE INDEX `idx_correct` USING BTREE ON `mcq_options`( `is_correct` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_question_options" -------------------------
CREATE INDEX `idx_question_options` USING BTREE ON `mcq_options`( `question_id`, `order_num` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_active" -----------------------------------
CREATE INDEX `idx_active` USING BTREE ON `mcq_questions`( `is_active` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case_questions" ---------------------------
CREATE INDEX `idx_case_questions` USING BTREE ON `mcq_questions`( `case_id`, `order_num` );
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


-- CREATE INDEX "idx_question" ---------------------------------
CREATE INDEX `idx_question` USING BTREE ON `user_mcq_responses`( `question_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user_response" ----------------------------
CREATE INDEX `idx_user_response` USING BTREE ON `user_mcq_responses`( `user_response_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_case" -------------------------------------
CREATE INDEX `idx_case` USING BTREE ON `user_responses`( `case_id` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_has_mcq" ----------------------------------
CREATE INDEX `idx_has_mcq` USING BTREE ON `user_responses`( `has_mcq_questions` );
-- -------------------------------------------------------------


-- CREATE INDEX "idx_user" -------------------------------------
CREATE INDEX `idx_user` USING BTREE ON `user_responses`( `user_id` );
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


-- CREATE LINK "case_videos_ibfk_1" ----------------------------
ALTER TABLE `case_videos`
	ADD CONSTRAINT `case_videos_ibfk_1` FOREIGN KEY ( `case_id` )
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


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


