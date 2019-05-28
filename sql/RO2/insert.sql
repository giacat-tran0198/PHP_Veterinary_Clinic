-- Insert ClasseEspece 
INSERT INTO ClasseEspece VALUES ('mammifere');
/
INSERT INTO ClasseEspece VALUES ('reptile');
/
INSERT INTO ClasseEspece VALUES ('oiseau');
/

-- Insert Espece 
DECLARE
  refClasse1 REF typ_ClasseEspece;
  refClasse2 REF typ_ClasseEspece;
  refClasse3 REF typ_ClasseEspece;
  BEGIN
    SELECT REF(c) INTO refClasse1
    FROM ClasseEspece c
    WHERE c.nom = 'mammifere';
    SELECT REF(c) INTO refClasse2
    FROM ClasseEspece c
    WHERE c.nom = 'reptile';
    SELECT REF(c) INTO refClasse3
    FROM ClasseEspece c
    WHERE c.nom = 'oiseau';

    INSERT INTO Espece VALUES ('chat', refClasse1);
    INSERT INTO Espece VALUES ('chien', refClasse1);
    INSERT INTO Espece VALUES ('vache', refClasse1);
    INSERT INTO Espece VALUES ('anaconda', refClasse2);
    INSERT INTO Espece VALUES ('perroquet', refClasse3);
END;
/

-- Insert Veterinaire et Assistant
DECLARE
  refClasse1 REF typ_ClasseEspece;
  refClasse2 REF typ_ClasseEspece;
  refClasse3 REF typ_ClasseEspece;
  BEGIN
    SELECT REF(c) INTO refClasse1
    FROM ClasseEspece c
    WHERE c.nom = 'mammifere';
    SELECT REF(c) INTO refClasse2
    FROM ClasseEspece c
    WHERE c.nom = 'reptile';
    SELECT REF(c) INTO refClasse3
    FROM ClasseEspece c
    WHERE c.nom = 'oiseau';

    INSERT INTO Veterinaire VALUES('Harry','Mason',to_date('1970-02-03','yyyy-mm-dd'),'Saint-Andre','0643558829',refClasse1);
    INSERT INTO Veterinaire VALUES('Cybil','Bennett',to_date('1980-12-08','yyyy-mm-dd'),'Saint-Andre','0666564529',refClasse2);
    INSERT INTO Veterinaire VALUES('Alessa','Gillespie',to_date('1960-10-08','yyyy-mm-dd'),'Saint-Brieux','0662565859',refClasse3);
    INSERT INTO Veterinaire VALUES('Michael','Kaufmann',to_date('1965-05-23','yyyy-mm-dd'),'Saint-Ange','0646564595',refClasse2);
    INSERT INTO Veterinaire VALUES('James','Sunderland',to_date('1975-06-16','yyyy-mm-dd'),'Saint-Mils','0648264459',refClasse3);

    INSERT INTO Assistant VALUES('Lisa','Garland',to_date('1983-04-04','yyyy-mm-dd'),'Saint-Jean','0644664456', refClasse3);
    INSERT INTO Assistant VALUES('Douglas','Cartland',to_date('1972-11-10','yyyy-mm-dd'),'Saint-Mils','0690564782', refClasse1 );
    INSERT INTO Assistant VALUES('Claudia','Wolf',to_date('1987-03-01','yyyy-mm-dd'),'Saint-Andre','0641364168',refClasse2);
    INSERT INTO Assistant VALUES('Vincent','Smith',to_date('1988-07-12','yyyy-mm-dd'),'Saint-Ange','0646564260', refClasse3);
    INSERT INTO Assistant VALUES('Eileen','Galvin',to_date('1982-05-14','yyyy-mm-dd'),'Saint-Ange','0645964135',refClasse1);
END;


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

-- Insert Medicament
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('MILBEMAX','Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('ANIMAZEN','Aliment complémentaire pour les périodes de stress chez les chiens, chats.');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('OCEVIT','Aliment complémentaire chez les oiseaux de cage et de voliere');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('ACTIDRALYTE', 'Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('ACTICARP','Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('CALCIUM REPTILE','Aliment complémentaire pour assurer la solidité de la carapace et du squelette chez les reptiles');
/
INSERT INTO Medicament(nomMolecule,descriptionMed) VALUES('VITA REPTILE','Aliment complémentaire riche en vitamine pour reptiles');
/


-- Insert Autorisation
DECLARE
  refE1 REF typ_Espece;
  refE2 REF typ_Espece;
  refE3 REF typ_Espece;
  refE4 REF typ_Espece;
  refE5 REF typ_Espece;
  refM1 REF typ_medicament;
  refM2 REF typ_medicament;
  refM3 REF typ_medicament;
  refM4 REF typ_medicament;
  refM5 REF typ_medicament;
  refM6 REF typ_medicament;
  refM7 REF typ_medicament;
  BEGIN
    SELECT REF(e) INTO refE1
    FROM Espece e
    WHERE e.nom = 'vache';
    SELECT REF(e) INTO refE2
    FROM Espece e
    WHERE e.nom = 'anaconda';
    SELECT REF(e) INTO refE3
    FROM Espece e
    WHERE e.nom = 'chien';
    SELECT REF(e) INTO refE4
    FROM Espece e
    WHERE e.nom = 'chat';
    SELECT REF(e) INTO refE5
    FROM Espece e
    WHERE e.nom = 'perroquet';
    SELECT REF(m) INTO refM1
    FROM  Medicament m
    WHERE m.nomMolecule = 'ACTICARP';
    SELECT REF(m) INTO refM2
    FROM  Medicament m
    WHERE m.nomMolecule = 'ACTIDRALYTE';
    SELECT REF(m) INTO refM3
    FROM  Medicament m
    WHERE m.nomMolecule = 'CALCIUM REPTILE';
    SELECT REF(m) INTO refM4
    FROM  Medicament m
    WHERE m.nomMolecule = 'VITA REPTILE';
    SELECT REF(m) INTO refM5
    FROM  Medicament m
    WHERE m.nomMolecule = 'MILBEMAX';
    SELECT REF(m) INTO refM6
    FROM  Medicament m
    WHERE m.nomMolecule = 'ANIMAZEN';
    SELECT REF(m) INTO refM7
    FROM  Medicament m
    WHERE m.nomMolecule = 'OCEVIT';

    INSERT INTO Autorisation VALUES (refM1, refE1);
    INSERT INTO Autorisation VALUES (refM2, refE1);
    INSERT INTO Autorisation VALUES (refM3, refE2);
    INSERT INTO Autorisation VALUES (refM4, refE2);
    INSERT INTO Autorisation VALUES (refM5, refE3);
    INSERT INTO Autorisation VALUES (refM6, refE3);
    INSERT INTO Autorisation VALUES (refM6, refE4);
    INSERT INTO Autorisation VALUES (refM7, refE5);
END;
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
