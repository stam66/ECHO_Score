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


-- CREATE TABLE "case_videos" ----------------------------------
CREATE TABLE `case_videos`( 
	`video_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`case_id` Int( 0 ) NOT NULL,
	`video_filename` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`view_description` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`video_purpose` Text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`video_order` Int( 0 ) NULL DEFAULT 0,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `video_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 12;
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
AUTO_INCREMENT = 14;
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
AUTO_INCREMENT = 1;
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
	PRIMARY KEY ( `response_id` ),
	CONSTRAINT `unique_user_case` UNIQUE( `user_id`, `case_id` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 3;
-- -------------------------------------------------------------


-- CREATE TABLE "users" ----------------------------------------
CREATE TABLE `users`( 
	`user_id` Int( 0 ) AUTO_INCREMENT NOT NULL,
	`full_name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`username` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`password_hash` VarChar( 64 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`is_admin` TinyInt( 1 ) NULL DEFAULT 0,
	`user_group` VarChar( 50 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
	`created_at` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	`last_login` Timestamp NULL DEFAULT NULL,
	PRIMARY KEY ( `user_id` ),
	CONSTRAINT `email` UNIQUE( `email` ),
	CONSTRAINT `username` UNIQUE( `username` ) )
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ENGINE = InnoDB
AUTO_INCREMENT = 4;
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


-- CREATE INDEX "idx_email" ------------------------------------
CREATE INDEX `idx_email` USING BTREE ON `users`( `email` );
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


