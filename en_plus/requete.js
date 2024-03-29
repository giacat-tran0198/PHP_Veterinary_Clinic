conn = new Mongo();
db = conn.getDB("Clinique");   // Attention peut-etre a modifier en fonction de la db choisie 

print("\n 1) Affiche tous les nom des animaux de Mr.Guerin : ")

proprietaire = db.Clinique.find({ "nom": "Guerin" }, { "animaux.nom" : 1, "_id": 0 })

animaux = db.Clinique.aggregate(
    [
      { $group : { _id : "$author", books: { $push: "$title" } } }
    ]
 )


while (animaux.hasNext()) {
    animal = animaux.next();
    print("- ", animal._nom);
}



print("\n 2) Affiche les noms de chiens : ")

chiens = db.Clinique.find({"animaux.espece.nom":"chien"},{"_id":0, "animaux.nom":1})

chiens = db.Clinique.find({ "animaux.espece.nom": "chien" }, { "_id": 0, "nom": 1 } )

while (chiens.hasNext()) {
    chien = chiens.next();
    print("- ", chien.nom_animal);
}


print("\n 3) Affiche les noms des animaux qui sont nés après 2010 : ")

jeunes = db.Clinique.find({ "dateNaissance": { $gte: new Date("2010") } }, { "_id": 0, "nom": 1 })

while (jeunes.hasNext()) {
    jeune = jeunes.next();
    print("- ", jeune.nom);
}


print("\n 4) Affiche les noms des animaux sans traitement : ")

non_traitements = db.Clinique.find({ traitement: { $exists: false } }, { "_id": 0, "nom": 1 })

while (non_traitements.hasNext()) {
    non_traitement = non_traitements.next();
    print("- ", non_traitement.nom );
}



print("\n 5) Affiche le poids moyen de chaque annimal ")

animaux = db.Clinique.aggregate(
    { $group: {
        _id :"$nom", 
        "avg_poids":{$avg: "$poids"}
        } 
    }
) 

while ( animaux.hasNext() ) {
    animal = animaux.next() ;
   print("- ", animal._id, "\n       poids moyen :", animal.avg_poids);	
}

print("\n 6) la quantité de chaque type de médicament prescrit pour Margerite")

nomAnimal = db.Clinique.aggregate(
    { $match: { nom: "Margerite" } },
    { $unwind: "$traitement" },
    { $unwind: "$traitement.medicament" },
    {
        $group: {
            _id: "$traitement.medicament.nomMolecule",
            quantite: { $sum: "$traitement.medicament.quantite" }
        }
    })

while (nomAnimal.hasNext()) {
    let animal = nomAnimal.next()
    print("- ", animal._id, ", quantite: ", animal.quantite)
}

print("\n 7) La quantité d'un médicament prescrit au total dans la clinique")

medicament = db.Clinique.aggregate(
    { $unwind: "$traitement" },
    { $unwind: "$traitement.medicament" },
    {
        $group: {
            _id: "$traitement.medicament.nomMolecule",
            quantite: { $sum: "$traitement.medicament.quantite" }
        }
    })

while (medicament.hasNext()) {
    let medicine = medicament.next()
    print("- ", medicine._id, ", quantite: ", medicine.quantite)
}

print("\n 8) Nombre d' animaux et les poids et taille moyenne des animaux d'une espèce traités")

escape = db.Clinique.aggregate(
    {
        $group: {
            _id: "$espece.nom",
            poids: { $avg: "$poids" },
            taille: { $avg: "$taille" },
            count: { $sum: 1 }
        }
    })

while (escape.hasNext()) {
    let animal = escape.next()
    print("- ", animal._id, ", nombre: ", animal.count, ", poids moyenne: ", animal.poids, "taille moyenne: ", animal.taille)
}