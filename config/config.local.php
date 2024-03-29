<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Local config overrides & db credentials
 *
 * Our database credentials and any environment-specific overrides
 * This file should be specific to each developer and not tracked in Git
 *
 * @package    Focus Lab Master Config
 * @version    2.2.0
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 */

$env_config['database'] = array (
	'expressionengine' => array (
		'hostname' => 'localhost',
		'database' => 'ee-skeleton',
		'username' => 'ee-skeleton',
		'password' => 'ee-skeleton',
		'dbdriver' => 'mysqli',
		'dbprefix' => 'exp_',
		'char_set' => 'utf8mb4',
		'dbcollat' => 'utf8mb4_unicode_ci',
		'port'     => '',
		'pconnect' => FALSE
	),
);


// Local testing email address
$env_config['webmaster_email'] = '';


/* End of file config.local.php */
/* Location: ./config/config.local.php */
