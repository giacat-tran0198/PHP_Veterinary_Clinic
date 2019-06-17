<html>
<head>
  <title>Exercice</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
  </head>
<body>
  <h1> Table client</h1>
  <table border="1">
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Date de Naissance</th>
        <th>Adresse</th>
        <th>numero</th>
    </tr>
    <?php
    // Connexion à la base de données
    require('connect.php');
    // Affichage du tableau de données
    $vSql ='SELECT * FROM Clinique.Client';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[id]</td>";
      echo "<td>$vResult[nom]</td>";
      echo "<td>$vResult[prenom]</td>";
      echo "<td>$vResult[datenaissance]</td>";
      echo "<td>$vResult[adresse]</td>";
      echo "<td>$vResult[numero]</td>";
      echo '</tr>';
    }
    ?>
  </table>


  <h1> Table Classe Espece</h1>
  <table border="1">
    <tr>
        <th>Nom</th>
    </tr>
    <?php
    $vSql ='SELECT * FROM Clinique.ClasseEspece';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[nom]</td>";
      echo '</tr>';
    }
    ?>
  </table>

  <h1> Table Espece</h1>
  <table border="1">
    <tr>
        <th>Nom</th>
        <th>Classe</th>
    </tr>
    <?php
    $vSql ='SELECT * FROM Clinique.Espece';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[nom]</td>";
      echo "<td>$vResult[classe]</td>";
      echo '</tr>';
    }
    ?>
  </table>

  <h1> Table Veterinaire</h1>
  <table border="1">
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Date de Naissance</th>
        <th>Adresse</th>
        <th>numero</th>
        <th>Specialite</th>
    </tr>
    <?php
    $vSql ='SELECT * FROM Clinique.Veterinaire';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[id]</td>";
      echo "<td>$vResult[nom]</td>";
      echo "<td>$vResult[prenom]</td>";
      echo "<td>$vResult[datenaissance]</td>";
      echo "<td>$vResult[adresse]</td>";
      echo "<td>$vResult[numero]</td>";
      echo "<td>$vResult[specialite]</td>";
      echo '</tr>';
    }
    ?>
  </table>

  <h1> Table Assistant</h1>
  <table border="1">
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Date de Naissance</th>
        <th>Adresse</th>
        <th>numero</th>
        <th>Specialite</th>
    </tr>
    <?php
    $vSql ='SELECT * FROM Clinique.Assistant';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[id]</td>";
      echo "<td>$vResult[nom]</td>";
      echo "<td>$vResult[prenom]</td>";
      echo "<td>$vResult[datenaissance]</td>";
      echo "<td>$vResult[adresse]</td>";
      echo "<td>$vResult[numero]</td>";
      echo "<td>$vResult[specialite]</td>";
      echo '</tr>';
    }
    ?>
  </table>

  <h1> Table Animal</h1>
  <table border="1">
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Proprietaire</th>
        <th>poids</th>
        <th>taille</th>
        <th>Date de Naissance</th>
        <th>Espece</th>
    </tr>
    <?php
    $vSql ='SELECT * FROM Clinique.Animal';
    $vSt = $vConn->prepare($vSql);
    $vSt->execute();
    while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
      echo '<tr>';
      echo "<td>$vResult[id]</td>";
      echo "<td>$vResult[nom]</td>";
      echo "<td>$vResult[proprietaire]</td>";
      echo "<td>$vResult[poids]</td>";
      echo "<td>$vResult[taille]</td>";
      echo "<td>$vResult[datenaissance]</td>";
      echo "<td>$vResult[espece]</td>";
      echo '</tr>';
    }
    ?>
  </table>


</body>
</html>
