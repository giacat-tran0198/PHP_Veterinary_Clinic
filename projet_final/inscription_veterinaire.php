<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Inscription</title>
    </head>
    <body>
        <h1>L'inscription Client</h1>
        <form action="insert_veterinaire.php" method="POST">
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                    <td>
                        Nom : 
                    </td>
                    <td>
                        <input type="text" name="nom" size="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Prenom :
                    </td>
                    <td>
                        <input type="text" name="prenom" size="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Naissance :
                    </td>
                    <td> <input type="date" name="dateNaissance">
                    </td>
                </tr>
                <tr>
                    <td>
                        adresse :
                    </td>
                    <td>
                        <input type="text" name="adresse" size="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        numero :
                    </td>
                    <td>
                        <input type="text" name="numero" size="10" />
                    </td>
                </tr>
                <tr>
                    <td> specialite : </td>
                    <td>
                    <?php
                        include('connect.php');
                        echo "<select name='specialite'>";
                        $vSql ="SELECT * FROM Clinique.ClasseEspece";
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