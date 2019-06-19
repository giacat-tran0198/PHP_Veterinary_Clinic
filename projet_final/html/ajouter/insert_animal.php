<!-- Accents -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<?php
/** Connexion **/
require('connect.php');

/** Periode de temps par defaut **/
date_default_timezone_set("Europe/Berlin");

/** Préparation et exécution de la requête **/
$nom = addslashes($_POST['nom']);
$proprietaire = addslashes($_POST['proprietaire']);
$dateNaissance = date('Y-m-d', strtotime(addslashes($_POST['dateNaissance'])));
$poids = addslashes($_POST['poids']);
$taille = addslashes($_POST['taille']);
$espece = addslashes($_POST['espece']);
//echo $espece;

$vSql ="INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES('{$nom}','{$proprietaire}','{$poids}','{$taille}','{$dateNaissance}','{$espece}')";
//echo $vSql;
$vSt = $vConn->prepare($vSql);
$vSt->execute();
if (!strlen($vConn->errorInfo()[2])) {
    echo '<br>Un nouvel animal a été inseré <br>';
  }
  else {
    echo '<br>Erreur lors de l\'insertion une contrainte n\' a pas été respectée !<br>';
    print_r($vConn->errorInfo()[2]);
  }
echo '<br> <button onclick="history.go(-1)">Retour</button>';
?>
