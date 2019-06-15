<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Inscription</title>
    </head>
    <body>
        <h1>L'inscription Client</h1>
        <form action="insert_medicament.php" method="POST">
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                    <td>
                        nomMolecule : 
                    </td>
                    <td>
                        <input type="text" name="nomMolecule" size="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        description :
                    </td>
                    <td> <input type="text" name="description" size = "250">
                    </td>
                </tr>
                <tr>
                    <td> espece : </td>
                    <td>
                    <?php
                        include('connect.php');
                        echo "<select name='espece'>";
                        $vSql ="SELECT * FROM Clinique.Espece";
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
                </tr>
            </table>
            <input type="submit" value="submit" />
            <input type="reset" value="réinitialiser" />
            <button onclick="history.go(-1)">Retour</button>
        </form>
    </body>
</html>