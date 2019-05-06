conn = new Mongo();
db = conn.getDB("Clinique");

print("Affichage des animaux appartenant à un client donné")
proprietaire = db.Clinique.find({ "proprietaire.nom": "Guerin" }, { "nom": 1, "_id": 0 })
while ( proprietaire.hasNext() ) {
   nom = proprietaire.next() ;
   print("- ", nom.nom);	
}

print("Affichage des noms de chien")
chien = db.Clinique.find({ "espece.nom": "chien" },{ "_id": 0, "nom": 1 })
while (chien.hasNext()){
    nom = chien.next();
    print("- ",nom.nom);
}