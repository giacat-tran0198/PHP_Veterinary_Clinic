<?php 

/** Connexion **/
require('connect.php');

/** Préparation et exécution de la requête **/

$nom = addslashes($_POST['nom']);
$prenom = addslashes($_POST['prenom']);
$dateNaissance = date('Y-m-d', strtotime(addslashes($_POST['dateNaissance'])));
$adresse = addslashes($_POST['adresse']);
$numero = addslashes($_POST['numero']);
$specialite = addslashes($_POST['specialite']);


$vSql ="INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('{$nom}','{$prenom}','{$dateNaissance}','{$adresse}','{$numero}','{$specialite}')";
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