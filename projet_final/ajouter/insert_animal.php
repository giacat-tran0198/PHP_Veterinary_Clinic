<?php 

/** Connexion **/
require('connect.php');

/** Préparation et exécution de la requête **/

$nom = addslashes($_POST['nom']);
$proprietaire = addslashes($_POST['proprietaire']);
$dateNaissance = date('Y-m-d', strtotime(addslashes($_POST['dateNaissance'])));
$poids = addslashes($_POST['poids']);
$taille = addslashes($_POST['taille']);
$espece = addslashes($_POST['espece']);
echo $espece;


$vSql ="INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES('{$nom}','{$proprietaire}','{$poids}','{$taille}','{$dateNaissance}','{$espece}')";
echo $vSql;
$vSt = $vConn->prepare($vSql);
$vSt->execute();
if ($vSt) {
    echo '<br> Nouveau inséré';
  }
  else {
    echo '<br> Erreur lors de l\'insertion';
  }
echo '<br> <button onclick="history.go(-1)">Retour</button>';

?>