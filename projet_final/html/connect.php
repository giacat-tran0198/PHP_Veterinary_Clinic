<?php
$vHost = 'tuxa.sme.utc';
$vPort = '5432';
$vData = 'dbbdd0p021';
$vUser = 'bdd0p021';
$vPass = '0iXDOuzF';

$vConn = new PDO("pgsql:host=$vHost;port=$vPort;dbname=$vData", $vUser, $vPass);
if (!$vConn) {
    die("Connection failed: " . pg_last_error());
}
?>
