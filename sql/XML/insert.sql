/*------------------------------------------------------------*/
/*------------- Les différents types d'animaux : -------------*/
/*------------------------------------------------------------*/
INSERT INTO ClasseEspece(nom) VALUES('mammifere');
/
INSERT INTO ClasseEspece(nom) VALUES('reptile');
/
INSERT INTO ClasseEspece(nom) VALUES('oiseau');
/
INSERT INTO ClasseEspece(nom) VALUES('autre');
/

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
CREATE SEQUENCE id_client_seq START WITH 1;
/

INSERT INTO ClientClinique VALUES(id_client_seq.NEXTVAL,'Guerin','Maurice',to_date('1940-04-04', 'yyyy-mm-dd'),'Saint-Andre','0643564829');
/
INSERT INTO ClientClinique VALUES(id_client_seq.NEXTVAL,'Allaire','Laurence',to_date('1969-02-04', 'yyyy-mm-dd'),'Saint-Molf','0761444829');
/
INSERT INTO ClientClinique VALUES(id_client_seq.NEXTVAL,'Danilo','Melani',to_date('1999-04-15', 'yyyy-mm-dd'),'Guerande','0643784890');
/
INSERT INTO ClientClinique VALUES(id_client_seq.NEXTVAL,'Halgand','Melanie',to_date('1998-01-01', 'yyyy-mm-dd'),'Herbignac','0656764829');
/

/*------------------------------------------------------------*/
/*---------------------- Les animaux :------------------------*/
/*------------------------------------------------------------*/
CREATE SEQUENCE id_animal_seq START WITH 1;
/

INSERT INTO Animal(id,nom,proprietaire,poids,taille,espece) VALUES (id_animal_seq.NEXTVAL,'Filou',1,5,45,'chat');
/
INSERT INTO Animal(id,nom,proprietaire,poids,taille,espece,traitement) VALUES (
    id_animal_seq.NEXTVAL,'Izao',3,7,55,'chien',
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

INSERT INTO Animal(id,nom,proprietaire,poids,taille,espece) VALUES (id_animal_seq.NEXTVAL,'Cristale',4,8,60,'chien');
INSERT INTO Animal(id,nom,proprietaire,poids,taille,dateNaissance,espece,traitement) VALUES (
    id_animal_seq.NEXTVAL,'Sunny',2,6,40,to_date('2014-12-15','yyyy-mm-dd'),'chien',
    XMLType (' 
    <traitements>
      <traitement>
        <debut>2019-09-04</debut>
        <duree>15</duree>
        <veterinaire> 
          <nom>Harry</nom>
          <prenom>Potter</prenom>
        </veterinaire>
        <prescription> 
          <medicament> 
            <nomMolecule>Milbemax</nomMolecule>
            <quantite>3</quantite>
          </medicament>
          <medicament> 
            <nomMolecule>Ocevit</nomMolecule>
            <quantite>13</quantite>
          </medicament>
        </prescription>
      </traitement>
      <traitement>
        <debut>2019-01-24</debut>
        <duree>30</duree>
        <veterinaire> 
          <nom>Hermione</nom>
          <prenom>Granger</prenom>
        </veterinaire>
        <prescription> 
          <medicament> 
            <nomMolecule>Stupefix</nomMolecule>
            <quantite>7</quantite>
          </medicament>
          <medicament> 
            <nomMolecule>Doloris</nomMolecule>
            <quantite>2</quantite>
          </medicament>
        </prescription>
      </traitement>
    </traitements>
    ')
);
/
INSERT INTO Animal(id,nom,proprietaire,poids,taille,dateNaissance,espece,traitement) VALUES (
    id_animal_seq.NEXTVAL,'Bob',1,20,40,to_date('2013-12-15','yyyy-mm-dd'),'anaconda',
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
INSERT INTO Animal(id,nom,proprietaire,poids,taille,dateNaissance,espece) VALUES (id_animal_seq.NEXTVAL,'Margerite',1,600,80,to_date('2018-12-15','yyyy-mm-dd'),'vache');
/