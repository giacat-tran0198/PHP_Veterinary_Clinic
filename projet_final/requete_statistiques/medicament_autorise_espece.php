<html>
<head>
  <title>Requêtes statistiques</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>

  <body>
    <h1>Médicaments autorisés</h1>
    <table border="1">
      <tr><th>Nom de la molécule</th></tr>
    <?php
      require('connect.php');


      $nom = $_POST['espece'];
      $vSql ="SELECT medicament, espece
      FROM Clinique.AutorisationMedicament A
      WHERE A.espece='$nom';";

      $vSt = $vConn->prepare($vSql);
      $vSt->execute();

      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo "<td>$vResult[medicament]</td>";
        echo '</tr>';
      }

      ?>
    </table>

  </body>
  </html>
