<!-- Accents -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<?php

/** Connexion **/
require('connect.php');

/** Periode de temps par defaut **/
date_default_timezone_set("Europe/Berlin");

/** Préparation et exécution de la requête **/
$nom = addslashes($_POST['nom']);
$prenom = addslashes($_POST['prenom']);
$dateNaissance = date('Y-m-d', strtotime(addslashes($_POST['dateNaissance'])));
$adresse = addslashes($_POST['adresse']);
$numero = addslashes($_POST['numero']);


$vSql ="INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('{$nom}','{$prenom}','{$dateNaissance}','{$adresse}','{$numero}')";
//echo $vSql;
$vSt = $vConn->prepare($vSql);
$vSt->execute();
if (!$vSt) {
    echo '<br>Un nouveau client a été inseré';
    //echo $vSt ;
  }
  else {
    echo '<br>Erreur lors de l\'insertion une contrainte n\' pas été respecté !<br>';
    print_r($vConn->errorInfo()[2]);
  }
echo '<br> <button onclick="history.go(-1)">Retour</button>';

//$vConn->closeCursor();
?>
