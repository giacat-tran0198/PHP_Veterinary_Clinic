<?php 

/** Connexion **/
include('connect.php');

/** Préparation et exécution de la requête **/

$nomMolecule = addslashes($_POST['nomMolecule']);
$description = addslashes($_POST['description']);
$espece = addslashes($_POST['espece']);


$vSql1 ="INSERT INTO Clinique.Medicament(nomMolecule,description) VALUES('{$nomMolecule}','{$description}')";
$vSql2 ="INSERT INTO Clinique.AutorisationMedicament(medicament,espece) VALUES('{$nomMolecule}','{$espece}')";

$vSt1 = $vConn->prepare($vSql1);
$vSt1->execute();
$vSt2 = $vConn->prepare($vSql2);
$vSt2->execute();

if ($vSt1 && $vSt2) {
    echo '<br> Nouveau inséré';
  }
  else {
    echo '<br> Erreur lors de l\'insertion';
  }
echo '<br> <button onclick="history.go(-1)">Retour</button>';

?>