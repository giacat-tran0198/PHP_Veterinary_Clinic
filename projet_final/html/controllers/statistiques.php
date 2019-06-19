<?php

require_once("../models/statistiques.php");

$data['getCustomers'] = getCustomers();
$data['getPetsByCustomerId'] = null;
$data['getPetsBetweenAge']= null;
$data['getPetsByspecie']= getPetsByspecie();


if(isset($_POST["customerId"])) {
  $customerId = intval($_POST["customerId"]);
  $data['getPetsByCustomerId'] = getPetsByCustomerId($customerId);
}

if(isset($_POST["ageMin"]) && isset($_POST["ageMax"])) {
  $minAge = intval($_POST["ageMin"]);
  $maxAge = intval($_POST["ageMax"]);

  $data['getPetsBetweenAge'] = getPetsBetweenAge($minAge, $maxAge);
}




require_once("../views/statistiques.php");
