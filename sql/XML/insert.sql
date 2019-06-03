/*------------------------------------------------------------*/
/*------------- Les différents types d'animaux : -------------*/
/*------------------------------------------------------------*/
INSERT INTO ClasseEspece(nom) VALUES('mammifere');
INSERT INTO ClasseEspece(nom) VALUES('reptile');
INSERT INTO ClasseEspece(nom) VALUES('oiseau');
INSERT INTO ClasseEspece(nom) VALUES('autre');

INSERT INTO Espece (nom,classe) VALUES('chat','mammifere');
/
INSERT INTO Espece (nom,classe) VALUES('chien','mammifere');
/
INSERT INTO Espece (nom,classe) VALUES('anaconda','reptile');
/
INSERT INTO Espece (nom,classe) VALUES('perroquet','oiseau');
/
INSERT INTO Espece (nom,classe) VALUES('vache','mammifere');
/

/*------------------------------------------------------------*/
/*--------------------- Les individus :-----------------------*/ 
/*------------------------------------------------------------*/
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Guerin','Maurice','1940-04-04','Saint-Andre','0643564829');
/
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Allaire','Laurence','1969-02-04','Saint-Molf','0761444829');
/
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Danilo','Melani','1999-04-15','Guerande','0643784890');
/
INSERT INTO Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Halgand','Melanie','1998-01-01','Herbignac','0656764829');
/

/*------------------------------------------------------------*/
/*---------------------- Les animaux :------------------------*/
/*------------------------------------------------------------*/
INSERT INTO Animal(nom,proprietaire,poids,taille,espece) VALUES ('Filou','1','5','45','chat');
/
INSERT INTO Animal(nom,proprietaire,poids,taille,espece,traitement) VALUES (
    'Izao','3','7','55','chien', 
    XMLType (' 
    <traitements>
      <traitement>
        <debut>2019-09-04</debut>
        <duree>15</duree>
        <veterinaire> 
          <nom>Ginny</nom>
          <prenom>Weasley</prenom>
        </veterinaire>
      </traitement>
      <traitement>
        <debut>1978-04-14</debut>
        <duree>30</duree>
        <veterinaire> 
          <nom>Remus</nom>
          <prenom>Lupin</prenom>
        </veterinaire>
        <prescription> 
          <medicament> 
            <nomMolecule>Wolf Spain</nomMolecule>
            <quantite>75</quantite>
          </medicament>
          <medicament> 
            <nomMolecule>Silver</nomMolecule>
            <quantite>21</quantite>
          </medicament>
        </prescription>
      </traitement>
    </traitements>
    ')
);
/

INSERT INTO Animal(nom,proprietaire,poids,taille,espece) VALUES ('Cristale','4','8','60','chien');
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Sunny','2','6','40','2014-12-15','chien');
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES (
    'Bob','1','20','40','2013-12-15','anaconda', 
    XMLType (' 
    <traitements>
      <traitement>
        <debut>2015-09-04</debut>
        <duree>40</duree>
        <veterinaire> 
          <nom>Ron</nom>
          <prenom>Weasley</prenom>
        </veterinaire>
        <prescription> 
          <medicament> 
            <nomMolecule>Vita Reptile</nomMolecule>
            <quantite>30</quantite>
          </medicament>
        </prescription>
      </traitement>
    </traitements>
    ')
);
/
INSERT INTO Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Margerite','1','600','80','2018-12-15','vache');
