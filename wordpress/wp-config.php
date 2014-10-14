<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress');

/** MySQL hostname */
define('DB_HOST', exec("/usr/bin/serf members -tag role=mysql | awk {'print $2'} | cut -d':' -f1"));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ';QhUPoD[xTtBcE+[u031/d3m#+Oa?q|8WQB9+[B+l1{}sxCi+{.c0:3fgqdbqhh4');
define('SECURE_AUTH_KEY',  '3hQ^9&-fW++CIV|+tK.^Ptx&(rd[wu%%(G[Oi]=.zKW#&;)Vr@UW*hReXZ?.URz:');
define('LOGGED_IN_KEY',    '{{C NVGrH=IH OT|I?5~x(Uw|dzl,fVOek,&9EkDy@|](}I|sro%A.1TD;!]69m_');
define('NONCE_KEY',        'q!>NRlCFq1!hjlI1$Nd;f^z.v$%{@z6oumnG-*bSv (%_5Dy6ae,I>]CQyW4@H67');
define('AUTH_SALT',        'HT2|||E`-|4q|f<tE>zmC:lCX!bA|_z}5m?R(U6ITn$19NHi<:=*>ep&JV$A=hhX');
define('SECURE_AUTH_SALT', '+j<Bc?[_O$TcV>dG~*!oGF;2fUJT++T-?g@^TAGSp+GAB6cF*6O=Y9,4uDR#*}y|');
define('LOGGED_IN_SALT',   's+-ZE~q]Sb#Wa`Gt@bjmHE4&?{o^saD/G@4o+BmI(;lug*??4gAIL}3rr|Q+*aPK');
define('NONCE_SALT',       ']rvx-7w/zeJP5x!CVEf{3zC-Po<bqwWW|O;x6xS`ah!KKZvme/]+JBIQ]Q<Ig3CI');


/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
