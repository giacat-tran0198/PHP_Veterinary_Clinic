<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Médicaments autorisés pour chaque espèce</title>
    </head>
    <body>
        <h1>Choisir une espèce</h1>
        <form action="medicament_autorise_espece.php" method="POST">
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                    <td>
                        Espèce
                    </td>
                    <td>
                      <?php
                      require("connect.php");
                          echo "<select name='espece'>";
                          $vSql ="SELECT nom FROM Clinique.Espece";
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
