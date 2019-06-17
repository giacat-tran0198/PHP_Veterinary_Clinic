<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Quantité totale prescrite pour chaque médicament</title>
    </head>
    <body>
        <h1>Saisir un médicament</h1>
        <form action="qte_totale_medicament.php" method="POST">
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                    <td>
                        Médicament
                    </td>
                    <td>
                      <?php
                      require("connect.php");
                          echo "<select name='medicament'>";
                          $vSql ="SELECT nommolecule FROM Clinique.Medicament";
                          $vSt = $vConn->prepare($vSql);
                          $vSt->execute();
                          while ($vResult = $vSt->fetch(PDO::FETCH_ASSOC)) {
                              echo "<option value= '{$vResult[nommolecule]}'>";
                              echo "$vResult[nommolecule]";
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
