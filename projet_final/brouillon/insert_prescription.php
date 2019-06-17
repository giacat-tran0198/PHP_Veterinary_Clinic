<?php 

/** Connexion **/
require('connect.php');

/** Préparation et exécution de la requête **/

$medicaments = $_POST['medicament'];
$quantites = $_POST['quantite'];
$traitement = addslashes($_POST['traitement']);


foreach($medicaments as $index => $medicament){
    $vSql ="INSERT INTO Clinique.Prescription(medicament,traitement,quantite) VALUES('{$medicament}',$traitement,$quantites[$index])";
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    if ($vSt) {
            echo '<br> Nouveau inséré';
    }else {
        echo '<br> Erreur lors de l\'insertion';
    }
}
echo '<br> <button onclick="history.go(-1)">Retour</button>';

?>