// La racine ici est l'animal 
// L'ordre générale à suivre 
/* 
- nom :
- poids :
- taille :
- dateNaissance : 
- proprietaire : 
    - nom :
    - prenom :
    - dateNaissance :
    - adresse :
    - numero :
- espece : 
  - nom : 
  - classe :
- traitement : 
  - debut : 
  - duree :
  - medicament : 
    - nomMolecure : 
    - description : 
    - quantite : 
*/
db.Clinique.drop()

db.Clinique.insert({
  nom: "Sunny",
  poids: 6,
  taille: 40,
  dateNaissance:new Date("2014-12-15"),
  proprietaire:
  {
    nom: "Allaire",
    prenom: "Laurence",
    dateNaissance: new Date("1969-02-04"),
    adresse: "Saint-Molf",
    numero: "0761444829"
  },
  espece: {
    nom: "chien",
    classe: "mammifere"
  }
})


db.Clinique.insert({
  nom: "Filou",
  poids: 5,
  taille: 45,
  proprietaire:
  {
    nom: "Guerin",
    prenom: "Maurice",
    dateNaissance: new Date("1940-04-04"),
    adresse: "Saint-Andre",
    numero: "0643564829"
  },
  espece: {
    nom: "chat",
    classe: "mammifere"
  },
  traitement: [{
    debut: new Date("2019-08-15"),
    duree: 10,
    medicament: [{
      nomMolecule: "ANIMAZEN",
      description: "Aliment complémentaire pour les périodes de stress chez les chiens, chats.",
      quantite: 3
    }]
  }]
})



// Izao 
db.Clinique.insert({

  nom: "Izao",
  poids: 7,
  taille: 55,
  proprietaire: {
    nom: "Danilo",
    prenom: "Melani",
    dateNaissance: new Date("1999-04-15"),
    adresse: "Guerande",
    numero: "0643784890"
  },
  espece: {
    nom: "chien",
    classe: "mammifere"
  }
})


// Cristale 

db.Clinique.insert({

  nom: "Cristale",
  poids: 8,
  taille: 60,
  proprietaire: {
    nom: "Halgand",
    prenom: "Melanie",
    dateNaissance: new Date("1998-01-01"),
    adresse: "Herbignac",
    numero: "0656764829"
  },
  espece: {
    nom: "chien",
    classe: "mammifere"
  },
  traitement: [{
    debut: new Date("2019-09-10"),
    duree: 5,
    medicament: [{
      nomMolecule: "MILBEMAX",
      description: "Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens",
      quantite: 3
    }]
  }]
})


// Bob 

db.Clinique.insert({

  nom: "Bob",
  poids: 20,
  taille: 40,
  dateNaissance: new Date("2013-12-15"),
  proprietaire:
  {
    nom: "Guerin",
    prenom: "Maurice",
    dateNaissance: new Date("1940-04-04"),
    adresse: "Saint-Andre",
    numero: "0643564829"
  },
  espece: {
    nom: "anaconda",
    classe: "reptile"
  },
  traitement:
    [
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
})


// Margerite 

db.Clinique.insert({

  nom: "Margerite",
  poids: 600,
  taille: 80,
  dateNaissance: new Date("2018-12-15"),

  proprietaire:
  {
    nom: "Guerin",
    prenom: "Maurice",
    dateNaissance: new Date("1940-04-04"),
    adresse: "Saint-Andre",
    numero: "0643564829"
  },
  espece: {
    nom: "vache",
    classe: "mammifere"
  },

  traitement:
    [

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
})

// Création de qq requete 

//Affichage des animaux appartenant à un client donné
db.Clinique.find({ "proprietaire.nom": "Guerin" }, { "nom": 1, "_id": 0 })

//Affichage des noms de chien
db.Clinique.find({ "espece.nom": "chien" }, { "_id": 0, "nom": 1 })

//Selection des animaux d'age apres 2010
db.Clinique.find({"dateNaissance":{$gte:new Date ("2010-01-01")}},{ "_id": 0, "nom": 1 })

//Affichage des animaux qui n'a pas traitement
db.Clinique.find({traitement:{$exists: false}},{ "_id": 0, "nom": 1 })