<?php
$ip = getHostByName(php_uname('n')); 
echo $ip;
?>

<?php 
 
$ip_server = $_SERVER['SERVER_ADDR']; 
  
echo "Server IP Address is: $ip_server"; 
  
?>
