<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['is_system_on'] = 'y';
$config['multiple_sites_enabled'] = 'n';
$config['show_ee_news'] = 'n';
// ExpressionEngine Config Items
// Find more configs and overrides at
// https://docs.expressionengine.com/latest/general/system-configuration-overrides.html

$config['app_version'] = '5.4.0';
$config['encryption_key'] = 'fc7b3759f69cfb958abcfa0d11a297c4c9716e3e';
$config['session_crypt_key'] = '02fc051991c05f50967ea4be77d9426e9a718588';
$config['database'] = array(
	'expressionengine' => array(
		'hostname' => 'localhost',
		'database' => 'ee-skeleton',
		'username' => 'ee-skeleton',
		'password' => 'ee-skeleton',
		'dbprefix' => 'exp_',
		'char_set' => 'utf8mb4',
		'dbcollat' => 'utf8mb4_unicode_ci',
		'port'     => ''
	),
);
$config['share_analytics'] = 'y';

// EOF