-- Insert ClasseEspece 
INSERT INTO ClasseEspece VALUES (nom) VALUES ('mammifere'); 
/
INSERT INTO ClasseEspece VALUES (nom) VALUES ('reptile'); 
/
INSERT INTO ClasseEspece VALUES (nom) VALUES ('oiseau'); 
/

-- Insert Espece 
INSERT INTO Espece (nom,classe) VALUES ('chat','mammifere'); 
/
INSERT INTO Espece (nom,classe) VALUES ('chien','mammifere'); 
/
INSERT INTO Espece (nom,classe) VALUES ('vache','mammifere'); 
/
INSERT INTO Espece (nom,classe) VALUES ('anaconda','reptile'); 
/
INSERT INTO Espece (nom,classe) VALUES ('perroquet','oiseau'); 
/


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
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (1,'Filou', 5, 45, NULL,'chien',
    liste_traitement(
        typ_traitement(
            typ_veterinaire('Harry'),
            to_date('2019-08-15', 'yyyy-mm-dd'), 10,
            liste_medicament(
                typ_medicament('ANIMAZEN',2)
              )
        ),
        typ_traitement(
            typ_veterinaire('Anna'),
            to_date('2019-06-15', 'yyyy-mm-dd'), 5,
            liste_medicament(
                typ_medicament('CHOURIX',20)
            )
        ) 
      )
); 
/
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (1,'Bob', 20, 40, to_date('2013-12-15', 'yyyy-mm-dd'),'anaconda',
    liste_traitement(
        typ_traitement(
            typ_veterinaire('Cybil'),
            to_date('2019-07-5', 'yyyy-mm-dd'), 40,
            liste_medicament(
                typ_medicament('VITA REPTILE',5),
                typ_medicament('CALCIUM REPTILE',24)
              )
          )
    )
); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (1,'Margerite', 600, 80, to_date('2018-12-15', 'yyyy-mm-dd'),'vache',
    liste_traitement(
        typ_traitement(
            typ_veterinaire('Alessa'),
            to_date('2019-10-10', 'yyyy-mm-dd'), 5,
            liste_medicament(
                typ_medicament('ACTICARP',80),
                typ_medicament('ACTIDRALYTE',20)
            )
        )
    )
); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (2,'Sunny', 6, 40, to_date('2014-12-15', 'yyyy-mm-dd'),'chien',NULL); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (3,'Izao', 7, 55, NULL,'chien',NULL); 
/ 
INSERT INTO Animal (proprietaire,nom,poids,taille,dateNaissance,espece,traitement) VALUES (4,'Cristale', 8, 60, NULL,'chien',
    liste_traitement(
        typ_traitement(
            typ_veterinaire('Harry'),
            to_date('2019-09-10', 'yyyy-mm-dd'), 5,
            liste_medicament(
                typ_medicament('MILBEMAX',12)
              )
          )
    )
); 
/ 