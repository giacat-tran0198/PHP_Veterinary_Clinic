<!-- Accents -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<?php

/** Connexion **/
require('connect.php');

/** Periode de temps par defaut **/
date_default_timezone_set("Europe/Berlin");

/** Préparation et exécution de la requête **/

$medicaments = $_POST['medicament'];
$quantites = $_POST['quantite'];
$traitement = addslashes($_POST['traitement']);


foreach($medicaments as $index => $medicament){
    $vSql ="INSERT INTO Clinique.Prescription(medicament,traitement,quantite) VALUES('{$medicament}',$traitement,$quantites[$index])";
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    if (!strlen($vConn->errorInfo()[2])) {
        echo '<br>Une nouvelle prescription a été inserée <br>';
      }
      else {
        echo '<br>Erreur lors de l\'insertion une contrainte n\' pas été respecté !<br>';
        print_r($vConn->errorInfo()[2]);
      }
}
echo '<br> <button onclick="history.go(-1)">Retour</button>';

?>
