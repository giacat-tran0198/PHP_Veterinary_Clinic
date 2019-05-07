conn = new Mongo();
db = conn.getDB("Clinique");

print("1) Affichage des animaux appartenant à un client donné")
NomProp = "Guerin"
print("Nom de client est "+NomProp)
proprietaire = db.Clinique.find({ "proprietaire.nom": NomProp }, { "nom": 1, "_id": 0 })
while ( proprietaire.hasNext() ) {
   let nom = proprietaire.next() ;
   print("- ", nom.nom);	
}

print("2) Affichage des noms de animaux")
EspaceAnimal = "chien"
print("L'espace d'animal est "+EspaceAnimal)
animaux = db.Clinique.find({ "espece.nom": EspaceAnimal },{ "_id": 0, "nom": 1 })
while (animaux.hasNext()){
    let animal = animaux.next();
    print("- ",animal.nom);
}

print("3) Affichage des noms ont date de naissance apres 2010")
date = db.Clinique.find({"dateNaissance":{$gte:new Date ("2010-01-01")}},{ "_id": 0, "nom": 1, "dateNaissance":1 })
while (date.hasNext()){
    let animal = date.next();
    print("- ",animal.nom," : ",animal.dateNaissance.toISOString().slice(0, 10));
}

print("4) Affichage des animaux qui n'a pas traitement")
nonTrait = db.Clinique.find({traitement:{$exists: false}},{ "_id": 0, "nom": 1 })
while (nonTrait.hasNext()){
    let animal = nonTrait.next();
    print("- ",animal.nom);
}

print("5) la quantité de chaque type de médicament prescrit pour un animal donné")
idAnimal = 4
print("Choisiz le ", idAnimal, "e animal")
quantie = db.Clinique.find({}, { "_id": 0, "traitement": 1 })
id = 0
while (quantie.hasNext()) {
    id++
    let animal = quantie.next()
    if (id == idAnimal) {
        if("traitement" in animal){
            let res = animal.traitement.reduce((acc, next) => {
                next.medicament.forEach(({ nomMolecule }) => {
                  acc[nomMolecule] = acc[nomMolecule] + 1 || 1;
                });
                return acc;
              }, {});
            Object.keys(res).forEach(e => print("nomMolecule = ",e,"   quantite= ",res[e]));
        }
        else
        print("Cet animal n'a pas traitement")
    }
}

print("6) Nombre d' animaux et les poids et taille moyenne des animaux d'une espèce traités")
escape = db.Clinique.aggregate({$group: {_id:"$espece.nom", poids: {$avg: "$poids"}, taille: {$avg: "$taille"},count:{$sum:1}}})
while (escape.hasNext()){
    let animal = escape.next()
    print ("- ",animal._id,", nombre: ", animal.count,", poids moyenne: ",animal.poids, "taille moyenne: ",animal.taille)
}