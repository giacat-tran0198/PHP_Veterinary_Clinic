<?php 

/** Connexion **/
include('connect.php');

/** Préparation et exécution de la requête **/

$nom = addslashes($_POST['nom']);
$prenom = addslashes($_POST['prenom']);
$dateNaissance = date('Y-m-d', strtotime(addslashes($_POST['dateNaissance'])));
$adresse = addslashes($_POST['adresse']);
$numero = addslashes($_POST['numero']);


$vSql ="INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('{$nom}','{$prenom}','{$dateNaissance}','{$adresse}','{$numero}')";
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