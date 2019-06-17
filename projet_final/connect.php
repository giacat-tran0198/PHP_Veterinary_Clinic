<?php

$vHost = 'tuxa.sme.utc';
$vPort = '5432';
$vData = 'dbbdd0p083';
$vUser = 'bdd0p083';
$vPass = '0sjwzCOZ';



$vConn = new PDO("pgsql:host=$vHost;port=$vPort;dbname=$vData", $vUser, $vPass);
if (!$vConn) {
    die("Connection failed: " . pg_last_error());
}
?>
