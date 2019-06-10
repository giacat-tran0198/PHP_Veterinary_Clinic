/* Insertions */

/*------------------------------------------------------------*/
/*------------- Les différents types d'animaux : -------------*/
/*------------------------------------------------------------*/
INSERT INTO ClasseEspece(nom) VALUES('mammifere');
INSERT INTO ClasseEspece(nom) VALUES('reptile');
INSERT INTO ClasseEspece(nom) VALUES('oiseau');
INSERT INTO ClasseEspece(nom) VALUES('autre');

INSERT INTO Espece (nom,classe) VALUES('chat','mammifere');
INSERT INTO Espece (nom,classe) VALUES('chien','mammifere');
INSERT INTO Espece (nom,classe) VALUES('anaconda','reptile');
INSERT INTO Espece (nom,classe) VALUES('perroquet','oiseau');
INSERT INTO Espece (nom,classe) VALUES('vache','mammifere');

/*------------------------------------------------------------*/
/*--------------------- Les individus :-----------------------*/ 
/*------------------------------------------------------------*/
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Guerin','Maurice','1940-04-04','Saint-Andre','0643564829');
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Allaire','Laurence','1969-02-04','Saint-Molf','0761444829');
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Danilo','Melani','1999-04-15','Guerande','0643784890');
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Halgand','Melanie','1998-01-01','Herbignac','0656764829');


/*------------------------------------------------------------*/
/*---------------------- Les animaux :------------------------*/
/*------------------------------------------------------------*/
INSERT INTO Animal(nom,proprietaire,poids,taille,espece,traitement) VALUES ('Filou','1','5','45','chat',
   '[
        {
            "debut" : "15/04/2019", 
            "duree": 4 ,
            "veterinaire" : {
                "nom" : "Potter" ,
                "prenom" : "Harry"       
            }, 
            "medicament" :[
                {
                "nomMolecule" : "Chourix", 
                "quantite" : 15 
                }, 
                {
                "nomMolecule" : "Chocolat", 
                "quantite" : 3
                }
            ]
        }
    ]'
);
INSERT INTO Animal(nom,proprietaire,poids,taille,espece) VALUES ('Izao','3','7','55','chien');
INSERT INTO Animal(nom,proprietaire,poids,taille,espece) VALUES ('Cristale','4','8','60','chien');
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Sunny','2','6','40','2014-12-15','chien');
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Bob','1','20','40','2013-12-15','anaconda');
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Margerite','1','600','80','2018-12-15','vache');

