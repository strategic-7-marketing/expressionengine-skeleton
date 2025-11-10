# ************************************************************
# Sequel Ace SQL dump
# Version 20094
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.30)
# Database: ee-skeleton
# Generation Time: 2025-08-01 16:44:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`)
VALUES
	(1,'Channel','submit_entry',0),
	(2,'Channel','smiley_pop',0),
	(3,'Channel','combo_loader',0),
	(4,'Comment','insert_new_comment',0),
	(5,'Comment_mcp','delete_comment_notification',0),
	(6,'Comment','comment_subscribe',0),
	(7,'Comment','edit_comment',0),
	(8,'Consent','grantConsent',0),
	(9,'Consent','submitConsent',0),
	(10,'Consent','withdrawConsent',0),
	(11,'Member','registration_form',0),
	(12,'Member','register_member',0),
	(13,'Member','activate_member',0),
	(14,'Member','member_login',0),
	(15,'Member','member_logout',0),
	(16,'Member','send_reset_token',0),
	(17,'Member','process_reset_password',0),
	(18,'Member','send_member_email',0),
	(19,'Member','update_un_pw',0),
	(20,'Member','do_member_search',0),
	(21,'Member','member_delete',0),
	(22,'Stats','sync_stats',1),
	(24,'Relationship','entryList',0),
	(25,'Search','do_search',1),
	(26,'Structure','ajax_move_set_data',0),
	(27,'Channel','live_preview',1),
	(28,'File','addonIcon',1),
	(29,'Rte','pages_autocomplete',0),
	(30,'Member','send_username',0),
	(31,'Member','update_profile',0),
	(32,'Member','upload_avatar',0),
	(33,'Member','recaptcha_check',1),
	(34,'Member','validate',0),
	(35,'Pro','setCookie',0),
	(36,'Pro','qrCode',0),
	(37,'Pro','validateMfa',0),
	(38,'Pro','invokeMfa',0),
	(39,'Pro','enableMfa',0),
	(40,'Pro','disableMfa',0),
	(41,'Pro','resetMfa',0);

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_group_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_group_settings`;

CREATE TABLE `exp_category_group_settings` (
  `category_group_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `group_id` int(6) unsigned NOT NULL,
  `cat_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `cat_allow_multiple` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`category_group_settings_id`,`channel_id`,`group_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_category_groups`;

CREATE TABLE `exp_channel_category_groups` (
  `channel_id` int(4) unsigned NOT NULL,
  `group_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` bigint(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` bigint(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` bigint(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` bigint(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_entry_hidden_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entry_hidden_fields`;

CREATE TABLE `exp_channel_entry_hidden_fields` (
  `entry_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  KEY `entry_id_field_id` (`entry_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_field_groups_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_field_groups_fields`;

CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int(6) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`field_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_is_conditional` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_form_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_form_settings`;

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_roles`;

CREATE TABLE `exp_channel_member_roles` (
  `role_id` int(10) NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` bigint(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` bigint(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` bigint(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` bigint(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`),
  KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_entries` int(10) unsigned NOT NULL DEFAULT '0',
  `sticky_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_preview` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `enable_entry_cloning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `conditional_sync_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title_field_instructions` text COLLATE utf8mb4_unicode_ci,
  `enforce_auto_url_title` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`(191)),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channels_channel_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_channel_field_groups`;

CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int(4) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channels_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_channel_fields`;

CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) unsigned NOT NULL,
  `field_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channels_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_statuses`;

CREATE TABLE `exp_channels_statuses` (
  `channel_id` int(4) unsigned NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_comment_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id_member_id` (`entry_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id_channel_id_author_id_status_site_id` (`entry_id`,`channel_id`,`author_id`,`status`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_config`;

CREATE TABLE `exp_config` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`config_id`),
  KEY `site_id_key` (`site_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_config` WRITE;
/*!40000 ALTER TABLE `exp_config` DISABLE KEYS */;

INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`)
VALUES
	(1,1,'auto_assign_cat_parents','y'),
	(2,1,'auto_convert_high_ascii','n'),
	(3,1,'comment_edit_time_limit',''),
	(4,1,'comment_moderation_override',''),
	(5,1,'comment_word_censoring',''),
	(6,1,'enable_comments',''),
	(7,1,'image_library_path',''),
	(8,1,'image_resize_protocol','gd2'),
	(9,1,'new_posts_clear_caches','y'),
	(10,1,'reserved_category_word','category'),
	(11,1,'thumbnail_prefix','thumb'),
	(12,1,'use_category_name','y'),
	(13,1,'word_separator','dash'),
	(14,1,'un_min_len','4'),
	(15,1,'pw_min_len','5'),
	(16,1,'allow_member_registration','n'),
	(17,1,'allow_member_localization','y'),
	(18,1,'req_mbr_activation','email'),
	(19,1,'new_member_notification','n'),
	(20,1,'mbr_notification_emails',''),
	(21,1,'require_terms_of_service','y'),
	(22,1,'default_primary_role','5'),
	(23,1,'profile_trigger','527757298'),
	(24,1,'member_theme','default'),
	(27,1,'avatar_url','{base_url}images/avatars/'),
	(28,1,'avatar_path','{base_path}images/avatars/'),
	(29,1,'avatar_max_width','100'),
	(30,1,'avatar_max_height','100'),
	(31,1,'avatar_max_kb','50'),
	(32,1,'enable_photos','n'),
	(33,1,'photo_url','{base_url}images/member_photos/'),
	(34,1,'photo_path','/'),
	(35,1,'photo_max_width','100'),
	(36,1,'photo_max_height','100'),
	(37,1,'photo_max_kb','50'),
	(38,1,'allow_signatures','y'),
	(39,1,'sig_maxlength','500'),
	(40,1,'sig_allow_img_hotlink','n'),
	(41,1,'sig_allow_img_upload','n'),
	(42,1,'sig_img_url','{base_url}images/signature_attachments/'),
	(43,1,'sig_img_path','{base_path}images/signature_attachments/'),
	(44,1,'sig_img_max_width','480'),
	(45,1,'sig_img_max_height','80'),
	(46,1,'sig_img_max_kb','30'),
	(47,1,'prv_msg_enabled','y'),
	(48,1,'prv_msg_allow_attachments','y'),
	(49,1,'prv_msg_upload_path','{base_path}images/pm_attachments/'),
	(50,1,'prv_msg_max_attachments','3'),
	(51,1,'prv_msg_attach_maxsize','250'),
	(52,1,'prv_msg_attach_total','100'),
	(53,1,'prv_msg_html_format','safe'),
	(54,1,'prv_msg_auto_links','y'),
	(55,1,'prv_msg_max_chars','6000'),
	(56,1,'memberlist_order_by','member_id'),
	(57,1,'memberlist_sort_order','desc'),
	(58,1,'memberlist_row_limit','20'),
	(59,1,'approved_member_notification',''),
	(60,1,'declined_member_notification',''),
	(61,1,'is_site_on','y'),
	(62,1,'base_url','https://dev.ee-skeleton.com/'),
	(63,1,'base_path','/Users/SDemanett/Sites/localhost/expressionengine-skeleton/'),
	(64,1,'site_index',''),
	(65,1,'site_url','{base_url}'),
	(66,1,'cp_url','{base_url}admin.php'),
	(67,1,'theme_folder_url','{base_url}themes/'),
	(68,1,'theme_folder_path','{base_path}themes/'),
	(69,1,'webmaster_email','stevendemanett@gmail.com'),
	(70,1,'webmaster_name',''),
	(71,1,'channel_nomenclature','channel'),
	(72,1,'max_caches','150'),
	(73,1,'captcha_url','{base_url}images/captchas/'),
	(74,1,'captcha_path','{base_path}images/captchas/'),
	(75,1,'captcha_font','y'),
	(76,1,'captcha_rand','y'),
	(77,1,'captcha_require_members','n'),
	(78,1,'require_captcha','n'),
	(79,1,'enable_sql_caching','n'),
	(80,1,'force_query_string','n'),
	(81,1,'show_profiler','n'),
	(82,1,'include_seconds','n'),
	(83,1,'cookie_domain',''),
	(84,1,'cookie_path','/'),
	(85,1,'cookie_httponly',''),
	(86,1,'cookie_secure',''),
	(87,1,'website_session_type','c'),
	(88,1,'cp_session_type','c'),
	(89,1,'allow_username_change','y'),
	(90,1,'allow_multi_logins','y'),
	(91,1,'password_lockout','y'),
	(92,1,'password_lockout_interval','1'),
	(93,1,'require_ip_for_login','y'),
	(94,1,'require_ip_for_posting','y'),
	(95,1,'require_secure_passwords','n'),
	(96,1,'allow_dictionary_pw','y'),
	(97,1,'name_of_dictionary_file',''),
	(98,1,'xss_clean_uploads','y'),
	(99,1,'redirect_method','redirect'),
	(100,1,'deft_lang','english'),
	(101,1,'xml_lang','en'),
	(102,1,'send_headers','y'),
	(103,1,'gzip_output','n'),
	(104,1,'default_site_timezone','America/New_York'),
	(105,1,'date_format','%n/%j/%Y'),
	(106,1,'time_format','12'),
	(107,1,'mail_protocol','mail'),
	(108,1,'email_newline','\\n'),
	(109,1,'smtp_server',''),
	(110,1,'smtp_port',''),
	(111,1,'smtp_username',''),
	(112,1,'smtp_password',''),
	(113,1,'email_smtp_crypto','ssl'),
	(114,1,'email_debug','n'),
	(115,1,'email_charset','utf-8'),
	(116,1,'email_batchmode','n'),
	(117,1,'email_batch_size',''),
	(118,1,'mail_format','plain'),
	(119,1,'word_wrap','y'),
	(120,1,'email_console_timelock','5'),
	(121,1,'log_email_console_msgs','y'),
	(122,1,'log_search_terms','y'),
	(123,1,'deny_duplicate_data','y'),
	(124,1,'redirect_submitted_links','n'),
	(125,1,'enable_censoring','n'),
	(126,1,'censored_words',''),
	(127,1,'censor_replacement',''),
	(128,1,'banned_ips',''),
	(129,1,'banned_emails',''),
	(130,1,'banned_usernames',''),
	(131,1,'banned_screen_names',''),
	(132,1,'ban_action','restrict'),
	(133,1,'ban_message','This site is currently unavailable'),
	(134,1,'ban_destination','http://www.yahoo.com/'),
	(135,1,'enable_emoticons','y'),
	(136,1,'emoticon_url','https://dev.ee-skeleton.com/images/smileys/'),
	(137,1,'recount_batch_total','1000'),
	(138,1,'new_version_check','y'),
	(139,1,'enable_throttling','n'),
	(140,1,'banish_masked_ips','y'),
	(141,1,'max_page_loads','10'),
	(142,1,'time_interval','8'),
	(143,1,'lockout_time','30'),
	(144,1,'banishment_type','message'),
	(145,1,'banishment_url',''),
	(146,1,'banishment_message','You have exceeded the allowed page load frequency.'),
	(147,1,'enable_search_log','y'),
	(148,1,'max_logged_searches','500'),
	(149,1,'rte_enabled','y'),
	(150,1,'rte_default_toolset_id','1'),
	(151,1,'forum_trigger',''),
	(152,1,'enable_template_routes','y'),
	(153,1,'strict_urls','y'),
	(154,1,'site_404',''),
	(155,1,'save_tmpl_revisions','n'),
	(156,1,'max_tmpl_revisions','5'),
	(157,1,'tmpl_file_basepath',''),
	(158,0,'cache_driver','dummy'),
	(159,0,'debug','2'),
	(160,0,'dynamic_tracking_disabling','500'),
	(161,0,'enable_entry_view_tracking','n'),
	(162,0,'enable_hit_tracking','n'),
	(163,0,'enable_online_user_tracking','n'),
	(164,0,'is_system_on','y'),
	(165,0,'multiple_sites_enabled','n'),
	(166,1,'site_license_key',''),
	(167,1,'show_ee_news','n'),
	(168,0,'cli_enabled','y'),
	(169,1,'password_security_policy','none'),
	(170,0,'legacy_member_data','n'),
	(171,0,'legacy_channel_data','n'),
	(172,0,'legacy_category_field_data','n'),
	(173,0,'file_manager_compatibility_mode','n'),
	(175,0,'enable_dock','n'),
	(176,0,'enable_frontedit','y'),
	(177,0,'automatic_frontedit_links','y'),
	(178,0,'enable_mfa','y'),
	(179,0,'autosave_interval_seconds','10'),
	(180,1,'enable_entry_cloning','n'),
	(181,0,'legacy_member_data','n'),
	(182,0,'legacy_channel_data','n'),
	(183,0,'legacy_category_field_data','n'),
	(184,0,'file_manager_compatibility_mode','n'),
	(186,0,'legacy_member_data','n'),
	(187,0,'legacy_channel_data','n'),
	(188,0,'legacy_category_field_data','n'),
	(189,0,'file_manager_compatibility_mode','n'),
	(190,0,'week_start','sunday');

/*!40000 ALTER TABLE `exp_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consent_audit_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_audit_log`;

CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` bigint(10) NOT NULL DEFAULT '0',
  `consent_request_version_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`consent_audit_id`),
  KEY `consent_request_id` (`consent_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_consent_request_version_cookies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_request_version_cookies`;

CREATE TABLE `exp_consent_request_version_cookies` (
  `consent_request_version_cookies_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_version_id` int(10) unsigned NOT NULL,
  `cookie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`consent_request_version_cookies_id`),
  KEY `consent_request_version_cookies` (`consent_request_version_id`,`cookie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_consent_request_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_request_versions`;

CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `create_date` bigint(10) NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`consent_request_version_id`),
  KEY `consent_request_id` (`consent_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_consent_request_versions` WRITE;
/*!40000 ALTER TABLE `exp_consent_request_versions` DISABLE KEYS */;

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`)
VALUES
	(1,1,'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.','none',1607033726,0),
	(2,2,'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.','none',1607033726,0),
	(3,3,'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.','none',1607033726,0);

/*!40000 ALTER TABLE `exp_consent_request_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consent_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_requests`;

CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_version_id` int(10) unsigned DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`consent_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_consent_requests` WRITE;
/*!40000 ALTER TABLE `exp_consent_requests` DISABLE KEYS */;

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`)
VALUES
	(1,1,'n','Functionality Cookies','ee:cookies_functionality','n',NULL),
	(2,2,'n','Performance Cookies','ee:cookies_performance','n',NULL),
	(3,3,'n','Targeting Cookies','ee:cookies_targeting','n',NULL);

/*!40000 ALTER TABLE `exp_consent_requests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consents`;

CREATE TABLE `exp_consents` (
  `consent_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int(10) unsigned NOT NULL,
  `consent_request_version_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` bigint(10) DEFAULT NULL,
  `response_date` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`consent_id`),
  KEY `consent_request_version_id` (`consent_request_version_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_content_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_content_types`;

CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;

INSERT INTO `exp_content_types` (`content_type_id`, `name`)
VALUES
	(2,'channel'),
	(1,'grid');

/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cookie_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cookie_settings`;

CREATE TABLE `exp_cookie_settings` (
  `cookie_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cookie_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_lifetime` int(10) unsigned DEFAULT NULL,
  `cookie_enforced_lifetime` int(10) unsigned DEFAULT NULL,
  `cookie_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cookie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_cookie_settings` WRITE;
/*!40000 ALTER TABLE `exp_cookie_settings` DISABLE KEYS */;

INSERT INTO `exp_cookie_settings` (`cookie_id`, `cookie_provider`, `cookie_name`, `cookie_lifetime`, `cookie_enforced_lifetime`, `cookie_title`, `cookie_description`)
VALUES
	(1,'ee','csrf_token',7200,NULL,'CSRF Token','A security cookie used to identify the user and prevent Cross Site Request Forgery attacks.'),
	(2,'ee','flash',0,NULL,'Flash data','Control panel user feedback messages, encrypted for security.'),
	(3,'ee','remember',1209600,NULL,'Remember Me','Determines whether a user is automatically logged in upon visiting the site.'),
	(4,'ee','sessionid',3600,NULL,'Session ID','Session id, used to associate a logged in user with their data.'),
	(5,'ee','visitor_consents',NULL,NULL,'Visitor Consents','Saves responses to Consent requests for non-logged in visitors'),
	(6,'ee','last_activity',NULL,NULL,'Last Activity','Records the time of the last page load. Used in in calculating active sessions.'),
	(7,'ee','last_visit',NULL,NULL,'Last Visit','Date of the user’s last visit, based on the last_activity cookie. Can be shown as a statistic for members and used by forum and comments to show unread topics for both members and guests.'),
	(8,'ee','anon',NULL,NULL,'Anonymize','Determines whether the user’s username is displayed in the list of currently logged in members.'),
	(9,'ee','tracker',0,NULL,'Tracker','Contains the last 5 pages viewed, encrypted for security. Typically used for form or error message returns.'),
	(10,'ee','viewtype',NULL,NULL,'Filemanager View Type','Determines View Type to be used in Filemanager (table or thumbs view)'),
	(11,'ee','cp_last_site_id',NULL,NULL,'CP Last Site ID','MSM cookie indicating the last site accessed in the control panel.'),
	(12,'ee','ee_cp_viewmode',NULL,NULL,'ee_cp_viewmode',NULL),
	(13,'ee','collapsed_nav',NULL,NULL,'Collapsed Navigation','Determines whether navigation sidebar is control panel should be collapsed.'),
	(14,'pro','frontedit',NULL,NULL,'Front-end editing','Determines whether ExpressioEngine Pro front-end editing features should be enabled.'),
	(15,'comment','my_email',NULL,NULL,'My email','Email address specified when posting a comment.'),
	(16,'comment','my_location',NULL,NULL,'My location','Location specified when posting a comment.'),
	(17,'comment','my_name',NULL,NULL,'My name','Name specified when posting a comment.'),
	(18,'comment','my_url',NULL,NULL,'My URL','URL specified when posting a comment.'),
	(19,'comment','notify_me',NULL,NULL,'Notify me','If set to ‘yes’, notifications will be sent to the saved email address when new comments are made.'),
	(20,'comment','save_info',NULL,NULL,'Save info','If set to ‘yes’, allows additional cookies (my_email, my_location, my_name, my_url) to store guest user information for use when filling out comment forms. This cookie is only set if you submit a comment.'),
	(21,'forum','forum_theme',NULL,NULL,'Forum Theme','If multiple forum themes exist, this cookie allows the user to save their theme preference.'),
	(22,'forum','forum_topics',NULL,NULL,'Forum Topics','Tracks the id number for read topics, allows setting the ‘read’ status. Saved in the cookie for guests, the database for members.'),
	(23,'cp','secondary_sidebar',NULL,NULL,'Secondary Sidebar State','Determines whether secondary navigation sidebar in the Control Panel should be collapsed for each corresponding section.');

/*!40000 ALTER TABLE `exp_cookie_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` bigint(10) NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`)
VALUES
	(1,1,1,'admin','::1',1607033732,'Logged in'),
	(2,1,1,'admin','::1',1607039922,'Logged in'),
	(3,1,1,'admin','::1',1607040931,'Logged out'),
	(4,1,1,'admin','::1',1607041397,'Logged in'),
	(5,1,1,'admin','::1',1607042451,'Logged out'),
	(6,1,1,'admin','::1',1607355298,'Logged in'),
	(7,1,1,'admin','::1',1607355345,'Logged in'),
	(8,1,1,'admin','::1',1607458267,'Logged in'),
	(9,1,1,'admin','::1',1608069042,'Logged in'),
	(10,1,1,'admin','::1',1608238505,'Logged in'),
	(11,1,1,'admin','::1',1608244204,'Logged out'),
	(12,1,1,'admin','::1',1608244206,'Logged in'),
	(13,1,0,'0','::1',1608300050,'Hash algorithm changed for \"admin\" (1)'),
	(14,1,1,'admin','::1',1608300050,'Logged in'),
	(15,1,1,'admin','::1',1608306686,'Logged in'),
	(16,1,1,'admin','::1',1609775523,'Logged in'),
	(17,1,1,'admin','::1',1609779180,'Logged in'),
	(18,1,1,'admin','::1',1609876684,'Logged in'),
	(19,1,1,'admin','::1',1610735982,'Logged in'),
	(20,1,1,'admin','::1',1610747448,'Logged in'),
	(21,1,1,'admin','::1',1610981756,'Logged in'),
	(22,1,1,'admin','::1',1611072406,'Logged in'),
	(23,1,1,'admin','::1',1611074502,'Logged in'),
	(24,1,1,'admin','::1',1611074509,'Logged in'),
	(25,1,1,'admin','::1',1611074523,'Logged in'),
	(26,1,1,'admin','::1',1611074528,'Logged in'),
	(27,1,1,'admin','::1',1611074648,'Logged in'),
	(28,1,1,'admin','::1',1611583814,'Logged in'),
	(29,1,1,'admin','::1',1611609569,'Logged in'),
	(30,1,1,'admin','::1',1611669846,'Logged in'),
	(31,1,1,'admin','::1',1611676801,'Logged in'),
	(32,1,1,'admin','::1',1612212058,'Logged in'),
	(33,1,1,'admin','::1',1612300093,'Logged in'),
	(34,1,1,'admin','::1',1634420541,'Logged in'),
	(35,1,1,'admin','::1',1636512626,'Logged in'),
	(36,1,1,'admin','::1',1636512631,'Logged out'),
	(37,1,1,'admin','::1',1636512646,'Logged in'),
	(38,1,1,'admin','::1',1645569821,'Logged in'),
	(39,1,1,'admin','::1',1646692248,'Logged in'),
	(40,1,1,'admin','::1',1674257253,'Logged in'),
	(41,1,1,'admin','::1',1674257417,'Started updating file usage'),
	(42,1,1,'admin','::1',1674257417,'File usage update complete. 1 database tables were affected.'),
	(43,1,1,'admin','::1',1674271882,'Logged in'),
	(44,1,1,'admin','::1',1674271941,'Started updating file usage'),
	(45,1,1,'admin','::1',1674271941,'File usage update complete. 1 database tables were affected.'),
	(46,1,1,'admin','::1',1674273108,'Started updating file usage'),
	(47,1,1,'admin','::1',1674273108,'File usage update complete. 1 database tables were affected.'),
	(48,1,1,'admin','::1',1677557026,'Logged in'),
	(49,1,1,'admin','::1',1697831830,'Logged in'),
	(50,1,1,'admin','::1',1698245012,'Logged in'),
	(51,1,1,'admin','::1',1701808253,'Logged in'),
	(52,1,1,'admin','::1',1754065393,'Logged in');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_dashboard_layout_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_layout_widgets`;

CREATE TABLE `exp_dashboard_layout_widgets` (
  `dashboard_layout_widgets_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` int(10) unsigned NOT NULL,
  `widget_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dashboard_layout_widgets_id`),
  KEY `layouts_widgets` (`layout_id`,`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_dashboard_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_layouts`;

CREATE TABLE `exp_dashboard_layouts` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`layout_id`),
  KEY `member_id` (`member_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_dashboard_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_widgets`;

CREATE TABLE `exp_dashboard_widgets` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `widget_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `widget_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `exp_dashboard_widgets` DISABLE KEYS */;

INSERT INTO `exp_dashboard_widgets` (`widget_id`, `widget_name`, `widget_data`, `widget_type`, `widget_source`, `widget_file`)
VALUES
	(1,NULL,NULL,'php','pro','comments'),
	(2,NULL,NULL,'php','pro','eecms_news'),
	(3,NULL,NULL,'php','pro','members'),
	(4,NULL,NULL,'php','pro','recent_entries'),
	(5,NULL,NULL,'php','pro','recent_templates'),
	(6,NULL,NULL,'html','pro','support');

/*!40000 ALTER TABLE `exp_dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_developer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_dock_prolets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dock_prolets`;

CREATE TABLE `exp_dock_prolets` (
  `dock_prolets_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dock_id` int(10) unsigned NOT NULL,
  `prolet_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dock_prolets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_dock_prolets` WRITE;
/*!40000 ALTER TABLE `exp_dock_prolets` DISABLE KEYS */;

INSERT INTO `exp_dock_prolets` (`dock_prolets_id`, `dock_id`, `prolet_id`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,1,3);

/*!40000 ALTER TABLE `exp_dock_prolets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_docks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_docks`;

CREATE TABLE `exp_docks` (
  `dock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_docks` WRITE;
/*!40000 ALTER TABLE `exp_docks` DISABLE KEYS */;

INSERT INTO `exp_docks` (`dock_id`, `site_id`)
VALUES
	(1,0);

/*!40000 ALTER TABLE `exp_docks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_eeharbor_licenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_eeharbor_licenses`;

CREATE TABLE `exp_eeharbor_licenses` (
  `site_id` int(11) unsigned NOT NULL DEFAULT '0',
  `addon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `license_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ignore_site` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`license_key`),
  KEY `site_id_addon` (`site_id`,`addon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`cache_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_entry_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_manager_views`;

CREATE TABLE `exp_entry_manager_views` (
  `view_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(6) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `channel_id` (`channel_id`,`member_id`),
  KEY `channel_id_2` (`channel_id`,`member_id`),
  KEY `channel_id_3` (`channel_id`,`member_id`),
  KEY `channel_id_4` (`channel_id`,`member_id`),
  KEY `channel_id_5` (`channel_id`,`member_id`),
  KEY `channel_id_6` (`channel_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` bigint(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`)
VALUES
	(1,'Comment_ext','addCommentMenu','cp_custom_menu','a:0:{}',10,'2.3.3','y'),
	(4,'Structure_ext','after_channel_entry_save','after_channel_entry_save','a:0:{}',10,'6.0.0','y'),
	(5,'Structure_ext','sessions_end','sessions_end','a:0:{}',10,'6.0.0','y'),
	(6,'Structure_ext','entry_submission_redirect','entry_submission_redirect','a:0:{}',10,'6.0.0','y'),
	(7,'Structure_ext','cp_member_login','cp_member_login','a:0:{}',10,'6.0.0','y'),
	(8,'Structure_ext','sessions_start','sessions_start','a:0:{}',10,'6.0.0','y'),
	(9,'Structure_ext','pagination_create','pagination_create','a:0:{}',10,'6.0.0','y'),
	(10,'Structure_ext','wygwam_config','wygwam_config','a:0:{}',10,'6.0.0','y'),
	(11,'Structure_ext','core_template_route','core_template_route','a:0:{}',10,'6.0.0','y'),
	(12,'Structure_ext','entry_submission_end','entry_submission_end','a:0:{}',10,'6.0.0','y'),
	(13,'Structure_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','a:0:{}',10,'6.0.0','y'),
	(14,'Structure_ext','template_post_parse','template_post_parse','a:0:{}',10,'6.0.0','y'),
	(15,'Structure_ext','cp_custom_menu','cp_custom_menu','a:0:{}',10,'6.0.0','y'),
	(16,'Structure_ext','publish_live_preview_route','publish_live_preview_route','a:0:{}',10,'6.0.0','y'),
	(17,'Structure_ext','entry_save_and_close_redirect','entry_save_and_close_redirect','a:0:{}',10,'6.0.0','y');

/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_condition_sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_condition_sets`;

CREATE TABLE `exp_field_condition_sets` (
  `condition_set_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`condition_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_condition_sets_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_condition_sets_channel_fields`;

CREATE TABLE `exp_field_condition_sets_channel_fields` (
  `condition_set_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`condition_set_id`,`field_id`),
  KEY `condition_set_id_field_id` (`condition_set_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_conditions`;

CREATE TABLE `exp_field_conditions` (
  `condition_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `condition_set_id` int(10) unsigned NOT NULL,
  `condition_field_id` int(10) unsigned NOT NULL,
  `evaluation_rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`condition_id`),
  KEY `condition_set_id` (`condition_set_id`),
  KEY `condition_field_id` (`condition_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci,
  `short_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`)
VALUES
	(1,'select','1.0.0','YTowOnt9','n'),
	(2,'text','1.0.0','YTowOnt9','n'),
	(3,'textarea','1.0.0','YTowOnt9','n'),
	(4,'date','1.0.0','YTowOnt9','n'),
	(5,'duration','1.0.0','YTowOnt9','n'),
	(6,'email_address','1.0.0','YTowOnt9','n'),
	(7,'file','1.0.0','YTowOnt9','n'),
	(8,'fluid_field','1.0.0','YTowOnt9','n'),
	(9,'grid','1.0.0','YTowOnt9','n'),
	(10,'file_grid','1.0.0','YTowOnt9','n'),
	(11,'multi_select','1.0.0','YTowOnt9','n'),
	(12,'checkboxes','1.0.0','YTowOnt9','n'),
	(13,'radio','1.0.0','YTowOnt9','n'),
	(14,'relationship','1.0.0','YTowOnt9','n'),
	(15,'rte','2.2.0','YTowOnt9','n'),
	(16,'toggle','1.0.0','YTowOnt9','n'),
	(17,'url','1.0.0','YTowOnt9','n'),
	(18,'structure','6.0.0','YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9','n'),
	(19,'wygwam','6.0.2','YTowOnt9','n'),
	(20,'colorpicker','1.0.0','YTowOnt9','n'),
	(21,'slider','1.0.0','YTowOnt9','n'),
	(22,'range_slider','1.0.0','YTowOnt9','n'),
	(23,'selectable_buttons','1.0.0','YTowOnt9','n'),
	(24,'number','1.0.0','YTowOnt9','n'),
	(25,'notes','1.0.0','YTowOnt9','n'),
	(26,'member','2.4.0','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`file_id`,`cat_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_data`;

CREATE TABLE `exp_file_data` (
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_dimensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) unsigned DEFAULT '90',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_manager_views`;

CREATE TABLE `exp_file_manager_views` (
  `view_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `viewtype` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `upload_id` int(6) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `viewtype_upload_id_member_id` (`viewtype`,`upload_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_usage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_usage`;

CREATE TABLE `exp_file_usage` (
  `file_usage_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_usage_id`),
  KEY `file_id` (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_watermarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` enum('File','Directory') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'File',
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `directory_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` bigint(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` bigint(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_records` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`),
  KEY `model_type` (`model_type`),
  KEY `file_type` (`file_type`),
  KEY `directory_id` (`directory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_fluid_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fluid_field_data`;

CREATE TABLE `exp_fluid_field_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fluid_field_id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `field_data_id` int(11) unsigned NOT NULL,
  `order` int(5) unsigned NOT NULL DEFAULT '0',
  `field_group_id` int(10) unsigned DEFAULT NULL,
  `group` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_grid_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_grid_columns`;

CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`)
VALUES
	(1,1,0,'html_btn_bold','<strong>','</strong>','b',1,'1','html-bold'),
	(2,1,0,'html_btn_italic','<em>','</em>','i',2,'1','html-italic'),
	(3,1,0,'html_btn_blockquote','<blockquote>','</blockquote>','q',3,'1','html-quote'),
	(4,1,0,'html_btn_anchor','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','html-link'),
	(5,1,0,'html_btn_picture','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','html-upload');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_layout_publish_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish_member_roles`;

CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int(10) unsigned NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`layout_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` bigint(10) unsigned NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;

INSERT INTO `exp_member_data` (`member_id`)
VALUES
	(1);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int(3) unsigned DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_manager_views`;

CREATE TABLE `exp_member_manager_views` (
  `view_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(6) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `columns` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `role_id_member_id` (`role_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_news_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_news_views`;

CREATE TABLE `exp_member_news_views` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_member_news_views` WRITE;
/*!40000 ALTER TABLE `exp_member_news_views` DISABLE KEYS */;

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`)
VALUES
	(1,'5.4.0',1);

/*!40000 ALTER TABLE `exp_member_news_views` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_relationships`;

CREATE TABLE `exp_member_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT '0',
  `child_id` int(10) unsigned DEFAULT '0',
  `field_id` int(10) unsigned DEFAULT '0',
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `fluid_field_data_id` (`fluid_field_data_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` bigint(10) unsigned NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` bigint(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_start` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` text COLLATE utf8mb4_unicode_ci,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_pro_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `backup_mfa_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending_role_id` int(10) NOT NULL DEFAULT '0',
  `dismissed_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`role_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;

INSERT INTO `exp_members` (`member_id`, `role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `week_start`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `dismissed_pro_banner`, `enable_mfa`, `backup_mfa_code`, `pending_role_id`, `dismissed_banner`)
VALUES
	(1,1,'admin','admin','$2y$10$fkT7XkprjQuaY8m4RHkBP.WoGzJkwoi92hli4Jek8E96hche6wuZu','','6736fc35dc74d7f8f5c1d55e56f81db25a780e4c','ab14c17d26cceb2fd03af10ea5fb3ecef924f245',NULL,'stevendemanett@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'::1',1607033726,1702411601,1754066458,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','english','America/New_York',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,'',NULL,'n',0,NULL,NULL,NULL,'y','n',NULL,0,'n');

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_members_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members_role_groups`;

CREATE TABLE `exp_members_role_groups` (
  `member_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members_roles`;

CREATE TABLE `exp_members_roles` (
  `member_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_members_roles` WRITE;
/*!40000 ALTER TABLE `exp_members_roles` DISABLE KEYS */;

INSERT INTO `exp_members_roles` (`member_id`, `role_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `exp_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_menu_items`;

CREATE TABLE `exp_menu_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `set_id` (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_menu_items` WRITE;
/*!40000 ALTER TABLE `exp_menu_items` DISABLE KEYS */;

INSERT INTO `exp_menu_items` (`item_id`, `parent_id`, `set_id`, `name`, `data`, `type`, `sort`)
VALUES
	(1,0,1,'Structure','Structure_ext','addon',1),
	(2,0,1,'Template Manager','cp/design/manager/site','link',2);

/*!40000 ALTER TABLE `exp_menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_menu_sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_menu_sets`;

CREATE TABLE `exp_menu_sets` (
  `set_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_menu_sets` WRITE;
/*!40000 ALTER TABLE `exp_menu_sets` DISABLE KEYS */;

INSERT INTO `exp_menu_sets` (`set_id`, `name`)
VALUES
	(1,'Default');

/*!40000 ALTER TABLE `exp_menu_sets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_migrations`;

CREATE TABLE `exp_migrations` (
  `migration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` text COLLATE utf8mb4_unicode_ci,
  `migration_location` text COLLATE utf8mb4_unicode_ci,
  `migration_group` int(10) unsigned DEFAULT NULL,
  `migration_run_date` datetime NOT NULL,
  PRIMARY KEY (`migration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_module_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_roles`;

CREATE TABLE `exp_module_member_roles` (
  `role_id` int(10) NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`)
VALUES
	(1,'Channel','2.1.0','n','n'),
	(2,'Comment','2.3.3','y','n'),
	(3,'Consent','1.0.0','n','n'),
	(4,'Member','2.2.1','n','n'),
	(5,'Stats','2.2.0','n','n'),
	(6,'Rte','2.2.0','y','n'),
	(7,'File','1.1.0','n','n'),
	(8,'Filepicker','1.0','y','n'),
	(9,'Relationship','1.0.0','n','n'),
	(10,'Search','2.3.0','n','n'),
	(11,'Structure','6.0.0','y','y'),
	(12,'Wygwam','6.0.2','y','n'),
	(13,'Pro','2.0.0','n','n');

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` bigint(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`)
VALUES
	(1,1636512605,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.23 Safari/537.36','ee-skeleton');

/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_permissions`;

CREATE TABLE `exp_permissions` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `site_id` int(5) unsigned NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `role_id_site_id` (`role_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_permissions` WRITE;
/*!40000 ALTER TABLE `exp_permissions` DISABLE KEYS */;

INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`)
VALUES
	(1,1,1,'can_view_offline_system'),
	(2,1,1,'can_view_online_system'),
	(3,1,1,'can_access_cp'),
	(4,1,1,'can_access_footer_report_bug'),
	(5,1,1,'can_access_footer_new_ticket'),
	(6,1,1,'can_access_footer_user_guide'),
	(7,1,1,'can_view_homepage_news'),
	(8,1,1,'can_access_files'),
	(9,1,1,'can_access_design'),
	(10,1,1,'can_access_addons'),
	(11,1,1,'can_access_members'),
	(12,1,1,'can_access_sys_prefs'),
	(13,1,1,'can_access_comm'),
	(14,1,1,'can_access_utilities'),
	(15,1,1,'can_access_data'),
	(16,1,1,'can_access_logs'),
	(17,1,1,'can_admin_channels'),
	(18,1,1,'can_admin_design'),
	(19,1,1,'can_delete_members'),
	(20,1,1,'can_admin_roles'),
	(21,1,1,'can_admin_mbr_templates'),
	(22,1,1,'can_ban_users'),
	(23,1,1,'can_admin_addons'),
	(24,1,1,'can_edit_categories'),
	(25,1,1,'can_delete_categories'),
	(26,1,1,'can_view_other_entries'),
	(27,1,1,'can_view_other_comments'),
	(28,1,1,'can_edit_own_comments'),
	(29,1,1,'can_delete_own_comments'),
	(30,1,1,'can_edit_all_comments'),
	(31,1,1,'can_delete_all_comments'),
	(32,1,1,'can_moderate_comments'),
	(33,1,1,'can_send_cached_email'),
	(34,1,1,'can_email_roles'),
	(35,1,1,'can_email_from_profile'),
	(36,1,1,'can_view_profiles'),
	(37,1,1,'can_edit_html_buttons'),
	(38,1,1,'can_delete_self'),
	(39,1,1,'can_post_comments'),
	(40,1,1,'can_search'),
	(41,1,1,'can_send_private_messages'),
	(42,1,1,'can_attach_in_private_messages'),
	(43,1,1,'can_send_bulletins'),
	(44,1,1,'can_upload_new_files'),
	(45,1,1,'can_edit_files'),
	(46,1,1,'can_delete_files'),
	(47,1,1,'can_upload_new_toolsets'),
	(48,1,1,'can_edit_toolsets'),
	(49,1,1,'can_delete_toolsets'),
	(50,1,1,'can_create_upload_directories'),
	(51,1,1,'can_edit_upload_directories'),
	(52,1,1,'can_delete_upload_directories'),
	(53,1,1,'can_create_channels'),
	(54,1,1,'can_edit_channels'),
	(55,1,1,'can_delete_channels'),
	(56,1,1,'can_create_channel_fields'),
	(57,1,1,'can_edit_channel_fields'),
	(58,1,1,'can_delete_channel_fields'),
	(59,1,1,'can_create_statuses'),
	(60,1,1,'can_delete_statuses'),
	(61,1,1,'can_edit_statuses'),
	(62,1,1,'can_create_categories'),
	(63,1,1,'can_create_roles'),
	(64,1,1,'can_delete_roles'),
	(65,1,1,'can_edit_roles'),
	(66,1,1,'can_create_members'),
	(67,1,1,'can_edit_members'),
	(68,1,1,'can_create_template_groups'),
	(69,1,1,'can_edit_template_groups'),
	(70,1,1,'can_delete_template_groups'),
	(71,1,1,'can_create_template_partials'),
	(72,1,1,'can_edit_template_partials'),
	(73,1,1,'can_delete_template_partials'),
	(74,1,1,'can_create_template_variables'),
	(75,1,1,'can_delete_template_variables'),
	(76,1,1,'can_edit_template_variables'),
	(77,1,1,'can_access_security_settings'),
	(78,1,1,'can_access_translate'),
	(79,1,1,'can_access_import'),
	(80,1,1,'can_access_sql_manager'),
	(81,1,1,'can_moderate_spam'),
	(82,1,1,'can_manage_consents'),
	(83,2,1,'can_view_homepage_news'),
	(84,3,1,'can_view_online_system'),
	(85,3,1,'can_view_homepage_news'),
	(86,4,1,'can_view_online_system'),
	(87,4,1,'can_view_homepage_news'),
	(88,5,1,'can_view_online_system'),
	(89,5,1,'can_view_homepage_news'),
	(90,5,1,'can_email_from_profile'),
	(91,5,1,'can_view_profiles'),
	(92,5,1,'can_edit_html_buttons'),
	(93,5,1,'can_delete_self'),
	(94,5,1,'can_send_private_messages'),
	(95,5,1,'can_attach_in_private_messages'),
	(96,1,1,'can_access_dock'),
	(97,1,1,'can_access_dock'),
	(98,1,1,'can_access_dock'),
	(99,1,1,'can_edit_member_fields');

/*!40000 ALTER TABLE `exp_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_plugins`;

CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_prolets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_prolets`;

CREATE TABLE `exp_prolets` (
  `prolet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`prolet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_prolets` WRITE;
/*!40000 ALTER TABLE `exp_prolets` DISABLE KEYS */;

INSERT INTO `exp_prolets` (`prolet_id`, `source`, `class`)
VALUES
	(1,'structure','Structure_pro'),
	(2,'pro','Entries_pro'),
	(3,'channel','Channel_pro');

/*!40000 ALTER TABLE `exp_prolets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `fluid_field_data_id` (`fluid_field_data_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_remember_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;

INSERT INTO `exp_remember_me` (`remember_me_id`, `member_id`, `ip_address`, `user_agent`, `admin_sess`, `site_id`, `expiration`, `last_refresh`)
VALUES
	('31c49d60f95d6c4c187c6d78b23a58f0f8f61154',1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.84 Safari/537.36',0,1,1647901848,1646692248),
	('b1bae08c9fc11e69e2441439fffa0a07a78180f3',1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',0,1,1703600196,1702390596),
	('dd76c6c325407901f30c9b7c5ffb50e5076ed4e9',1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.23 Safari/537.36',0,1,1637722246,1636512646);

/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` bigint(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_role_groups`;

CREATE TABLE `exp_role_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_role_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_role_settings`;

CREATE TABLE `exp_role_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `menu_set_id` int(5) unsigned NOT NULL DEFAULT '1',
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_create_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_new_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `require_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_field_names` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_role_settings` WRITE;
/*!40000 ALTER TABLE `exp_role_settings` DISABLE KEYS */;

INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `is_locked`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `require_mfa`, `show_field_names`)
VALUES
	(1,1,1,1,'y','y','y','y','y',NULL,'y',0,20,60,'y','y',NULL,0,NULL,'y','y','y','y','y','n','y'),
	(2,2,1,0,'n','n','n','n','n',NULL,'n',60,20,60,'n','n',NULL,0,NULL,'n','n','n','n','n','n','y'),
	(3,3,1,0,'n','n','n','n','n',NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','n','n','n','n','n','y'),
	(4,4,1,0,'n','n','n','n','n',NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','n','n','n','n','n','y'),
	(5,5,1,0,'n','n','n','n','n',NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','n','n','n','n','n','y');

/*!40000 ALTER TABLE `exp_role_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_roles`;

CREATE TABLE `exp_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_members` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `highlight` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_roles` WRITE;
/*!40000 ALTER TABLE `exp_roles` DISABLE KEYS */;

INSERT INTO `exp_roles` (`role_id`, `name`, `short_name`, `description`, `is_locked`, `total_members`, `highlight`)
VALUES
	(1,'Super Admin','super_admin','','y',1,''),
	(2,'Banned','banned','','n',0,''),
	(3,'Guests','guests','','n',0,''),
	(4,'Pending','pending','','n',0,''),
	(5,'Members','members','','n',0,'');

/*!40000 ALTER TABLE `exp_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_roles_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_roles_role_groups`;

CREATE TABLE `exp_roles_role_groups` (
  `role_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`group_id`),
  KEY `group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_rte_toolsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `toolset_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `toolset_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`toolset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `toolset_name`, `settings`, `toolset_type`)
VALUES
	(1,'Basic','YTozOntzOjc6InRvb2xiYXIiO2E6Njp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo5OiJ1bmRlcmxpbmUiO2k6MztzOjEyOiJudW1iZXJlZExpc3QiO2k6NDtzOjEyOiJidWxsZXRlZExpc3QiO2k6NTtzOjQ6ImxpbmsiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTA6InVwbG9hZF9kaXIiO3M6MzoiYWxsIjt9','ckeditor'),
	(2,'Full','YTozOntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjQ6ImJvbGQiO2k6MTtzOjY6Iml0YWxpYyI7aToyO3M6MTM6InN0cmlrZXRocm91Z2giO2k6MztzOjk6InVuZGVybGluZSI7aTo0O3M6OToic3Vic2NyaXB0IjtpOjU7czoxMToic3VwZXJzY3JpcHQiO2k6NjtzOjEwOiJibG9ja3F1b3RlIjtpOjc7czo0OiJjb2RlIjtpOjg7czo3OiJoZWFkaW5nIjtpOjk7czoxMjoicmVtb3ZlRm9ybWF0IjtpOjEwO3M6NDoidW5kbyI7aToxMTtzOjQ6InJlZG8iO2k6MTI7czoxMjoibnVtYmVyZWRMaXN0IjtpOjEzO3M6MTI6ImJ1bGxldGVkTGlzdCI7aToxNDtzOjc6Im91dGRlbnQiO2k6MTU7czo2OiJpbmRlbnQiO2k6MTY7czo0OiJsaW5rIjtpOjE3O3M6MTE6ImZpbGVtYW5hZ2VyIjtpOjE4O3M6MTE6Imluc2VydFRhYmxlIjtpOjE5O3M6MTA6Im1lZGlhRW1iZWQiO2k6MjA7czoxNDoiYWxpZ25tZW50OmxlZnQiO2k6MjE7czoxNToiYWxpZ25tZW50OnJpZ2h0IjtpOjIyO3M6MTY6ImFsaWdubWVudDpjZW50ZXIiO2k6MjM7czoxNzoiYWxpZ25tZW50Omp1c3RpZnkiO2k6MjQ7czoxNDoiaG9yaXpvbnRhbExpbmUiO2k6MjU7czoxNzoic3BlY2lhbENoYXJhY3RlcnMiO2k6MjY7czo4OiJyZWFkTW9yZSI7aToyNztzOjk6ImZvbnRDb2xvciI7aToyODtzOjE5OiJmb250QmFja2dyb3VuZENvbG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7fQ==','ckeditor'),
	(3,'Redactor Basic','YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6Njp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo5OiJ1bmRlcmxpbmUiO2k6MztzOjI6Im9sIjtpOjQ7czoyOiJ1bCI7aTo1O3M6NDoibGluayI7fXM6NzoicGx1Z2lucyI7YTowOnt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=','redactor'),
	(4,'Redactor Full','YTo0OntzOjQ6InR5cGUiO3M6ODoicmVkYWN0b3IiO3M6NzoidG9vbGJhciI7YToyOntzOjc6ImJ1dHRvbnMiO2E6MTY6e2k6MDtzOjQ6Imh0bWwiO2k6MTtzOjY6ImZvcm1hdCI7aToyO3M6NDoiYm9sZCI7aTozO3M6NjoiaXRhbGljIjtpOjQ7czo3OiJkZWxldGVkIjtpOjU7czo5OiJ1bmRlcmxpbmUiO2k6NjtzOjQ6InJlZG8iO2k6NztzOjQ6InVuZG8iO2k6ODtzOjI6Im9sIjtpOjk7czoyOiJ1bCI7aToxMDtzOjY6ImluZGVudCI7aToxMTtzOjc6Im91dGRlbnQiO2k6MTI7czozOiJzdXAiO2k6MTM7czozOiJzdWIiO2k6MTQ7czo0OiJsaW5rIjtpOjE1O3M6NDoibGluZSI7fXM6NzoicGx1Z2lucyI7YToxNTp7aTowO3M6OToiYWxpZ25tZW50IjtpOjE7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aToyO3M6MTE6ImZpbGVicm93c2VyIjtpOjM7czo1OiJwYWdlcyI7aTo0O3M6MTE6ImlubGluZXN0eWxlIjtpOjU7czo5OiJmb250Y29sb3IiO2k6NjtzOjc6ImxpbWl0ZXIiO2k6NztzOjc6ImNvdW50ZXIiO2k6ODtzOjEwOiJwcm9wZXJ0aWVzIjtpOjk7czoxMjoic3BlY2lhbGNoYXJzIjtpOjEwO3M6NToidGFibGUiO2k6MTE7czo1OiJ2aWRlbyI7aToxMjtzOjY6IndpZGdldCI7aToxMztzOjg6InJlYWRtb3JlIjtpOjE0O3M6MTA6ImZ1bGxzY3JlZW4iO319czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7fQ==','redactor'),
	(5,'RedactorX Basic','YTo0OntzOjQ6InR5cGUiO3M6OToicmVkYWN0b3JYIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJuIjtzOjE0OiJ0b29sYmFyX2FkZGJhciI7czoxOiJuIjtzOjE1OiJ0b29sYmFyX2NvbnRleHQiO3M6MToibiI7czoxNToidG9vbGJhcl9jb250cm9sIjtzOjE6Im4iO3M6NDoiaGlkZSI7YTowOnt9czo2OiJ0b3BiYXIiO2E6Mzp7aTowO3M6ODoic2hvcnRjdXQiO2k6MTtzOjQ6InVuZG8iO2k6MjtzOjQ6InJlZG8iO31zOjY6ImFkZGJhciI7YTo2OntpOjA7czo5OiJwYXJhZ3JhcGgiO2k6MTtzOjU6ImVtYmVkIjtpOjI7czo1OiJ0YWJsZSI7aTozO3M6NToicXVvdGUiO2k6NDtzOjM6InByZSI7aTo1O3M6NDoibGluZSI7fXM6NzoiY29udGV4dCI7YTo5OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjc6ImRlbGV0ZWQiO2k6MztzOjQ6ImNvZGUiO2k6NDtzOjQ6ImxpbmsiO2k6NTtzOjQ6Im1hcmsiO2k6NjtzOjM6InN1YiI7aTo3O3M6Mzoic3VwIjtpOjg7czozOiJrYmQiO31zOjY6ImVkaXRvciI7YTo0OntpOjA7czo2OiJmb3JtYXQiO2k6MTtzOjQ6ImJvbGQiO2k6MjtzOjY6Iml0YWxpYyI7aTozO3M6NDoibGluayI7fXM6NjoiZm9ybWF0IjthOjM6e2k6MDtzOjE6InAiO2k6MTtzOjI6InVsIjtpOjI7czoyOiJvbCI7fXM6NzoicGx1Z2lucyI7YTo0OntpOjA7czo5OiJ1bmRlcmxpbmUiO2k6MTtzOjExOiJmaWxlYnJvd3NlciI7aToyO3M6MTY6InJ0ZV9kZWZpbmVkbGlua3MiO2k6MztzOjU6InBhZ2VzIjt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=','redactorX'),
	(6,'RedactorX Full','YTo0OntzOjQ6InR5cGUiO3M6OToicmVkYWN0b3JYIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX2FkZGJhciI7czoxOiJ5IjtzOjE1OiJ0b29sYmFyX2NvbnRleHQiO3M6MToieSI7czoxNToidG9vbGJhcl9jb250cm9sIjtzOjE6InkiO3M6NDoiaGlkZSI7YTowOnt9czo2OiJ0b3BiYXIiO2E6Mzp7aTowO3M6NDoidW5kbyI7aToxO3M6NDoicmVkbyI7aToyO3M6ODoic2hvcnRjdXQiO31zOjY6ImFkZGJhciI7YTo2OntpOjA7czo5OiJwYXJhZ3JhcGgiO2k6MTtzOjU6ImVtYmVkIjtpOjI7czo1OiJ0YWJsZSI7aTozO3M6NToicXVvdGUiO2k6NDtzOjM6InByZSI7aTo1O3M6NDoibGluZSI7fXM6NzoiY29udGV4dCI7YTo5OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjc6ImRlbGV0ZWQiO2k6MztzOjQ6ImNvZGUiO2k6NDtzOjQ6ImxpbmsiO2k6NTtzOjQ6Im1hcmsiO2k6NjtzOjM6InN1YiI7aTo3O3M6Mzoic3VwIjtpOjg7czozOiJrYmQiO31zOjY6ImVkaXRvciI7YTo3OntpOjA7czozOiJhZGQiO2k6MTtzOjQ6Imh0bWwiO2k6MjtzOjY6ImZvcm1hdCI7aTozO3M6NDoiYm9sZCI7aTo0O3M6NjoiaXRhbGljIjtpOjU7czo3OiJkZWxldGVkIjtpOjY7czo0OiJsaW5rIjt9czo2OiJmb3JtYXQiO2E6OTp7aTowO3M6MToicCI7aToxO3M6MjoiaDEiO2k6MjtzOjI6ImgyIjtpOjM7czoyOiJoMyI7aTo0O3M6MjoiaDQiO2k6NTtzOjI6Img1IjtpOjY7czoyOiJoNiI7aTo3O3M6MjoidWwiO2k6ODtzOjI6Im9sIjt9czo3OiJwbHVnaW5zIjthOjE1OntpOjA7czo5OiJ1bmRlcmxpbmUiO2k6MTtzOjk6ImFsaWdubWVudCI7aToyO3M6OToiYmxvY2tjb2RlIjtpOjM7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aTo0O3M6NToicGFnZXMiO2k6NTtzOjExOiJmaWxlYnJvd3NlciI7aTo2O3M6MTM6ImltYWdlcG9zaXRpb24iO2k6NztzOjExOiJpbWFnZXJlc2l6ZSI7aTo4O3M6MTI6ImlubGluZWZvcm1hdCI7aTo5O3M6MTI6InJlbW92ZWZvcm1hdCI7aToxMDtzOjc6ImNvdW50ZXIiO2k6MTE7czo4OiJzZWxlY3RvciI7aToxMjtzOjEyOiJzcGVjaWFsY2hhcnMiO2k6MTM7czoxMzoidGV4dGRpcmVjdGlvbiI7aToxNDtzOjg6InJlYWRtb3JlIjt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=','redactorX');

/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` bigint(10) unsigned NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_result_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` bigint(10) unsigned NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`)
VALUES
	(43,1754065393,'e582095df2c33be422a2d2a31bdb11f0b974f3eb','1498ec488b69b6298a25dc8b86f4161ea20d1684');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `auth_timeout` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mfa_flag` enum('skip','show','required') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip',
  `pro_banner_seen` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`, `mfa_flag`, `pro_banner_seen`)
VALUES
	('e582095df2c33be422a2d2a31bdb11f0b974f3eb',1,1,'::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',NULL,'1f7eee0955e6d012187d486b4effbda7',1754065393,0,1754066466,'0','skip','n');

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_bootstrap_checksums`, `site_pages`, `site_color`)
VALUES
	(1,'ExpressionEngine Skeleton','default_site',NULL,'YToyOntzOjY4OiIvVXNlcnMvU0RlbWFuZXR0L1NpdGVzL2xvY2FsaG9zdC9leHByZXNzaW9uZW5naW5lLXNrZWxldG9uL2luZGV4LnBocCI7czozMjoiYmY1ZTViNWVhNGVkOWZiYjY3YmNlZDAyZDY2Y2MwYTMiO3M6NzoiZW1haWxlZCI7YTowOnt9fQ==','YToxOntpOjE7YToxOntzOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319','');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` bigint(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`)
VALUES
	(1,1,'y','offline_template','','system',NULL,'<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>System Offline</title>\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>System Offline</h3>\n                    </div>\n					<div class=\"panel-body\">\n					This site is currently offline\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>',NULL,1607033726,0),
	(2,1,'y','message_template','','system',NULL,'<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>{title}</title>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n        <meta name=\"referrer\" content=\"no-referrer\">\n        {meta_refresh}\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>{heading}</h3>\n                    </div>\n                    <div class=\"panel-body\">\n                        {content}\n\n\n                    </div>\n                    <div class=\"panel-footer\">\n                        {link}\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>',NULL,1607033726,0),
	(3,1,'y','admin_notify_reg','Notification of new member registration','email','members','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}',NULL,1607033726,0),
	(4,1,'y','admin_notify_entry','A new channel entry has been posted','email','content','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n',NULL,1607033726,0),
	(5,1,'y','admin_notify_comment','You have just received a comment','email','comments','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}',NULL,1607033726,0),
	(6,1,'y','mbr_activation_instructions','Enclosed is your activation code','email','members','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}',NULL,1607033726,0),
	(7,1,'y','forgot_password_instructions','Login information','email','members','To reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(8,1,'y','password_changed_notification','Password changed','email','members','{name},\n\nYour password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(9,1,'y','email_changed_notification','Email address changed','email','members','{name},\n\nYour email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(10,1,'y','validated_member_notify','Your membership account has been activated','email','members','Your membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(11,1,'y','decline_member_validation','Your membership account has been declined','email','members','We\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(12,1,'y','comment_notification','Someone just responded to your comment','email','comments','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}',NULL,1607033726,0),
	(13,1,'y','comments_opened_notification','New comments have been added','email','comments','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}',NULL,1607033726,0),
	(14,1,'y','private_message_notification','Someone has sent you a Private Message','email','private_messages','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}',NULL,1607033726,0),
	(15,1,'y','pm_inbox_full','Your private message mailbox is full','email','private_messages','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}',NULL,1607033726,0),
	(16,1,'y','post_install_message_template','','system',NULL,'<!doctype html>\n<html>\n	<head>\n		<title>Welcome to ExpressionEngine!</title>\n		<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" lang=\"en-us\" dir=\"ltr\">\n		<meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n		<link href=\"{theme_folder_url}cp/css/common.min.css\" rel=\"stylesheet\">\n			</head>\n	<body class=\"installer-page\">\n		<section class=\"flex-wrap\">\n			<section class=\"wrap\">\n				<div class=\"login__logo\">\n  <svg width=\"281px\" height=\"36px\" viewBox=\"0 0 281 36\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n  <title>ExpressionEngine</title>\n  <defs>\n      <polygon id=\"path-1\" points=\"0.3862 0.1747 18.6557 0.1747 18.6557 21.5 0.3862 21.5\"></polygon>\n      <polygon id=\"path-3\" points=\"0.3926 0.17455 13.9915 0.17455 13.9915 15.43755 0.3926 15.43755\"></polygon>\n      <polygon id=\"path-5\" points=\"0 0.06905 25.8202 0.06905 25.8202 31.6178513 0 31.6178513\"></polygon>\n      <polygon id=\"path-7\" points=\"0.10635 0.204 25.9268587 0.204 25.9268587 31.7517 0.10635 31.7517\"></polygon>\n  </defs>\n  <g id=\"logo\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\n      <g id=\"expressionengine\">\n          <path d=\"M92.88015,27.0665 L89.28865,20.955 L94.66665,14.6405 L94.77265,13.9 L91.11315,13.9 L87.86765,17.95 C87.76015,18.0845 87.57265,18.353 87.30415,19.2645 C87.33065,18.353 87.14315,18.0845 87.08965,17.9775 L84.80915,13.9 L80.59815,13.9 L84.62115,20.8475 L78.21065,28.3045 L82.42165,28.3045 L86.04315,23.905 C86.23065,23.664 86.52565,23.154 86.66065,22.5915 C86.66065,23.154 86.79465,23.6905 86.92865,23.905 L89.42265,28.3045 L92.70265,28.3045 L92.88015,27.0665 Z\" id=\"Fill-1\"></path>\n          <path d=\"M80.2395,11.9686 L70.9585,11.9686 L70.288,16.6091 L78.7645,16.6091 L77.4495,19.6141 L69.751,19.6141 C69.805,19.8011 69.805,20.0156 69.778,20.1231 L69.027,25.3011 L78.3345,25.3011 L77.9055,28.3046 L65.003,28.3046 L67.7925,8.9651 L80.6685,8.9651 L80.2395,11.9686 Z\" id=\"Fill-3\"></path>\n          <path d=\"M102.3328,16.20735 C101.5283,16.20735 100.5628,16.34085 99.3558,17.11935 L98.1493,25.46185 C98.8998,25.83735 99.9723,25.99835 100.8848,25.99835 C103.0573,25.99835 104.2378,24.60235 104.7478,20.98085 C104.8548,20.28385 104.9083,19.69385 104.9083,19.18485 C104.9083,17.03835 104.0508,16.20735 102.3328,16.20735 M108.3418,20.98085 C107.6718,25.70235 105.5783,28.73385 100.5093,28.73385 C99.5708,28.73385 98.4978,28.54635 97.5313,28.08985 C97.6128,28.38435 97.6933,28.73385 97.6393,29.02935 L96.8073,34.79585 L93.2133,34.79585 L96.2178,13.89985 L98.7928,13.89985 L99.0878,15.08085 C100.3213,14.00685 101.7703,13.47035 103.1113,13.47035 C106.9473,13.47035 108.5023,15.69685 108.5023,19.05035 C108.5023,19.66735 108.4483,20.31135 108.3418,20.98085\" id=\"Fill-5\"></path>\n          <path d=\"M119.33865,16.69 C118.74815,16.609 118.13215,16.555 117.48715,16.555 C116.46815,16.555 115.39515,16.716 114.45615,17.28 L112.87415,28.3045 L109.27965,28.3045 L111.34515,13.8995 L114.29515,13.8995 L114.51115,15.0535 C115.71715,13.8995 116.92465,13.4705 118.21215,13.4705 C118.72265,13.4705 119.25865,13.5515 119.79515,13.659 L119.33865,16.69 Z\" id=\"Fill-7\"></path>\n          <path d=\"M127.43385,16.31455 C125.39585,16.31455 124.40285,17.09155 123.81285,19.61405 L129.71435,19.61405 C129.76785,19.29205 129.79435,18.99655 129.79435,18.72855 C129.79435,17.14555 129.01685,16.31455 127.43385,16.31455 M133.03985,22.13505 L123.35635,22.13505 C123.30235,22.56405 123.27685,22.93955 123.27685,23.28855 C123.27685,25.05905 124.08085,25.89105 126.06585,25.89105 C127.91685,25.89105 128.96335,25.08605 129.74035,23.90505 L132.44985,25.00505 C131.18885,27.41855 128.82885,28.73355 125.66385,28.73355 C121.58635,28.73355 119.73535,26.56055 119.73535,22.93955 C119.73535,22.34955 119.78885,21.73305 119.86985,21.08855 C120.64685,15.80405 122.95485,13.47055 127.86285,13.47055 C132.31635,13.47055 133.33585,16.60905 133.33585,19.29205 C133.33585,20.09655 133.17435,21.16955 133.03985,22.13505\" id=\"Fill-9\"></path>\n          <path d=\"M144.11795,17.70905 C143.60895,16.79705 142.66995,16.28705 141.19395,16.28705 C140.04145,16.28705 138.64595,16.52905 138.64595,17.97755 C138.64595,18.48755 138.88745,18.91655 139.53145,19.02405 L142.64245,19.58655 C144.60095,19.93605 146.20995,21.03455 146.20995,23.12755 C146.20995,27.23155 142.80295,28.73355 139.23545,28.73355 C136.71445,28.73355 134.73045,27.87555 133.76445,25.62255 L136.76845,24.52255 C137.33245,25.54155 138.24395,25.99805 139.61245,25.99805 C140.95345,25.99805 142.61595,25.59505 142.61595,23.93255 C142.61595,23.34255 142.34795,22.91355 141.56945,22.77855 L138.21645,22.16255 C136.66095,21.86655 135.13145,20.68655 135.13145,18.46005 C135.13145,14.65055 138.27045,13.47055 141.59695,13.47055 C144.57445,13.47055 146.20995,14.67805 146.93445,16.39455 L144.11795,17.70905 Z\" id=\"Fill-11\"></path>\n          <path d=\"M157.28835,17.70905 C156.77935,16.79705 155.84135,16.28705 154.36435,16.28705 C153.21235,16.28705 151.81785,16.52905 151.81785,17.97755 C151.81785,18.48755 152.05935,18.91655 152.70335,19.02405 L155.81435,19.58655 C157.77285,19.93605 159.38185,21.03455 159.38185,23.12755 C159.38185,27.23155 155.97385,28.73355 152.40635,28.73355 C149.88635,28.73355 147.90085,27.87555 146.93585,25.62255 L149.93885,24.52255 C150.50285,25.54155 151.41585,25.99805 152.78285,25.99805 C154.12535,25.99805 155.78685,25.59505 155.78685,23.93255 C155.78685,23.34255 155.51985,22.91355 154.74135,22.77855 L151.38835,22.16255 C149.83185,21.86655 148.30235,20.68655 148.30235,18.46005 C148.30235,14.65055 151.44085,13.47055 154.76885,13.47055 C157.74485,13.47055 159.38185,14.67805 160.10535,16.39455 L157.28835,17.70905 Z\" id=\"Fill-13\"></path>\n          <path d=\"M168.0188,11.0294 C167.9908,11.2714 167.9908,11.2714 167.7768,11.2714 L164.2888,11.2714 C164.0743,11.2714 164.0743,11.2714 164.1018,11.0294 L164.5858,7.7039 C164.6108,7.4359 164.6108,7.4084 164.8253,7.4084 L168.3133,7.4084 C168.5278,7.4084 168.5278,7.4359 168.5003,7.7039 L168.0188,11.0294 Z M167.2953,28.5464 L165.4688,28.5464 C163.3783,28.5464 162.3583,27.6334 162.3583,25.7564 C162.3583,25.4619 162.3853,25.1659 162.4378,24.8169 L163.5128,17.3874 C163.5378,17.1729 163.6728,16.8509 163.8873,16.6089 L161.2853,16.6089 L161.6618,13.8999 L167.5898,13.8999 L166.0328,24.8169 C166.0083,24.9514 166.0083,25.0864 166.0083,25.1934 C166.0083,25.5154 166.1398,25.6229 166.5443,25.6229 L167.6968,25.6229 L167.2953,28.5464 Z\" id=\"Fill-15\"></path>\n          <path d=\"M176.8977,16.31455 C174.6972,16.31455 173.6242,17.44105 173.0882,21.08855 C172.9807,21.81305 172.9262,22.45705 172.9262,22.99305 C172.9262,25.16605 173.7837,25.89105 175.5282,25.89105 C177.7007,25.89105 178.8562,24.76305 179.3922,21.08855 C179.4997,20.39105 179.5522,19.77455 179.5522,19.23855 C179.5522,17.03805 178.6662,16.31455 176.8977,16.31455 M182.9852,21.08855 C182.2617,26.07805 180.0887,28.73355 175.1262,28.73355 C170.8872,28.73355 169.3582,26.13155 169.3582,22.85955 C169.3582,22.29555 169.4132,21.67955 169.4927,21.08855 C170.2167,16.01905 172.3647,13.47055 177.3267,13.47055 C181.5377,13.47055 183.1197,15.93905 183.1197,19.26455 C183.1197,19.85455 183.0672,20.44455 182.9852,21.08855\" id=\"Fill-17\"></path>\n          <path d=\"M197.21265,19.23835 L195.89815,28.30435 L192.33015,28.30435 L193.64515,19.23835 C193.70015,18.91635 193.72465,18.59485 193.72465,18.29935 C193.72465,17.06535 193.24365,16.26085 191.90115,16.26085 C190.80115,16.26085 189.51415,16.87685 188.46865,17.52085 L186.91165,28.30435 L183.34415,28.30435 L185.41015,13.89985 L188.36115,13.89985 L188.60315,15.21435 C190.26465,13.89985 191.60665,13.47035 193.10865,13.47035 C196.11265,13.47035 197.32015,15.37535 197.32015,17.92385 C197.32015,18.35285 197.26715,18.78185 197.21265,19.23835\" id=\"Fill-19\"></path>\n          <path d=\"M214.45925,11.9686 L205.17825,11.9686 L204.51025,16.6091 L212.98475,16.6091 L211.67025,19.6141 L203.97075,19.6141 C204.02625,19.8011 204.02625,20.0156 203.99875,20.1231 L203.24775,25.3011 L212.55525,25.3011 L212.12675,28.3046 L199.22325,28.3046 L202.01525,8.9651 L214.89075,8.9651 L214.45925,11.9686 Z\" id=\"Fill-21\"></path>\n          <path d=\"M227.8411,19.23835 L226.5266,28.30435 L222.9586,28.30435 L224.2736,19.23835 C224.3261,18.91635 224.3531,18.59485 224.3531,18.29935 C224.3531,17.06535 223.8696,16.26085 222.5301,16.26085 C221.4296,16.26085 220.1426,16.87685 219.0946,17.52085 L217.5401,28.30435 L213.9726,28.30435 L216.0386,13.89985 L218.9871,13.89985 L219.2291,15.21435 C220.8931,13.89985 222.2331,13.47035 223.7371,13.47035 C226.7411,13.47035 227.9486,15.37535 227.9486,17.92385 C227.9486,18.35285 227.8936,18.78185 227.8411,19.23835\" id=\"Fill-23\"></path>\n          <g id=\"Group-27\" transform=\"translate(227.500000, 13.296000)\">\n              <mask id=\"mask-2\" fill=\"white\">\n                  <use xlink:href=\"#path-1\"></use>\n              </mask>\n              <g id=\"Clip-26\"></g>\n              <path d=\"M9.7742,2.9912 C7.7607,2.9912 6.6082,4.1452 6.6082,6.1297 C6.6082,7.4702 7.4667,8.0342 9.0232,8.0342 C11.0342,8.0342 12.1612,6.9617 12.1612,4.9772 C12.1612,3.6622 11.3832,2.9912 9.7742,2.9912 L9.7742,2.9912 Z M10.1207,15.0622 L5.0787,14.1227 C4.2757,14.9812 3.9262,15.5447 3.9262,16.7522 C3.9262,18.1197 4.8917,18.7372 7.4667,18.7372 C9.1557,18.7372 11.4907,18.4687 11.4907,16.2957 C11.4907,15.6262 11.1412,15.2507 10.1207,15.0622 L10.1207,15.0622 Z M18.3312,3.3132 L16.5872,3.3132 C16.3457,3.3132 15.7542,3.2867 15.3002,3.0722 C15.5672,3.7157 15.6742,4.4392 15.6742,5.0307 C15.6742,9.2142 12.3482,10.8237 8.6187,10.8237 C7.7882,10.8237 6.9852,10.7437 6.2862,10.5827 C6.1792,10.5552 6.0717,10.5292 5.9372,10.5292 C5.5352,10.5292 5.2932,10.7437 5.2932,11.1452 C5.2932,11.4137 5.4282,11.6017 6.0167,11.7092 L11.1962,12.6747 C14.0652,13.2112 15.0577,14.4447 15.0577,16.0277 C15.0577,20.6682 10.7122,21.5002 7.0647,21.5002 C4.1682,21.5002 0.3862,20.7217 0.3862,17.1002 C0.3862,15.2232 1.3767,13.6142 2.9857,12.6482 C2.6637,12.2457 2.5042,11.7902 2.5042,11.3597 C2.5042,10.3947 3.2007,9.6437 4.0062,9.2142 C3.4972,8.5707 3.0682,7.5517 3.0682,6.3717 C3.0682,2.1602 6.3387,0.1747 10.1757,0.1747 C11.5177,0.1747 12.9372,0.4167 13.9852,1.0862 L16.0537,0.6212 L18.6557,0.6212 L18.3312,3.3132 Z\" id=\"Fill-25\" mask=\"url(#mask-2)\"></path>\n          </g>\n          <path d=\"M251.54175,11.0294 C251.51675,11.2714 251.51675,11.2714 251.30225,11.2714 L247.81475,11.2714 C247.59975,11.2714 247.59975,11.2714 247.62725,11.0294 L248.10925,7.7039 C248.13625,7.4359 248.13625,7.4084 248.35075,7.4084 L251.83875,7.4084 C252.05275,7.4084 252.05275,7.4359 252.02575,7.7039 L251.54175,11.0294 Z M250.81825,28.5464 L248.99425,28.5464 C246.90175,28.5464 245.88375,27.6334 245.88375,25.7564 C245.88375,25.4619 245.91075,25.1659 245.96375,24.8169 L247.03575,17.3874 C247.06375,17.1729 247.19825,16.8509 247.41275,16.6089 L244.81075,16.6089 L245.18475,13.8999 L251.11275,13.8999 L249.55825,24.8169 C249.53125,24.9514 249.53125,25.0864 249.53125,25.1934 C249.53125,25.5154 249.66575,25.6229 250.06725,25.6229 L251.21975,25.6229 L250.81825,28.5464 Z\" id=\"Fill-28\"></path>\n          <path d=\"M266.32595,19.23835 L265.01095,28.30435 L261.44345,28.30435 L262.75845,19.23835 C262.81345,18.91635 262.83795,18.59485 262.83795,18.29935 C262.83795,17.06535 262.35695,16.26085 261.01445,16.26085 C259.91445,16.26085 258.62695,16.87685 257.58195,17.52085 L256.02445,28.30435 L252.45745,28.30435 L254.52345,13.89985 L257.47445,13.89985 L257.71645,15.21435 C259.37795,13.89985 260.71995,13.47035 262.22195,13.47035 C265.22595,13.47035 266.43345,15.37535 266.43345,17.92385 C266.43345,18.35285 266.38045,18.78185 266.32595,19.23835\" id=\"Fill-30\"></path>\n          <g id=\"Group-34\" transform=\"translate(267.000000, 13.296000)\">\n              <mask id=\"mask-4\" fill=\"white\">\n                  <use xlink:href=\"#path-3\"></use>\n              </mask>\n              <g id=\"Clip-33\"></g>\n              <path d=\"M8.0916,3.01855 C6.0531,3.01855 5.0606,3.79555 4.4691,6.31805 L10.3716,6.31805 C10.4241,5.99605 10.4516,5.70055 10.4516,5.43255 C10.4516,3.84955 9.6731,3.01855 8.0916,3.01855 M13.6971,8.83905 L4.0126,8.83905 C3.9596,9.26805 3.9326,9.64355 3.9326,9.99255 C3.9326,11.76305 4.7381,12.59505 6.7216,12.59505 C8.5731,12.59505 9.6211,11.79005 10.3961,10.60905 L13.1056,11.70905 C11.8461,14.12255 9.4861,15.43755 6.3201,15.43755 C2.2436,15.43755 0.3926,13.26455 0.3926,9.64355 C0.3926,9.05355 0.4446,8.43705 0.5271,7.79255 C1.3031,2.50805 3.6106,0.17455 8.5201,0.17455 C12.9736,0.17455 13.9916,3.31305 13.9916,5.99605 C13.9916,6.80055 13.8316,7.87355 13.6971,8.83905\" id=\"Fill-32\" mask=\"url(#mask-4)\"></path>\n          </g>\n          <path d=\"M20.60205,17.64605 C21.11355,14.75605 22.01655,12.45255 23.28405,10.79305 C24.18105,9.60555 25.17405,9.00405 26.23755,9.00405 C26.80055,9.00405 27.27705,9.22055 27.65305,9.64955 C28.01805,10.06905 28.20405,10.64605 28.20405,11.36305 C28.20405,13.02405 27.45705,14.53555 25.98455,15.86155 C24.91705,16.81355 23.20305,17.51055 20.89205,17.93305 L20.53855,17.99805 L20.60205,17.64605 Z M30.67305,21.68355 C29.37505,22.92855 28.23905,23.80705 27.31805,24.24655 C26.34905,24.70655 25.34805,24.93855 24.34355,24.93855 C23.11755,24.93855 22.12155,24.54805 21.38655,23.77655 C20.65105,23.00705 20.27805,21.90355 20.27805,20.49455 L20.37305,19.08355 L20.56855,19.05005 C24.00755,18.47005 26.60155,17.80655 28.27555,17.07555 C29.93155,16.35405 31.14005,15.49505 31.86855,14.52405 C32.59155,13.56105 32.95655,12.59155 32.95655,11.65055 C32.95655,10.50805 32.52355,9.59355 31.63105,8.84705 C30.73555,8.10155 29.44355,7.72455 27.79455,7.72455 C25.50305,7.72455 23.33455,8.25905 21.34955,9.31405 C19.36805,10.36805 17.78305,11.82905 16.64005,13.65605 C15.50005,15.48105 14.92155,17.41555 14.92155,19.40105 C14.92155,21.61755 15.60505,23.39505 16.95205,24.68005 C18.30455,25.96905 20.19355,26.62005 22.56705,26.62005 C24.25255,26.62005 25.84755,26.28155 27.30805,25.61355 C28.70455,24.97455 30.14905,23.86705 31.60805,22.37255 C31.33005,22.16805 30.87005,21.82855 30.67305,21.68355 L30.67305,21.68355 Z\" id=\"Fill-35\"></path>\n          <g id=\"Group-39\" transform=\"translate(0.000000, 2.796000)\">\n              <mask id=\"mask-6\" fill=\"white\">\n                  <use xlink:href=\"#path-5\"></use>\n              </mask>\n              <g id=\"Clip-38\"></g>\n              <path d=\"M7.2737,19.35005 C5.3202,11.70605 9.9462,3.71505 17.8897,0.06905 C17.6907,0.14055 17.5042,0.22255 17.3077,0.29605 C17.5087,0.20005 17.6882,0.11955 17.8272,0.07205 L2.9432,3.91255 L6.9112,6.26005 C1.7147,10.66105 -0.9663,16.11555 0.3187,21.14505 C2.3302,29.02005 13.3457,33.12605 25.8202,31.10805 C17.1117,31.75655 9.2257,26.99355 7.2737,19.35005\" id=\"Fill-37\" mask=\"url(#mask-6)\"></path>\n          </g>\n          <g id=\"Group-42\" transform=\"translate(23.500000, 0.296000)\">\n              <mask id=\"mask-8\" fill=\"white\">\n                  <use xlink:href=\"#path-7\"></use>\n              </mask>\n              <g id=\"Clip-41\"></g>\n              <path d=\"M18.65285,12.4697 C20.60635,20.1147 15.98135,28.1052 8.03735,31.7517 C8.23585,31.6797 8.42235,31.5977 8.61885,31.5232 C8.41785,31.6212 8.23835,31.7002 8.09935,31.7482 L22.98335,27.9087 L19.01585,25.5612 C24.21185,21.1597 26.89285,15.7042 25.60835,10.6747 C23.59635,2.8027 12.58085,-1.3053 0.10635,0.7142 C8.81435,0.0637 16.70135,4.8267 18.65285,12.4697\" id=\"Fill-40\" mask=\"url(#mask-8)\"></path>\n          </g>\n      </g>\n    </g>\n  </svg>\n</div>\n				<div class=\"panel warn\">\n  <div class=\"panel-heading\" style=\"text-align: center;\">\n    <h3>ExpressionEngine has been installed!</h3>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"updater-msg\">\n  		<p style=\"margin-bottom: 20px;\">If you see this message, then everything went well.</p>\n\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fas fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If you are site owner, please login into your Control Panel and create your first template.</p>\n    		</div>\n  		</div>\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fas fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If this is your first time using ExpressionEngine CMS, make sure to <a href=\"https://docs.expressionengine.com/latest/getting-started/the-big-picture.html\">check out the documentation</a> to get started.</p>\n    		</div>\n  		</div>\n  	</div>\n  </div>\n  <div class=\"panel-footer\">\n\n  </div>\n</div>\n			</div>\n			<section class=\"bar\">\n				<p style=\"float: left;\"><a href=\"https://expressionengine.com/\" rel=\"external\"><b>ExpressionEngine</b></a></p>\n				<p style=\"float: right;\">&copy;2020 <a href=\"https://packettide.com/\" rel=\"external\">Packet Tide</a>, LLC</p>\n			</section>\n		</section>\n\n	</body>\n</html>',NULL,1608244647,0),
	(17,1,'y','forgot_username_instructions','Username information','email','members','{name},\n\nYour username is: {username}\n\nIf you didn\\\'t request your username yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1636512662,0),
	(18,1,'y','mfa_template','','system',NULL,'<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n        \n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n        \n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n        \n        *, :after, :before {\n            box-sizing: inherit;\n        }\n        \n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n        \n        body {\n            font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n        \n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n        \n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n        \n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        .panel-body {\n            padding: 20px 25px;\n        }\n        \n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n        \n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n        \n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n        \n        a:hover {\n            color: var(--ee-link-hover);\n        }\n        \n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n        \n        ol, ul {\n            padding-left: 0;\n        }\n        \n        ol li, ul li {\n            list-style-position: inside;\n        }\n        \n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n        \n        fieldset.last {\n            margin-bottom: 0;\n        }\n        \n        .field-instruct {\n            margin-bottom: 5px;\n        }\n        \n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n        \n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n        \n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n        \n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n        \n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n        \n        input:focus {\n            outline: 0;\n        }\n        \n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n        \n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n        \n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n        \n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n        \n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n        \n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n        \n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n        \n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n        \n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n        \n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n        \n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n        \n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n        \n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n        \n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>',NULL,1645569843,0),
	(19,1,'y','mfa_template','','system',NULL,'<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n        \n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n        \n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n        \n        *, :after, :before {\n            box-sizing: inherit;\n        }\n        \n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n        \n        body {\n            font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n        \n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n        \n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n        \n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        .panel-body {\n            padding: 20px 25px;\n        }\n        \n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n        \n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n        \n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n        \n        a:hover {\n            color: var(--ee-link-hover);\n        }\n        \n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n        \n        ol, ul {\n            padding-left: 0;\n        }\n        \n        ol li, ul li {\n            list-style-position: inside;\n        }\n        \n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n        \n        fieldset.last {\n            margin-bottom: 0;\n        }\n        \n        .field-instruct {\n            margin-bottom: 5px;\n        }\n        \n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n        \n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n        \n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n        \n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n        \n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n        \n        input:focus {\n            outline: 0;\n        }\n        \n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n        \n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n        \n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n        \n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n        \n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n        \n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n        \n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n        \n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n        \n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n        \n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n        \n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n        \n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n        \n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n        \n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>',NULL,1645570064,0),
	(20,1,'y','mfa_template','','system',NULL,'<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n        \n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n        \n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n        \n        *, :after, :before {\n            box-sizing: inherit;\n        }\n        \n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n        \n        body {\n            font-family: Roboto,system-ui,-apple-system,BlinkMacSystemFont,\"Segoe UI\",Roboto,Ubuntu,\"Helvetica Neue\",Oxygen,Cantarell,sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n        \n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n        \n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n        \n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        .panel-body {\n            padding: 20px 25px;\n        }\n        \n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n        \n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n        \n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n        \n        a:hover {\n            color: var(--ee-link-hover);\n        }\n        \n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n        \n        ol, ul {\n            padding-left: 0;\n        }\n        \n        ol li, ul li {\n            list-style-position: inside;\n        }\n        \n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n        \n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n        \n        fieldset.last {\n            margin-bottom: 0;\n        }\n        \n        .field-instruct {\n            margin-bottom: 5px;\n        }\n        \n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n        \n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n        \n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n        \n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n        \n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n        \n        input:focus {\n            outline: 0;\n        }\n        \n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n        \n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n        \n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n        \n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n        \n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n        \n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n        \n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n        \n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n        \n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n        \n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n        \n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n        \n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n        \n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n        \n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>',NULL,1645570125,0);

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` bigint(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`)
VALUES
	(1,1,1,1,'admin',0,0,0,0,1607033726,0,0,0,0,0,1754670159);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`)
VALUES
	(1,'open',1,'009933'),
	(2,'closed',2,'990000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_statuses_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses_roles`;

CREATE TABLE `exp_statuses_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `status_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_statuses_roles` WRITE;
/*!40000 ALTER TABLE `exp_statuses_roles` DISABLE KEYS */;

INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`)
VALUES
	(5,1),
	(5,2);

/*!40000 ALTER TABLE `exp_statuses_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure`;

CREATE TABLE `exp_structure` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `listing_cid` int(6) unsigned NOT NULL DEFAULT '0',
  `lft` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rgt` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `structure_url_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`, `structure_url_title`, `template_id`, `updated`)
VALUES
	(0,0,0,0,0,1,2,'root','n',NULL,0,'2020-12-08 15:20:56');

/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_channels`;

CREATE TABLE `exp_structure_channels` (
  `site_id` smallint(5) unsigned NOT NULL,
  `channel_id` mediumint(8) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_structure_listings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_listings`;

CREATE TABLE `exp_structure_listings` (
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `template_id` int(6) unsigned NOT NULL DEFAULT '0',
  `uri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_structure_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_members`;

CREATE TABLE `exp_structure_members` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `nav_state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_structure_nav_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_nav_history`;

CREATE TABLE `exp_structure_nav_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint(5) unsigned NOT NULL,
  `site_pages` longtext COLLATE utf8mb4_unicode_ci,
  `structure` longtext COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `structure_version` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `current` smallint(5) unsigned NOT NULL DEFAULT '0',
  `restored_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_nav_history` WRITE;
/*!40000 ALTER TABLE `exp_structure_nav_history` DISABLE KEYS */;

INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`)
VALUES
	(1,1,'','[]','Upgraded Structure to 4.7.0','4.7.0','2020-12-17 17:04:30',0,NULL),
	(2,1,'YToxOntpOjE7YToxOntzOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319','[]','Upgraded Structure to 5.0.0','5.0.0','2021-11-09 21:58:05',0,NULL),
	(3,1,'YToxOntpOjE7YToxOntzOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319','[]','Pre 5.1.2 update structure nav','6.0.0','2023-01-20 18:30:58',0,NULL),
	(4,1,'YToxOntpOjE7YToxOntzOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319','[]','Upgraded Structure to 6.0.0','6.0.0','2023-01-20 18:30:58',1,NULL);

/*!40000 ALTER TABLE `exp_structure_nav_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_settings`;

CREATE TABLE `exp_structure_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `var_value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`)
VALUES
	(1,0,'action_ajax_move','26'),
	(2,0,'module_id','11'),
	(3,1,'show_picker','y'),
	(4,1,'show_view_page','y'),
	(5,1,'show_global_add_page','y'),
	(6,1,'hide_hidden_templates','y'),
	(7,1,'redirect_on_login','n'),
	(8,1,'redirect_on_publish','n'),
	(9,1,'add_trailing_slash','y');

/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`)
VALUES
	(2,1,'site',1,'y'),
	(3,1,'pro-dashboard-widgets',2,'n');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups_roles`;

CREATE TABLE `exp_template_groups_roles` (
  `role_id` int(10) NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_template_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_routes`;

CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_engine` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` bigint(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_engine`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`, `enable_frontedit`)
VALUES
	(2,1,2,'index','webpage',NULL,'{layout=\"site/_base-layout\"}',NULL,1674274098,0,'n',0,'','n','n','o',0,'n','y'),
	(3,1,2,'_base-layout','webpage',NULL,'<!doctype html>\n<html lang=\"en\">\n\n<head>\n    <!-- Required meta tags -->\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n\n    <title>{site_name}{if layout:seo_title != \'\'} | {layout:seo_title}{/if}</title>\n\n    <meta name=\"description\" content=\"{layout:seo_description}\">\n    <link rel=\"canonical\" href=\"{site_url}{current_path}\"/>\n\n    <!-- Favicon Code -->\n    <!-- https://realfavicongenerator.net -->\n    <!-- End Favicon Code -->\n\n    <link rel=\"stylesheet\" href=\"{site_url}css/styles.min.css?v=0.0.1\" type=\"text/css\">\n    {layout:css}\n\n    <!-- Google Tag Manager -->\n\n    <!-- End Google Tag Manager -->\n</head>\n\n<body>\n    {layout:contents}\n    {layout:js}\n</body>\n\n</html>',NULL,1636512585,1,'n',0,'','n','n','o',0,'n','y'),
	(4,1,3,'sample-widget','webpage',NULL,'{widget title=\"Demo dashboard widget\" width=\"half\"}\n\n<p>Random entry: {exp:channel:entries dynamic=\"no\" orderby=\"random\" limit=\"1\"}<a href=\"{cp_url}?/cp/publish/edit/entry/{entry_id}&S={cp_session_id}\">{title}</a>{/exp:channel:entries}</p>\n\n<p>To see this code please visit the template <a href=\"{cp_url}?/cp/design/template/edit/4&S={cp_session_id}\">pro-dashboard-widgets/sample-widget</a>.</p>\n',NULL,1674273066,0,'n',0,'','n','n','o',0,'n','y'),
	(5,1,3,'index','webpage',NULL,'',NULL,1674273066,1,'n',0,'','n','n','o',0,'n','y');

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_templates_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates_roles`;

CREATE TABLE `exp_templates_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_templates_roles` WRITE;
/*!40000 ALTER TABLE `exp_templates_roles` DISABLE KEYS */;

INSERT INTO `exp_templates_roles` (`role_id`, `template_id`)
VALUES
	(1,3),
	(1,4),
	(1,5),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(3,2),
	(3,3),
	(3,4),
	(3,5),
	(4,2),
	(4,3),
	(4,4),
	(4,5),
	(5,2),
	(5,3),
	(5,4),
	(5,5);

/*!40000 ALTER TABLE `exp_templates_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_update_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_update_log`;

CREATE TABLE `exp_update_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_update_log` WRITE;
/*!40000 ALTER TABLE `exp_update_log` DISABLE KEYS */;

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`)
VALUES
	(1,1607033726,'Smartforge::add_key failed. Table \'exp_comments\' does not exist.','Smartforge::add_key',106,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/EllisLab/Addons/comment/upd.comment.php'),
	(2,1608244637,'Updating to 6.0.0-b.1',NULL,NULL,NULL),
	(3,1608244643,'Updating to 6.0.0-b.2',NULL,NULL,NULL),
	(4,1608244644,'Updating to 6.0.0-b.3',NULL,NULL,NULL),
	(5,1608244645,'Updating to 6.0.0-b.4',NULL,NULL,NULL),
	(6,1608244646,'Updating to 6.0.0-rc.1',NULL,NULL,NULL),
	(7,1608244647,'Updating to 6.0.0',NULL,NULL,NULL),
	(8,1608244648,'Update complete. Now running version 6.0.0.',NULL,NULL,NULL),
	(9,1611609584,'Running database update step: runUpdateFile[ud_6_00_01.php]',NULL,NULL,NULL),
	(10,1611609584,'Update complete. Now running version 6.0.1',NULL,NULL,NULL),
	(11,1611609631,'Running database update step: runUpdateFile[ud_6_00_01.php]',NULL,NULL,NULL),
	(12,1611609631,'Update complete. Now running version 6.0.1',NULL,NULL,NULL),
	(13,1636512660,'Running database update step: runUpdateFile[ud_6_00_02.php]',NULL,NULL,NULL),
	(14,1636512660,'Running database update step: runUpdateFile[ud_6_00_03.php]',NULL,NULL,NULL),
	(15,1636512660,'Running database update step: runUpdateFile[ud_6_00_04.php]',NULL,NULL,NULL),
	(16,1636512660,'Running database update step: runUpdateFile[ud_6_00_05.php]',NULL,NULL,NULL),
	(17,1636512661,'Running database update step: runUpdateFile[ud_6_00_06.php]',NULL,NULL,NULL),
	(18,1636512661,'Running database update step: runUpdateFile[ud_6_01_00_rc_1.php]',NULL,NULL,NULL),
	(19,1636512661,'Running database update step: runUpdateFile[ud_6_01_00.php]',NULL,NULL,NULL),
	(20,1636512661,'Running database update step: runUpdateFile[ud_6_01_01.php]',NULL,NULL,NULL),
	(21,1636512662,'Running database update step: runUpdateFile[ud_6_01_02.php]',NULL,NULL,NULL),
	(22,1636512662,'Running database update step: runUpdateFile[ud_6_01_03.php]',NULL,NULL,NULL),
	(23,1636512662,'Running database update step: runUpdateFile[ud_6_01_04.php]',NULL,NULL,NULL),
	(24,1636512662,'Running database update step: runUpdateFile[ud_6_01_05.php]',NULL,NULL,NULL),
	(25,1636512662,'Update complete. Now running version 6.1.5',NULL,NULL,NULL),
	(26,1645569843,'Running database update step: runUpdateFile[ud_6_01_06.php]',NULL,NULL,NULL),
	(27,1645569843,'Running database update step: runUpdateFile[ud_6_02_00.php]',NULL,NULL,NULL),
	(28,1645569844,'Running database update step: runUpdateFile[ud_6_02_01.php]',NULL,NULL,NULL),
	(29,1645569844,'Running database update step: runUpdateFile[ud_6_02_02.php]',NULL,NULL,NULL),
	(30,1645569844,'Running database update step: runUpdateFile[ud_6_02_03.php]',NULL,NULL,NULL),
	(31,1645569844,'Running database update step: runUpdateFile[ud_6_02_04.php]',NULL,NULL,NULL),
	(32,1645569844,'Running database update step: runUpdateFile[ud_6_02_05.php]',NULL,NULL,NULL),
	(33,1645569844,'Update complete. Now running version 6.2.5',NULL,NULL,NULL),
	(34,1645570064,'Running database update step: runUpdateFile[ud_6_01_06.php]',NULL,NULL,NULL),
	(35,1645570064,'Running database update step: runUpdateFile[ud_6_02_00.php]',NULL,NULL,NULL),
	(36,1645570064,'Running database update step: runUpdateFile[ud_6_02_01.php]',NULL,NULL,NULL),
	(37,1645570064,'Running database update step: runUpdateFile[ud_6_02_02.php]',NULL,NULL,NULL),
	(38,1645570064,'Running database update step: runUpdateFile[ud_6_02_03.php]',NULL,NULL,NULL),
	(39,1645570064,'Running database update step: runUpdateFile[ud_6_02_04.php]',NULL,NULL,NULL),
	(40,1645570064,'Running database update step: runUpdateFile[ud_6_02_05.php]',NULL,NULL,NULL),
	(41,1645570064,'Update complete. Now running version 6.2.5',NULL,NULL,NULL),
	(42,1645570125,'Running database update step: runUpdateFile[ud_6_01_06.php]',NULL,NULL,NULL),
	(43,1645570125,'Running database update step: runUpdateFile[ud_6_02_00.php]',NULL,NULL,NULL),
	(44,1645570125,'Running database update step: runUpdateFile[ud_6_02_01.php]',NULL,NULL,NULL),
	(45,1645570125,'Running database update step: runUpdateFile[ud_6_02_02.php]',NULL,NULL,NULL),
	(46,1645570125,'Running database update step: runUpdateFile[ud_6_02_03.php]',NULL,NULL,NULL),
	(47,1645570125,'Running database update step: runUpdateFile[ud_6_02_04.php]',NULL,NULL,NULL),
	(48,1645570125,'Running database update step: runUpdateFile[ud_6_02_05.php]',NULL,NULL,NULL),
	(49,1645570125,'Update complete. Now running version 6.2.5',NULL,NULL,NULL),
	(50,1674257286,'Running database update step: runUpdateFile[ud_6_02_06.php]',NULL,NULL,NULL),
	(51,1674257286,'Running database update step: runUpdateFile[ud_6_02_07.php]',NULL,NULL,NULL),
	(52,1674257286,'Running database update step: runUpdateFile[ud_6_03_00.php]',NULL,NULL,NULL),
	(53,1674257287,'Running database update step: runUpdateFile[ud_6_03_01.php]',NULL,NULL,NULL),
	(54,1674257287,'Running database update step: runUpdateFile[ud_6_03_02.php]',NULL,NULL,NULL),
	(55,1674257287,'Running database update step: runUpdateFile[ud_6_03_03.php]',NULL,NULL,NULL),
	(56,1674257287,'Running database update step: runUpdateFile[ud_6_03_04.php]',NULL,NULL,NULL),
	(57,1674257287,'Running database update step: runUpdateFile[ud_6_03_05.php]',NULL,NULL,NULL),
	(58,1674257288,'Running database update step: runUpdateFile[ud_6_04_00.php]',NULL,NULL,NULL),
	(59,1674257288,'Running database update step: runUpdateFile[ud_6_04_01.php]',NULL,NULL,NULL),
	(60,1674257288,'Running database update step: runUpdateFile[ud_6_04_02.php]',NULL,NULL,NULL),
	(61,1674257288,'Running database update step: runUpdateFile[ud_6_04_03.php]',NULL,NULL,NULL),
	(62,1674257288,'Running database update step: runUpdateFile[ud_6_04_04.php]',NULL,NULL,NULL),
	(63,1674257288,'Update complete. Now running version 6.4.4',NULL,NULL,NULL),
	(64,1674257400,'Running database update step: runUpdateFile[ud_7_00_00_rc_1.php]',NULL,NULL,NULL),
	(65,1674257400,'Smartforge::add_key failed. Table \'exp_dock_prolets\' does not exist.','Smartforge::add_key',202,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/ExpressionEngine/Addons/pro/upd.pro.php'),
	(66,1674257401,'Running database update step: runUpdateFile[ud_7_00_00_rc_2.php]',NULL,NULL,NULL),
	(67,1674257401,'Running database update step: runUpdateFile[ud_7_00_00_rc_3.php]',NULL,NULL,NULL),
	(68,1674257401,'Running database update step: runUpdateFile[ud_7_00_00_rc_4.php]',NULL,NULL,NULL),
	(69,1674257402,'Running database update step: runUpdateFile[ud_7_00_00.php]',NULL,NULL,NULL),
	(70,1674257402,'Running database update step: runUpdateFile[ud_7_00_01.php]',NULL,NULL,NULL),
	(71,1674257402,'Running database update step: runUpdateFile[ud_7_00_02.php]',NULL,NULL,NULL),
	(72,1674257402,'Running database update step: runUpdateFile[ud_7_00_03.php]',NULL,NULL,NULL),
	(73,1674257402,'Running database update step: runUpdateFile[ud_7_01_00.php]',NULL,NULL,NULL),
	(74,1674257402,'Running database update step: runUpdateFile[ud_7_01_01.php]',NULL,NULL,NULL),
	(75,1674257402,'Running database update step: runUpdateFile[ud_7_01_02.php]',NULL,NULL,NULL),
	(76,1674257403,'Running database update step: runUpdateFile[ud_7_01_03.php]',NULL,NULL,NULL),
	(77,1674257403,'Running database update step: runUpdateFile[ud_7_01_04.php]',NULL,NULL,NULL),
	(78,1674257403,'Running database update step: runUpdateFile[ud_7_01_05.php]',NULL,NULL,NULL),
	(79,1674257403,'Running database update step: runUpdateFile[ud_7_01_06.php]',NULL,NULL,NULL),
	(80,1674257403,'Running database update step: runUpdateFile[ud_7_02_00.php]',NULL,NULL,NULL),
	(81,1674257403,'Running database update step: runUpdateFile[ud_7_02_01.php]',NULL,NULL,NULL),
	(82,1674257403,'Running database update step: runUpdateFile[ud_7_02_02.php]',NULL,NULL,NULL),
	(83,1674257403,'Running database update step: runUpdateFile[ud_7_02_03.php]',NULL,NULL,NULL),
	(84,1674257404,'Running database update step: runUpdateFile[ud_7_02_04.php]',NULL,NULL,NULL),
	(85,1674257404,'Running database update step: runUpdateFile[ud_7_02_05.php]',NULL,NULL,NULL),
	(86,1674257404,'Running database update step: runUpdateFile[ud_7_02_06.php]',NULL,NULL,NULL),
	(87,1674257404,'Running database update step: runUpdateFile[ud_7_02_07.php]',NULL,NULL,NULL),
	(88,1674257404,'Update complete. Now running version 7.2.7',NULL,NULL,NULL),
	(89,1674258042,'Running database update step: runUpdateFile[ud_6_02_06.php]',NULL,NULL,NULL),
	(90,1674258042,'Running database update step: runUpdateFile[ud_6_02_07.php]',NULL,NULL,NULL),
	(91,1674258042,'Running database update step: runUpdateFile[ud_6_03_00.php]',NULL,NULL,NULL),
	(92,1674258042,'Running database update step: runUpdateFile[ud_6_03_01.php]',NULL,NULL,NULL),
	(93,1674258042,'Running database update step: runUpdateFile[ud_6_03_02.php]',NULL,NULL,NULL),
	(94,1674258042,'Running database update step: runUpdateFile[ud_6_03_03.php]',NULL,NULL,NULL),
	(95,1674258042,'Running database update step: runUpdateFile[ud_6_03_04.php]',NULL,NULL,NULL),
	(96,1674258043,'Running database update step: runUpdateFile[ud_6_03_05.php]',NULL,NULL,NULL),
	(97,1674258043,'Running database update step: runUpdateFile[ud_6_04_00.php]',NULL,NULL,NULL),
	(98,1674258043,'Could not create key \'enabled\' on table \'exp_extensions\'. Key already exists.','Smartforge::add_key',109,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/installer/updates/ud_6_04_00.php'),
	(99,1674258043,'Running database update step: runUpdateFile[ud_6_04_01.php]',NULL,NULL,NULL),
	(100,1674258043,'Running database update step: runUpdateFile[ud_6_04_02.php]',NULL,NULL,NULL),
	(101,1674258043,'Running database update step: runUpdateFile[ud_6_04_03.php]',NULL,NULL,NULL),
	(102,1674258043,'Running database update step: runUpdateFile[ud_6_04_04.php]',NULL,NULL,NULL),
	(103,1674258044,'Update complete. Now running version 6.4.4',NULL,NULL,NULL),
	(104,1674271926,'Running database update step: runUpdateFile[ud_7_00_00_rc_1.php]',NULL,NULL,NULL),
	(105,1674271926,'Running database update step: runUpdateFile[ud_7_00_00_rc_2.php]',NULL,NULL,NULL),
	(106,1674271927,'Running database update step: runUpdateFile[ud_7_00_00_rc_3.php]',NULL,NULL,NULL),
	(107,1674271927,'Running database update step: runUpdateFile[ud_7_00_00_rc_4.php]',NULL,NULL,NULL),
	(108,1674271927,'Running database update step: runUpdateFile[ud_7_00_00.php]',NULL,NULL,NULL),
	(109,1674271927,'Running database update step: runUpdateFile[ud_7_00_01.php]',NULL,NULL,NULL),
	(110,1674271927,'Running database update step: runUpdateFile[ud_7_00_02.php]',NULL,NULL,NULL),
	(111,1674271927,'Running database update step: runUpdateFile[ud_7_00_03.php]',NULL,NULL,NULL),
	(112,1674271927,'Running database update step: runUpdateFile[ud_7_01_00.php]',NULL,NULL,NULL),
	(113,1674271927,'Running database update step: runUpdateFile[ud_7_01_01.php]',NULL,NULL,NULL),
	(114,1674271928,'Running database update step: runUpdateFile[ud_7_01_02.php]',NULL,NULL,NULL),
	(115,1674271928,'Running database update step: runUpdateFile[ud_7_01_03.php]',NULL,NULL,NULL),
	(116,1674271928,'Running database update step: runUpdateFile[ud_7_01_04.php]',NULL,NULL,NULL),
	(117,1674271928,'Running database update step: runUpdateFile[ud_7_01_05.php]',NULL,NULL,NULL),
	(118,1674271928,'Running database update step: runUpdateFile[ud_7_01_06.php]',NULL,NULL,NULL),
	(119,1674271928,'Running database update step: runUpdateFile[ud_7_02_00.php]',NULL,NULL,NULL),
	(120,1674271928,'Running database update step: runUpdateFile[ud_7_02_01.php]',NULL,NULL,NULL),
	(121,1674271928,'Running database update step: runUpdateFile[ud_7_02_02.php]',NULL,NULL,NULL),
	(122,1674271928,'Running database update step: runUpdateFile[ud_7_02_03.php]',NULL,NULL,NULL),
	(123,1674271928,'Running database update step: runUpdateFile[ud_7_02_04.php]',NULL,NULL,NULL),
	(124,1674271929,'Running database update step: runUpdateFile[ud_7_02_05.php]',NULL,NULL,NULL),
	(125,1674271929,'Running database update step: runUpdateFile[ud_7_02_06.php]',NULL,NULL,NULL),
	(126,1674271929,'Running database update step: runUpdateFile[ud_7_02_07.php]',NULL,NULL,NULL),
	(127,1674271929,'Update complete. Now running version 7.2.7',NULL,NULL,NULL),
	(128,1674273063,'Running database update step: runUpdateFile[ud_6_02_06.php]',NULL,NULL,NULL),
	(129,1674273063,'Running database update step: runUpdateFile[ud_6_02_07.php]',NULL,NULL,NULL),
	(130,1674273064,'Running database update step: runUpdateFile[ud_6_03_00.php]',NULL,NULL,NULL),
	(131,1674273064,'Running database update step: runUpdateFile[ud_6_03_01.php]',NULL,NULL,NULL),
	(132,1674273064,'Running database update step: runUpdateFile[ud_6_03_02.php]',NULL,NULL,NULL),
	(133,1674273064,'Running database update step: runUpdateFile[ud_6_03_03.php]',NULL,NULL,NULL),
	(134,1674273064,'Running database update step: runUpdateFile[ud_6_03_04.php]',NULL,NULL,NULL),
	(135,1674273064,'Running database update step: runUpdateFile[ud_6_03_05.php]',NULL,NULL,NULL),
	(136,1674273064,'Running database update step: runUpdateFile[ud_6_04_00.php]',NULL,NULL,NULL),
	(137,1674273064,'Could not create key \'enabled\' on table \'exp_extensions\'. Key already exists.','Smartforge::add_key',109,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/installer/updates/ud_6_04_00.php'),
	(138,1674273065,'Running database update step: runUpdateFile[ud_6_04_01.php]',NULL,NULL,NULL),
	(139,1674273065,'Running database update step: runUpdateFile[ud_6_04_02.php]',NULL,NULL,NULL),
	(140,1674273065,'Running database update step: runUpdateFile[ud_6_04_03.php]',NULL,NULL,NULL),
	(141,1674273065,'Running database update step: runUpdateFile[ud_6_04_04.php]',NULL,NULL,NULL),
	(142,1674273065,'Update complete. Now running version 6.4.4',NULL,NULL,NULL),
	(143,1674273097,'Running database update step: runUpdateFile[ud_7_00_00_rc_1.php]',NULL,NULL,NULL),
	(144,1674273097,'Running database update step: runUpdateFile[ud_7_00_00_rc_2.php]',NULL,NULL,NULL),
	(145,1674273097,'Running database update step: runUpdateFile[ud_7_00_00_rc_3.php]',NULL,NULL,NULL),
	(146,1674273097,'Running database update step: runUpdateFile[ud_7_00_00_rc_4.php]',NULL,NULL,NULL),
	(147,1674273097,'Running database update step: runUpdateFile[ud_7_00_00.php]',NULL,NULL,NULL),
	(148,1674273098,'Running database update step: runUpdateFile[ud_7_00_01.php]',NULL,NULL,NULL),
	(149,1674273098,'Running database update step: runUpdateFile[ud_7_00_02.php]',NULL,NULL,NULL),
	(150,1674273098,'Running database update step: runUpdateFile[ud_7_00_03.php]',NULL,NULL,NULL),
	(151,1674273098,'Running database update step: runUpdateFile[ud_7_01_00.php]',NULL,NULL,NULL),
	(152,1674273098,'Running database update step: runUpdateFile[ud_7_01_01.php]',NULL,NULL,NULL),
	(153,1674273098,'Running database update step: runUpdateFile[ud_7_01_02.php]',NULL,NULL,NULL),
	(154,1674273098,'Running database update step: runUpdateFile[ud_7_01_03.php]',NULL,NULL,NULL),
	(155,1674273099,'Running database update step: runUpdateFile[ud_7_01_04.php]',NULL,NULL,NULL),
	(156,1674273099,'Running database update step: runUpdateFile[ud_7_01_05.php]',NULL,NULL,NULL),
	(157,1674273099,'Running database update step: runUpdateFile[ud_7_01_06.php]',NULL,NULL,NULL),
	(158,1674273099,'Running database update step: runUpdateFile[ud_7_02_00.php]',NULL,NULL,NULL),
	(159,1674273099,'Running database update step: runUpdateFile[ud_7_02_01.php]',NULL,NULL,NULL),
	(160,1674273099,'Running database update step: runUpdateFile[ud_7_02_02.php]',NULL,NULL,NULL),
	(161,1674273099,'Running database update step: runUpdateFile[ud_7_02_03.php]',NULL,NULL,NULL),
	(162,1674273100,'Running database update step: runUpdateFile[ud_7_02_04.php]',NULL,NULL,NULL),
	(163,1674273100,'Running database update step: runUpdateFile[ud_7_02_05.php]',NULL,NULL,NULL),
	(164,1674273100,'Running database update step: runUpdateFile[ud_7_02_06.php]',NULL,NULL,NULL),
	(165,1674273100,'Running database update step: runUpdateFile[ud_7_02_07.php]',NULL,NULL,NULL),
	(166,1674273100,'Update complete. Now running version 7.2.7',NULL,NULL,NULL),
	(167,1677557048,'Running database update step: runUpdateFile[ud_7_02_08.php]',NULL,NULL,NULL),
	(168,1677557049,'Running database update step: runUpdateFile[ud_7_02_09.php]',NULL,NULL,NULL),
	(169,1677557049,'Running database update step: runUpdateFile[ud_7_02_10.php]',NULL,NULL,NULL),
	(170,1677557049,'Update complete. Now running version 7.2.10',NULL,NULL,NULL),
	(171,1698245243,'Running database update step: runUpdateFile[ud_7_02_11.php]',NULL,NULL,NULL),
	(172,1698245243,'Running database update step: runUpdateFile[ud_7_02_12.php]',NULL,NULL,NULL),
	(173,1698245243,'Running database update step: runUpdateFile[ud_7_02_13.php]',NULL,NULL,NULL),
	(174,1698245243,'Running database update step: runUpdateFile[ud_7_02_14.php]',NULL,NULL,NULL),
	(175,1698245243,'Running database update step: runUpdateFile[ud_7_02_15.php]',NULL,NULL,NULL),
	(176,1698245243,'Running database update step: runUpdateFile[ud_7_02_16.php]',NULL,NULL,NULL),
	(177,1698245244,'Running database update step: runUpdateFile[ud_7_02_17.php]',NULL,NULL,NULL),
	(178,1698245244,'Running database update step: runUpdateFile[ud_7_03_00.php]',NULL,NULL,NULL),
	(179,1698245244,'Running database update step: runUpdateFile[ud_7_03_01.php]',NULL,NULL,NULL),
	(180,1698245244,'Running database update step: runUpdateFile[ud_7_03_02.php]',NULL,NULL,NULL),
	(181,1698245245,'Running database update step: runUpdateFile[ud_7_03_03.php]',NULL,NULL,NULL),
	(182,1698245245,'Running database update step: runUpdateFile[ud_7_03_04.php]',NULL,NULL,NULL),
	(183,1698245245,'Running database update step: runUpdateFile[ud_7_03_05.php]',NULL,NULL,NULL),
	(184,1698245245,'Running database update step: runUpdateFile[ud_7_03_06.php]',NULL,NULL,NULL),
	(185,1698245245,'Running database update step: runUpdateFile[ud_7_03_07.php]',NULL,NULL,NULL),
	(186,1698245246,'Running database update step: runUpdateFile[ud_7_03_08.php]',NULL,NULL,NULL),
	(187,1698245246,'Running database update step: runUpdateFile[ud_7_03_09.php]',NULL,NULL,NULL),
	(188,1698245246,'Running database update step: runUpdateFile[ud_7_03_10.php]',NULL,NULL,NULL),
	(189,1698245246,'Running database update step: runUpdateFile[ud_7_03_11.php]',NULL,NULL,NULL),
	(190,1698245246,'Running database update step: runUpdateFile[ud_7_03_12.php]',NULL,NULL,NULL),
	(191,1698245246,'Running database update step: runUpdateFile[ud_7_03_13.php]',NULL,NULL,NULL),
	(192,1698245247,'Running database update step: runUpdateFile[ud_7_03_14.php]',NULL,NULL,NULL),
	(193,1698245247,'Update complete. Now running version 7.3.14',NULL,NULL,NULL),
	(194,1754065580,'Running database update step: runUpdateFile[ud_7_03_15.php]',NULL,NULL,NULL),
	(195,1754065580,'Running database update step: runUpdateFile[ud_7_04_00.php]',NULL,NULL,NULL),
	(196,1754065581,'Running database update step: runUpdateFile[ud_7_04_01.php]',NULL,NULL,NULL),
	(197,1754065581,'Running database update step: runUpdateFile[ud_7_04_02.php]',NULL,NULL,NULL),
	(198,1754065581,'Running database update step: runUpdateFile[ud_7_04_03.php]',NULL,NULL,NULL),
	(199,1754065581,'Running database update step: runUpdateFile[ud_7_04_04.php]',NULL,NULL,NULL),
	(200,1754065582,'Running database update step: runUpdateFile[ud_7_04_05.php]',NULL,NULL,NULL),
	(201,1754065582,'Running database update step: runUpdateFile[ud_7_04_06.php]',NULL,NULL,NULL),
	(202,1754065582,'Running database update step: runUpdateFile[ud_7_04_07.php]',NULL,NULL,NULL),
	(203,1754065582,'Running database update step: runUpdateFile[ud_7_04_08.php]',NULL,NULL,NULL),
	(204,1754065582,'Running database update step: runUpdateFile[ud_7_04_09.php]',NULL,NULL,NULL),
	(205,1754065582,'Running database update step: runUpdateFile[ud_7_04_10.php]',NULL,NULL,NULL),
	(206,1754065583,'Running database update step: runUpdateFile[ud_7_04_11.php]',NULL,NULL,NULL),
	(207,1754065583,'Running database update step: runUpdateFile[ud_7_05_00.php]',NULL,NULL,NULL),
	(208,1754065585,'Running database update step: runUpdateFile[ud_7_05_01.php]',NULL,NULL,NULL),
	(209,1754065585,'Running database update step: runUpdateFile[ud_7_05_02.php]',NULL,NULL,NULL),
	(210,1754065585,'Running database update step: runUpdateFile[ud_7_05_03.php]',NULL,NULL,NULL),
	(211,1754065585,'Running database update step: runUpdateFile[ud_7_05_04.php]',NULL,NULL,NULL),
	(212,1754065586,'Running database update step: runUpdateFile[ud_7_05_05.php]',NULL,NULL,NULL),
	(213,1754065586,'Running database update step: runUpdateFile[ud_7_05_06.php]',NULL,NULL,NULL),
	(214,1754065586,'Running database update step: runUpdateFile[ud_7_05_07.php]',NULL,NULL,NULL),
	(215,1754065586,'Running database update step: runUpdateFile[ud_7_05_08.php]',NULL,NULL,NULL),
	(216,1754065586,'Running database update step: runUpdateFile[ud_7_05_09.php]',NULL,NULL,NULL),
	(217,1754065586,'Running database update step: runUpdateFile[ud_7_05_10.php]',NULL,NULL,NULL),
	(218,1754065587,'Running database update step: runUpdateFile[ud_7_05_11.php]',NULL,NULL,NULL),
	(219,1754065587,'Could not drop key \'condition_set_id\' from table \'exp_field_condition_sets_channel_fields\'. Key does not exist.','Smartforge::drop_key',58,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/installer/updates/ud_7_05_11.php'),
	(220,1754065587,'Could not drop key \'field_id\' from table \'exp_field_condition_sets_channel_fields\'. Key does not exist.','Smartforge::drop_key',59,'/Users/SDemanett/Sites/localhost/expressionengine-skeleton/system/ee/installer/updates/ud_7_05_11.php'),
	(221,1754065587,'Running database update step: runUpdateFile[ud_7_05_12.php]',NULL,NULL,NULL),
	(222,1754065587,'Running database update step: runUpdateFile[ud_7_05_13.php]',NULL,NULL,NULL),
	(223,1754065587,'Update complete. Now running version 7.5.13',NULL,NULL,NULL);

/*!40000 ALTER TABLE `exp_update_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_update_notices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_update_notices`;

CREATE TABLE `exp_update_notices` (
  `notice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_header` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `adapter_settings` text COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `allow_subfolders` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `subfolders_on_top` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `adapter`, `adapter_settings`, `server_path`, `url`, `allowed_types`, `allow_subfolders`, `subfolders_on_top`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`)
VALUES
	(1,1,'Avatars','local',NULL,'{base_path}images/avatars/','{base_url}images/avatars/','img','n','y','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(3,1,'Member Photos','local',NULL,'/','{base_url}images/member_photos/','img','n','y','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(4,1,'Signature Attachments','local',NULL,'{base_path}images/signature_attachments/','{base_url}images/signature_attachments/','img','n','y','list','30','80','480',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(5,1,'PM Attachments','local',NULL,'{base_path}images/pm_attachments/','{base_url}images/pm_attachments/','img','n','y','list','250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_upload_prefs_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs_category_groups`;

CREATE TABLE `exp_upload_prefs_category_groups` (
  `upload_location_id` int(4) unsigned NOT NULL,
  `group_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`upload_location_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_upload_prefs_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs_roles`;

CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `upload_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_wygwam_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_wygwam_configs`;

CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;

INSERT INTO `exp_wygwam_configs` (`config_id`, `config_name`, `settings`)
VALUES
	(1,'Basic','YTo3OntzOjc6InRvb2xiYXIiO2E6ODp7aTowO3M6NDoiQm9sZCI7aToxO3M6NjoiSXRhbGljIjtpOjI7czo5OiJVbmRlcmxpbmUiO2k6MztzOjEyOiJOdW1iZXJlZExpc3QiO2k6NDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NTtzOjQ6IkxpbmsiO2k6NjtzOjY6IlVubGluayI7aTo3O3M6NjoiQW5jaG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czo5OiJwYXJzZV9jc3MiO2I6MDtzOjEzOiJyZXN0cmljdF9odG1sIjtzOjE6InkiO3M6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),
	(2,'Full','YTo3OntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6MzoiQ3V0IjtpOjI7czo0OiJDb3B5IjtpOjM7czo1OiJQYXN0ZSI7aTo0O3M6OToiUGFzdGVUZXh0IjtpOjU7czoxMzoiUGFzdGVGcm9tV29yZCI7aTo2O3M6NDoiVW5kbyI7aTo3O3M6NDoiUmVkbyI7aTo4O3M6NToiU2NheXQiO2k6OTtzOjQ6IkJvbGQiO2k6MTA7czo2OiJJdGFsaWMiO2k6MTE7czo2OiJTdHJpa2UiO2k6MTI7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjEzO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxNDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTU7czo3OiJPdXRkZW50IjtpOjE2O3M6NjoiSW5kZW50IjtpOjE3O3M6MTA6IkJsb2NrcXVvdGUiO2k6MTg7czo0OiJMaW5rIjtpOjE5O3M6NjoiVW5saW5rIjtpOjIwO3M6NjoiQW5jaG9yIjtpOjIxO3M6NToiSW1hZ2UiO2k6MjI7czo1OiJUYWJsZSI7aToyMztzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyNDtzOjExOiJTcGVjaWFsQ2hhciI7aToyNTtzOjg6IlJlYWRNb3JlIjtpOjI2O3M6NjoiU3R5bGVzIjtpOjI3O3M6NjoiRm9ybWF0IjtpOjI4O3M6ODoiTWF4aW1pemUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjk6InBhcnNlX2NzcyI7YjowO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7czoxMDoidXBsb2FkX2RpciI7czowOiIiO30=');

/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
