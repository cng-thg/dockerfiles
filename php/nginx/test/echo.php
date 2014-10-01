
<?php
// Mostra o nome de quem é o dono do processo php/httpd 
// (em um sistema com o executável "whoami" no path)
define('DB_HOST', exec("/usr/bin/serf members -tag role=mysql | awk {'print $2'} | cut -d':' -f1"));
echo DB_HOST;
?>

