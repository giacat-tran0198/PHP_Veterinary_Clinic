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

db.Clinique.insert({
    nom : "Sunny",
    poids : "6",  
    taille : "40", 
    dateNaissance : "2014-12-15",
    proprietaire :
    {
      nom : "Allaire",
      prenom:"Laurence",
      dateNaissance:"1969-02-04",
      adresse:"Saint-Molf",
      numero:"0761444829"
    }, 
    espece : {
      nom : "chien", 
      classe : "mammifere"
    }
  })


  db.Clinique.insert({
    nom : "Filou",
    poids : "5",  
    taille : "45", 
    proprietaire :
    {
      nom : "Guerin",
      prenom:"Maurice",
      dateNaissance:"1940-04-04",
      adresse:"Saint-Andre",
      numero:"0643564829"
    }, 
    espece : {
      nom : "chat", 
      classe : "mammifere"
    }, 
    traitement : [{
      debut : "2019-08-15", 
      duree : 10 ,
      medicament : [{
        nomMolecure : "ANIMAZEN", 
        description : "Aliment complémentaire pour les périodes de stress chez les chiens, chats.", 
        quantite : 3 
      }]
    }]
  })

  

  // Izao 



  // Cristale 



  // Bob 


  // Margerite 


  // Création de qq requete 
