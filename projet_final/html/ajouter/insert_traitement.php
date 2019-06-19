<!DOCTYPE html>
<!-- Accents -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Inscription</title>
    </head>
    <body>
        <?php

        /** Connexion **/
        require('connect.php');

        /** Periode de temps par defaut **/
        date_default_timezone_set("Europe/Berlin");

        /** Préparation et exécution de la requête **/
        $veterinaire = addslashes($_POST['veterinaire']);
        $animal = addslashes($_POST['animal']);
        $debut = date('Y-m-d', strtotime(addslashes($_POST['debut'])));
        $duree = addslashes($_POST['duree']);
        $vSql ="INSERT INTO Clinique.Traitement(debut,animal,duree,veterinaire)  VALUES('{$debut}','{$animal}','{$duree}','{$veterinaire}')";

        $vSt = $vConn->prepare($vSql);
        $vSt->execute();
        if (!strlen($vConn->errorInfo()[2])) {
            echo '<br>Un nouveau traitement a été inseré <br>';
            session_start() ;
            $_SESSION['animal'] = $animal ;
            $_SESSION['duree'] = $duree ;
            $_SESSION['veterinaire'] = $veterinaire ;
            $_SESSION['debut'] = $debut ;
            header("Location: inscription_prescription.php");
          }
          else {
            echo '<br>Erreur lors de l\'insertion une contrainte n\' a pas été respectée !<br>';
            print_r($vConn->errorInfo()[2]);
          }
        echo '<br> <button onclick="history.go(-1)">Retour</button>';

        ?>
    </body>
</html>
