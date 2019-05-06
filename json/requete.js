conn = new Mongo();
db = conn.getDB("Clinique");

print("Affichage des animaux appartenant à un client donné")
NomProp = "Guerin"
print("Nom de client est "+NomProp)
proprietaire = db.Clinique.find({ "proprietaire.nom": NomProp }, { "nom": 1, "_id": 0 })
while ( proprietaire.hasNext() ) {
   nom = proprietaire.next() ;
   print("- ", nom.nom);	
}

print("Affichage des noms de animaux")
EspaceAnimal = "chien"
print("L'espace d'animal est "+EspaceAnimal)
animaux = db.Clinique.find({ "espece.nom": EspaceAnimal },{ "_id": 0, "nom": 1 })
while (animaux.hasNext()){
    animal = animaux.next();
    print("- ",animal.nom);
}

print("Affichage des noms ont date de naissance apres 2010")
date = db.Clinique.find({"dateNaissance":{$gte:new Date ("2010-01-01")}},{ "_id": 0, "nom": 1, "dateNaissance":1 })
while (date.hasNext()){
    animal = date.next();
    print("- ",animal.nom," : ",animal.dateNaissance.toISOString().slice(0, 10));
}

print("Affichage des animaux qui n'a pas traitement")
nonTrait = db.Clinique.find({traitement:{$exists: false}},{ "_id": 0, "nom": 1 })
while (nonTrait.hasNext()){
    animal = nonTrait.next();
    print("- ",animal.nom);
}