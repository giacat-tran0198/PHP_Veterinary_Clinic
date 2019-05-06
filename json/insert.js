db.Clinique.insert(
  {
    nom : "Sunny",
    proprietaire :
    {
      nom : "Allaire",
      prenom:"Laurence",
      dateNaissance:"1969-02-04",
      adresse:"Saint-Molf",
      numero:"0761444829"
    }, 
    poids : 6,  
    taille : 40, 
    dateNaissance : "2014-12-15",
    espece : {
      nom : "chien", 
      classe : "mammifere"
    },
    
    traitement :
    [
        
        {
            medicament : "",
            quantite : "",
            date : ""
        }
        
        
        ]
  }
)





db.Clinique.insert(
    
    {
        
          nom : "Bob",
    proprietaire :
    {
      nom : "Guerin",
      prenom:"Maurice",
      dateNaissance:"1940-04-04",
      adresse:"Saint-Andre",
      numero:"0643564829"
    }, 
    poids : 20,  
    taille : 40, 
    dateNaissance : "2013-12-15",
    espece : {
      nom : "anaconda", 
      classe : "reptile"
    },
    
    traitement :
    [
        
        {
            debut : "2019-07-5",
            duree : 40,
            medicament : 
            [
                {nom : "VITAREPTILE",
                quantite : 3}
                
                
                
                ]
            
        }
            
            
            
             ]
        
        
        
        
        
    }
    
    
)
