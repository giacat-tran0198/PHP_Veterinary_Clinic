<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Médicaments prescrits à chaque animal</title>
    </head>
    <body>
        <h1>Choisir un animal</h1>
        <form action="stat_medicament_animal.php" method="POST">
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                    <td>
                        Animal :
                    </td>
                    <td>
                      <?php
                      require("connect.php");
                          echo "<select name='animal'>";
                          $vSql ="SELECT nom FROM Clinique.Animal";
                          $vSt = $vConn->prepare($vSql);
                          $vSt->execute();
                          while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
                              echo "<option value= '{$vResult[nom]}'>";
                              echo "$vResult[nom]";
                              echo "</option>";
                            }
                          echo "</select>";
                          ?>
                    </td>

            </table>
            <input type="submit" value="submit" />
            <input type="reset" value="réinitialiser" />
            <button onclick="history.go(-1)">Retour</button>
        </form>
    </body>
</html>
