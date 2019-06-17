<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Inscription</title>
        <SCRIPT language=JavaScript>
            function reload(form){
                var val=form.animal.options[form.animal.options.selectedIndex].value;
                self.location='inscription_traitement.php?animal=' + val ;}
        </script>
    </head>
    <body>
        <h1>L'inscription traitement</h1>
        <?php
                require('connect.php');
                @$animal_id=$_GET['animal']; 
                if(strlen($animal_id) > 0 and !is_numeric($animal_id)){ 
                        echo "Data Error";
                        exit;}

                $quer2="SELECT id, nom FROM Clinique.Animal"; 

                if(isset($animal_id) and strlen($animal_id) > 0){
                        $quer="SELECT v.id, v.nom FROM Clinique.Veterinaire v, Clinique.Espece e, Clinique.Animal a where a.id=$animal_id and a.espece = e.nom and e.classe = v.specialite "; 
                }else{
                        $quer="SELECT id, nom FROM Clinique.Veterinaire"; } 
                
                echo "<form method=post action='insert_traitement.php'>";
                echo "<br> animal: ";
                echo "<select name='animal' onchange=\"reload(this.form)\"><option value=''>Select one</option>";
                
                $vSt = $vConn->prepare($quer2);
                $vSt->execute();
                
                while ($noticia2 = $vSt->fetch(PDO::FETCH_ASSOC)) {
                        if($noticia2['id']==@$animal_id){
                                echo "<option selected value='$noticia2[id]'>$noticia2[nom]</option>"."<BR>";}
                        else{
                                echo  "<option value='$noticia2[id]'>$noticia2[nom]</option>";}
                }
                echo "</select>";
                

                echo "<br> veterinaire: ";
                echo "<select name='veterinaire'><option value=''>Select one</option>";
                $vSt = $vConn->prepare($quer);
                $vSt->execute();
                while ($noticia = $vSt->fetch(PDO::FETCH_ASSOC)) {
                        echo  "<option value='$noticia[id]'>$noticia[nom]</option>";
                }
                echo "</select>";
                
                echo "<br> Debut: ";
                echo "<input type='date' name='debut'>";
                echo "<br> Duree: ";
                echo "<input type='number' name='duree'>";
                echo "<input type='submit' value=Submit>";
                echo "</form>";
        ?>
            <button onclick="history.go(-1)">Retour</button>
        </form>
    </body>
</html>