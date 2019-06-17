<html>
<head>
  <title>Requêtes statistiques</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>

  <body>
    <h1>Poids et taille moyens de l'espèce</h1>
    <table border="1">
      <tr><th>Espèce</th><th>Taille moyenne</th><th>Poids moyen</th></tr>
    <?php
      require('connect.php');


      $nom = $_POST['espece'];
      $vSql ="SELECT A.espece, AVG(A.taille) AS taille_moyenne, AVG(A.poids) AS poids_moyen
      FROM Clinique.Animal A LEFT JOIN Clinique.Traitement T ON A.id = T.animal
      WHERE T.animal IS NOT NULL
      AND A.espece='$nom'
      GROUP BY A.espece;";

      $vSt = $vConn->prepare($vSql);
      $vSt->execute();

      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo "<td>$vResult[espece]</td>";
        echo "<td>$vResult[taille_moyenne]</td>";
        echo "<td>$vResult[poids_moyen]</td>";
        echo '</tr>';
      }

      ?>
    </table>

  </body>
  </html>
