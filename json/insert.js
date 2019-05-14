// La racine ici est le client soit le propriétaire des animaux  
// L'ordre générale à suivre 
/* 
- nom : 
- prenom : 
- dateNaissance : 
- adresse : 
- numero : 
- animaux : 
    - nom :
    - poids :
    - dateNaissance :
    - espece : 
      - nom :
      - chien :
    - traitement : 
      - debut :
      - duree :
      - medicament :
        - nomMolecule : 
        - description :
        - quantite :
*/
db.Clinique.drop()


// --- Laurence --- 
db.Clinique.insert({
    nom: "Allaire",
    prenom: "Laurence",
    dateNaissance: new Date("1969-02-04"),
    adresse: "Saint-Molf",
    numero: "0761444829", 
    animaux : [ 
      {
        nom: "Sunny",
        poids: 6, 
        taille: 40,
        dateNaissance:new Date("2014-12-15"),
        espece: {
          nom: "chien",
          classe: "mammifere"
        }
      }
    ]
})


// --- Maurice  --- 
db.Clinique.insert({
  nom: "Guerin",
  prenom: "Maurice",
  dateNaissance: new Date("1940-04-04"),
  adresse: "Saint-Andre",
  numero: "0643564829", 
  animaux : [ 
    {
      nom: "Filou",
      poids: 5,
      taille: 45,
      espece: {
        nom: "chat",
        classe: "mammifere"
      },
      traitement: [
        {
          debut: new Date("2019-08-15"),
          duree: 10,
          medicament: [
            {
              nomMolecule: "ANIMAZEN",
              description: "Aliment complémentaire pour les périodes de stress chez les chiens, chats.",
              quantite: 3
            }
          ]
        }
      ]
    }, 
    {
      nom: "Bob",
      poids: 20,
      taille: 40,
      dateNaissance: new Date("2013-12-15"),
      espece: {
        nom: "anaconda",
        classe: "reptile"
      },
      traitement:[
        {
          debut: new Date("2019-07-5"),
          duree: 40,
          medicament: [
            {
              nomMolecule: "VITAREPTILE",
              description: "Aliment complémentaire riche en vitamine pour reptiles.",
              quantite: 3
            }
          ]
        }
      ]
    }, 
    {
      nom: "Margerite",
      poids: 600,
      taille: 80,
      dateNaissance: new Date("2018-12-15"),
      espece: {
        nom: "vache",
        classe: "mammifere"
      },
      traitement:[
        {
          debut: new Date("2019-10-10"),
          duree: 5,
          medicament: [
            {
              nomMolecule: "ACTICARP",
              description: "Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins",
              quantite: 3
            },
            {
              nomMolecule: "ACTIDRALYTE",
              description: "Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets",
              quantite: 1
            }
          ]
        }
      ]
    }
  ]
}) 
  

// --- Melanie Danilo --- 
db.Clinique.insert({
  nom: "Danilo",
  prenom: "Melanie",
  dateNaissance: new Date("1999-04-15"),
  adresse: "Guerande",
  numero: "0643784890", 
  animaux : [
    {
      nom: "Izao",
      poids: 7,
      taille: 55,
      espece: {
        nom: "chien",
        classe: "mammifere"
      }

    }
  ]
}) 



// --- Melanie Halgand --- 
db.Clinique.insert({
  nom: "Halgand",
  prenom: "Melanie",
  dateNaissance: new Date("1998-01-01"),
  adresse: "Herbignac",
  numero: "0656764829", 
  animaux : [ 
    {
      nom: "Cristale",
      poids: 8,
      taille: 60,
      espece: {
        nom: "chien",
        classe: "mammifere"
      },
      traitement: [
        {
          debut: new Date("2019-09-10"),
          duree: 5,
          medicament: [
            {
              nomMolecule: "MILBEMAX",
              description: "Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens",
              quantite: 3
            }
          ]
        }
      ]
    }
  ]
}) 




// Création de quelques requetes 

//Affichage des animaux appartenant à un client donné
db.Clinique.find({ "nom": "Guerin" }, { "nom": 1, "_id": 0 })

//Affichage des noms de chien
db.Clinique.find({ "animaux.espece.nom": "chien" }, { "_id": 0, "animaux.nom": 1 })

//Selection des animaux d'age apres 2010
db.Clinique.find({"animaux.dateNaissance":{$gte:new Date ("2010-01-01")}},{ "_id": 0, "animaux.nom": 1 })

//Affichage des animaux qui n'a pas traitement
db.Clinique.find({"animaux.traitement":{$exists: false}},{ "_id": 0, "animaux.nom": 1 })



// ---------------------------------------------------------------
// --------------------------- Refaire ---------------------------
// ---------------------------------------------------------------

//Affiche le poid moyen de chaque annimal
db.Clinique.aggregate([ {$group: {"_id":"$animaux.nom", "avg_poids":{$avg: "$animaux.poids"},}}, {$sort : {"avg_poids":-1}} ])