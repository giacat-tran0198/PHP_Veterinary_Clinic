conn = new Mongo();
db = conn.getDB("clinique");

print("1) Affiche tous les animaux de Mr.Guerin : ")

animaux = db.Clinique.find({"proprietaire.nom":"Guerin"}, {"nom":1,"_id":0})

while ( animaux.hasNext() ) {
   animal = animaux.next() ;
   print("- ", animal.nom);	
}

print("2) Affiche les noms de chiens : ")

chiens = db.Clinique.find({ "espece.nom": "chien" }, { "_id": 0, "nom": 1 })

while ( chiens.hasNext() ) {
   chien = chiens.next() ;
   print("- ", chien.nom);	
}



print("3) Affiche les noms des animaux qui sont nés après 2010 : ")

jeunes = db.Clinique.find({"dateNaissance":{$gte:new Date ("2010-01-01")}},{ "_id": 0, "nom": 1 })


while ( jeunes.hasNext() ) {
   jeune = jeunes.next() ;
   print("- ", jeune.nom);	
}


print("4) Affiche les noms des animaux sans traitement : ")

non_traitements = db.Clinique.find({traitement:{$exists: false}},{ "_id": 0, "nom": 1 })

while ( non_traitements.hasNext() ) {
    non_traitement = non_traitements.next() ;
   print("- ", non_traitement.nom);	
}



print("5) Affiche le poid moyen de chaque annimal ")

animaux = db.Clinique.aggregate([ {$group: {"_id":"$nom", "avg_poids":{$avg: "$poids"},}}, {$sort : {"avg_poids":-1}} ])

while ( non_traitements.hasNext() ) {
    animal = animaux.next() ;
   print("- ", animal.nom);	
}



//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//-----------------------  Code en cours de préparation --------------------------------------
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------

print("6) la quantité de chaque type de médicament prescrit pour un animal donné")
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

print("7) Nombre d' animaux et les poids et taille moyenne des animaux d'une espèce traités")
escape = db.Clinique.aggregate({$group: {_id:"$espece.nom", poids: {$avg: "$poids"}, taille: {$avg: "$taille"},count:{$sum:1}}})
while (escape.hasNext()){
    let animal = escape.next()
    print ("- ",animal._id,", nombre: ", animal.count,", poids moyenne: ",animal.poids, "taille moyenne: ",animal.taille)
}