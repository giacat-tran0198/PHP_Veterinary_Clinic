<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Inscription</title>
    </head>
    <body>
      <h1>L'inscription Prescription</h1>
              <form action="insert_prescription.php" method="POST">
                  <?php
                      require('connect.php');
                      session_start() ;
                      $animal = $_SESSION['animal'];
                      $duree = $_SESSION['duree'] ;
                      $veterinaire =   $_SESSION['veterinaire'] ;
                      $debut = $_SESSION['debut'] ;
                      $vSql ="SELECT e.medicament FROM Clinique.AutorisationMedicament e, Clinique.Animal a WHERE a.id =$animal and a.espece = e.espece ";
                      $vSt = $vConn->prepare($vSql);
                      $vSt->execute();
                      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
                          if (isset($vResult)){
                              echo "<input type='checkbox' name='medicament[]'  value=$vResult[medicament]>";
                              echo "$vResult[medicament] quantite: <input type='number' name='quantite[]'>";
                              echo "<br>";
                          }
                      }
                      $vSql ="SELECT id FROM Clinique.Traitement WHERE debut='{$debut}' and animal=$animal and duree = $duree and veterinaire = $veterinaire ORDER BY id desc LIMIT 1";
                      $vSt = $vConn->prepare($vSql);
                      $vSt->execute();
                      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
                          echo "<input type='hidden' name= 'traitement' value = '$vResult[id]'>";
                      }
                  ?>
                  <input type="submit" value="submit">
                  <input type="reset" value="réinitialiser">
                  <button onclick="history.go(-1)">Retour</button>
              </form>
    </body>
</html>
