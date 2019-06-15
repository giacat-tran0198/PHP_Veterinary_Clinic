<html>
<head>
  <title>Exercice</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>
<body>
  <h1> Table client</h1>
  <table border="1">
    <tr><th>Nom</th></tr>
    <?php
    // Connexion à la base de données
    require('connect.php');
    // Affichage du tableau de données
    $vSql ='SELECT * FROM Clinique.Client';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[nom]</td>";
      echo '</tr>';
    }
    ?>
  </table>
  <h1> Table Veterinaire</h1>
  <table border="1">
    <tr><th>Nom</th></tr>
    <?php
    $vSql ='SELECT * FROM Clinique.Veterinaire';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[nom]</td>";
      echo '</tr>';
    }
    ?>
  </table>
  <a href='inscription_client.php' title='inscription_client'>Inscription Client</a>
  <a href='inscription_veterinaire.php' title='inscription_veterinaire'>Inscription Veterinaire</a>
  <a href='inscription_animal.php' title='inscription_animal'>Inscription Animal</a>
  <a href='inscription_medicament.php' title='inscription_medicament'>Inscription Medicament</a>

</body>
</html>