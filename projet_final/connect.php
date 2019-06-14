<?php
$vHost = 'localhost';
$vPort = '5432';
$vData = 'postgres';
$vUser = 'postgres';
$vPass = '123';
$vConn = new PDO("pgsql:host=$vHost;port=$vPort;dbname=$vData", $vUser, $vPass);
if (!$vConn) {

    die("Connection failed: " . pg_last_error());

}
?>