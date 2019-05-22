--INSERT INTO VETERINAIRE
--VALUES (TYP_VETERINAIRE(1, 'Harry'));
--INSERT INTO VETERINAIRE
--VALUES (TYP_VETERINAIRE(2, 'Cybil'));
--INSERT INTO VETERINAIRE
--VALUES (TYP_VETERINAIRE(3, 'Alessa'));
--INSERT INTO VETERINAIRE
--VALUES (TYP_VETERINAIRE(4, 'Michael'));
--INSERT INTO VETERINAIRE
--VALUES (TYP_VETERINAIRE(5, 'James'));

-- Insert ClasseEspece 
INSERT INTO ClasseEspece VALUES (nom) VALUES ('mammifere'); 
INSERT INTO ClasseEspece VALUES (nom) VALUES ('reptile'); 
INSERT INTO ClasseEspece VALUES (nom) VALUES ('oiseau'); 

-- Insert Espece 
INSERT INTO Espece (nom,espece) VALUES ('chat','mammifere'); 
INSERT INTO Espece (nom,espece) VALUES ('chien','mammifere'); 
INSERT INTO Espece (nom,espece) VALUES ('vache','mammifere'); 
INSERT INTO Espece (nom,espece) VALUES ('anaconda','reptile'); 
INSERT INTO Espece (nom,espece) VALUES ('perroquet','oiseau'); 


-- Insert Client
CREATE SEQUENCE id_client_seq START WITH 1 ; 
/
INSERT INTO Client (id,nom,prenom,dateNaissance,adresse,numero) VALUES (id_client_seq.NEXTVAL,'Guerin', 'Maurice', to_date('1940-04-04', 'yyyy-mm-dd'), 'Saint-Andre', '0643564829') ; 
/
INSERT INTO Client (id,nom,prenom,dateNaissance,adresse,numero) VALUES (id_client_seq.NEXTVAL,'Allaire', 'Laurence', to_date('1969-02-04', 'yyyy-mm-dd'), 'Saint-Molf', '0761444829'); 
/
INSERT INTO Client (id,nom,prenom,dateNaissance,adresse,numero) VALUES (id_client_seq.NEXTVAL,'Danilo', 'Melani', to_date('1999-04-15', 'yyyy-mm-dd'), 'Guerande', '0643784890'); 
/
INSERT INTO Client (id,nom,prenom,dateNaissance,adresse,numero) VALUES (id_client_seq.NEXTVAL,'Halgand', 'Melanie', to_date('1998-01-01', 'yyyy-mm-dd'), 'Herbignac', '0656764829'); 
/

-- Insert Animaux 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (1,'Filou', 5, 45, NULL,'chien',
    LISTE_TRAITEMENTS(
        TYP_TRAITEMENT(
            TYP_VETERINAIRE(1, 'Harry'),
            to_date('2019-08-15', 'yyyy-mm-dd'), 10,
            LISTE_MEDICAMENT(
                TYP_MEDICAMENT('ANIMAZEN')
              )
          )
      )
); 
/
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (1,'Bob', 20, 40, to_date('2013-12-15', 'yyyy-mm-dd'),'anaconda',
    LISTE_TRAITEMENTS(
        TYP_TRAITEMENT(
            TYP_VETERINAIRE(2, 'Cybil'),
            to_date('2019-07-5', 'yyyy-mm-dd'), 40,
            LISTE_MEDICAMENT(
                TYP_MEDICAMENT('VITA REPTILE'),
                TYP_MEDICAMENT('CALCIUM REPTILE')
              )
          )
    )
); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (1,'Margerite', 600, 80, to_date('2018-12-15', 'yyyy-mm-dd'),'vache',
    LISTE_TRAITEMENTS(
        TYP_TRAITEMENT(
            TYP_VETERINAIRE(3, 'Alessa'),
            to_date('2019-10-10', 'yyyy-mm-dd'), 5,
            LISTE_MEDICAMENT(
                TYP_MEDICAMENT('ACTICARP'),
                TYP_MEDICAMENT('ACTIDRALYTE')
            )
        )
    )
); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (2,'Sunny', 6, 40, to_date('2014-12-15', 'yyyy-mm-dd'),'chien',NULL); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (3,'Izao', 7, 55, NULL,'chien',NULL); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,liste_traitements) VALUES (4,'Cristale', 8, 60, NULL,'chien',
    LISTE_TRAITEMENTS(
        TYP_TRAITEMENT(
            TYP_VETERINAIRE(1, 'Harry'),
            to_date('2019-09-10', 'yyyy-mm-dd'), 5,
            LISTE_MEDICAMENT(
                TYP_MEDICAMENT('MILBEMAX')
              )
          )
    )
); 
/ 