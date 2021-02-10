<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'blog' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'blog' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'pass' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '1)#7}.dq@+^N/.B:T_w,,=qu,gXODda./5;3 fJ_>fUp {8zylUl/Pmz7|/p{77|');
define('SECURE_AUTH_KEY',  'j.NJHO5CbP`[r;I(nT`-#y-3X2j*/S8ky>&npi!6aWKH|xs&:)2mlw[`2>xmm(!/');
define('LOGGED_IN_KEY',    '.`2%GQ:YyIz/G@/*SvT91bhNi6=|Cw(!AeJarZ>t.XOKV{CCH5w8<F(;0hEsFEwT');
define('NONCE_KEY',        '(i5NmuA18|T,zqMnED5b&YVn6wc[-=Pwp?|AoeN]%}x,[e<-QW+OC#/Z$^PZ]yFl');
define('AUTH_SALT',        '[ @iZ~E]D|=8;DDU]Rm&]OzXTn!DaO`=6),g6~n^.ju~w2Aa#Vde?F#BhAnpFBoF');
define('SECURE_AUTH_SALT', ',I~=P-DU&(7b=*_CU.xlZ>cUeSMQ8~Zhg@d$0`^m>c)F5F)8,/q^$rkQ8=bdYLkO');
define('LOGGED_IN_SALT',   '9~mW5*w]}*Zr0Wc`!;$-qE8>|k?k_4OiFU3Af~@?xCHB>LM;K=^**|Zh6_=2cp+b');
define('NONCE_SALT',       'F5.%iq(6gaLYY%<QiG$FNL`%g|rupBVY{e,WG,wPqlhOTiPWZex7J-y71L I[_[.');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortement recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
