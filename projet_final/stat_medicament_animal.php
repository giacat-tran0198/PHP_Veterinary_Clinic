<html>
<head>
  <title>Requêtes statistiques</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>

  <body>
    <h1>Médicaments prescrits à cet animal</h1>
    <table border="1">
      <tr><th>Médicament prescrit</th><th>Quantité prescrite</th></tr>
    <?php
      require('connect.php');


      $nom = $_POST['animal'];
      $vSql ="SELECT M.nomMolecule AS medicament_prescrit, SUM(P.quantite) AS quantite_prescrite
      FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T
      ON P.traitement = T.id , Clinique.Medicament M, Clinique.Animal A
      WHERE P.medicament = M.nomMolecule
      AND T.animal = A.id
      AND A.nom = '$nom'
      GROUP BY M.nomMolecule;";

      $vSt = $vConn->prepare($vSql);
      $vSt->execute();

      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo "<td>$vResult[medicament_prescrit]</td>";
        echo "<td>$vResult[quantite_prescrite]</td>";
        echo '</tr>';
      }

      ?>
    </table>

  </body>
  </html>
