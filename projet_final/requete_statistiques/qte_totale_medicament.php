<html>
<head>
  <title>Requêtes statistiques</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>

  <body>
    <h1>Quantité totale prescrite pour ce médicament</h1>
    <table border="1">
      <tr><th>Médicament</th><th>Quantité totale prescrite</th></tr>
    <?php
      require('connect.php');


      $nom = $_POST['medicament'];
      $vSql ="SELECT M.nomMolecule AS medicament , SUM(P.quantite) AS quantite_medicament
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M
WHERE P.medicament = M.nomMolecule
AND M.nomMolecule='$nom'
GROUP BY M.nomMolecule ;
";

      $vSt = $vConn->prepare($vSql);
      $vSt->execute();

      while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
        echo '<tr>';
        echo "<td>$vResult[medicament]</td>";
        echo "<td>$vResult[quantite_medicament]</td>";
        echo '</tr>';
      }

      ?>
    </table>

  </body>
  </html>
