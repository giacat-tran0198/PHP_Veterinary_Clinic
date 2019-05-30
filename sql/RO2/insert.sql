-- Insert ClasseEspece
INSERT INTO ClasseEspece VALUES ('mammifere');
/
INSERT INTO ClasseEspece VALUES ('reptile');
/
INSERT INTO ClasseEspece VALUES ('oiseau');
/

-- Insert Espece
DECLARE
  refClasse1 REF TYP_CLASSEESPECE;
  refClasse2 REF TYP_CLASSEESPECE;
  refClasse3 REF TYP_CLASSEESPECE;
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
CREATE SEQUENCE id_vet_seq START WITH 1;
/
CREATE SEQUENCE id_assist_seq START WITH 1;
/
DECLARE
  refClasse1 REF TYP_CLASSEESPECE;
  refClasse2 REF TYP_CLASSEESPECE;
  refClasse3 REF TYP_CLASSEESPECE;
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

  INSERT INTO Veterinaire
  VALUES (id_vet_seq.NEXTVAL, 'Harry', 'Mason', to_date('1970-02-03', 'yyyy-mm-dd'), 'Saint-Andre', '0643558829',
          refClasse1);
  INSERT INTO Veterinaire
  VALUES (id_vet_seq.NEXTVAL, 'Cybil', 'Bennett', to_date('1980-12-08', 'yyyy-mm-dd'), 'Saint-Andre', '0666564529',
          refClasse2);
  INSERT INTO Veterinaire
  VALUES (id_vet_seq.NEXTVAL, 'Alessa', 'Gillespie', to_date('1960-10-08', 'yyyy-mm-dd'), 'Saint-Brieux', '0662565859',
          refClasse3);
  INSERT INTO Veterinaire
  VALUES (id_vet_seq.NEXTVAL, 'Michael', 'Kaufmann', to_date('1965-05-23', 'yyyy-mm-dd'), 'Saint-Ange', '0646564595',
          refClasse2);
  INSERT INTO Veterinaire
  VALUES (id_vet_seq.NEXTVAL, 'James', 'Sunderland', to_date('1975-06-16', 'yyyy-mm-dd'), 'Saint-Mils', '0648264459',
          refClasse3);
  INSERT INTO Assistant
  VALUES (id_assist_seq.NEXTVAL, 'Lisa', 'Garland', to_date('1983-04-04', 'yyyy-mm-dd'), 'Saint-Jean', '0644664456',
          refClasse3);
  INSERT INTO Assistant
  VALUES (id_assist_seq.NEXTVAL, 'Douglas', 'Cartland', to_date('1972-11-10', 'yyyy-mm-dd'), 'Saint-Mils', '0690564782',
          refClasse1);
  INSERT INTO Assistant
  VALUES (id_assist_seq.NEXTVAL, 'Claudia', 'Wolf', to_date('1987-03-01', 'yyyy-mm-dd'), 'Saint-Andre', '0641364168',
          refClasse2);
  INSERT INTO Assistant
  VALUES (id_assist_seq.NEXTVAL, 'Vincent', 'Smith', to_date('1988-07-12', 'yyyy-mm-dd'), 'Saint-Ange', '0646564260',
          refClasse3);
  INSERT INTO Assistant
  VALUES (id_assist_seq.NEXTVAL, 'Eileen', 'Galvin', to_date('1982-05-14', 'yyyy-mm-dd'), 'Saint-Ange', '0645964135',
          refClasse1);
END;
/


-- Insert Medicament

DECLARE
  refE1 REF TYP_ESPECE;
  refE2 REF TYP_ESPECE;
  refE3 REF TYP_ESPECE;
  refE4 REF TYP_ESPECE;
  refE5 REF TYP_ESPECE;
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


  INSERT INTO Medicament
  VALUES ('MILBEMAX',
          'Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens',
          liste_ref_Espece(ref_Espece(refE3)));

  INSERT INTO Medicament
  VALUES ('ANIMAZEN',
          'Aliment complémentaire pour les périodes de stress chez les chiens, chats.',
          liste_ref_Espece(ref_Espece(refE3), ref_Espece(refE4)));

  INSERT INTO Medicament
  VALUES ('OCEVIT',
          'Aliment complémentaire chez les oiseaux de cage et de voliere',
          liste_ref_Espece(ref_Espece(refE5)));

  INSERT INTO Medicament
  VALUES ('ACTIDRALYTE',
          'Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets',
          liste_ref_Espece(ref_Espece(refE1)));

  INSERT INTO Medicament
  VALUES ('ACTICARP',
          'Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins',
          liste_ref_Espece(ref_Espece(refE1)));

  INSERT INTO Medicament
  VALUES ('CALCIUM REPTILE',
          'Aliment complémentaire pour assurer la solidité de la carapace et du squelette chez les reptiles',
          liste_ref_Espece(ref_Espece(refE2)));

  INSERT INTO Medicament
  VALUES ('VITA REPTILE',
          'Aliment complémentaire riche en vitamine pour reptiles',
          liste_ref_Espece(ref_Espece(refE2)));


END;
/

-- INSERT TRAITEMENTS

CREATE SEQUENCE id_traitement_seq START WITH 1;
/

DECLARE
  refM1 REF TYP_MEDICAMENT;
  refM2 REF TYP_MEDICAMENT;
  refM3 REF TYP_MEDICAMENT;
  refM4 REF TYP_MEDICAMENT;
  refM5 REF TYP_MEDICAMENT;
  refM6 REF TYP_MEDICAMENT;
  refM7 REF TYP_MEDICAMENT;
  refV1 REF TYP_VETERINAIRE;
  refV2 REF TYP_VETERINAIRE;
  refV3 REF TYP_VETERINAIRE;
  refV4 REF TYP_VETERINAIRE;
  refV5 REF TYP_VETERINAIRE;
BEGIN
  SELECT REF(m) INTO refM1
  FROM Medicament m
  WHERE m.nomMolecule = 'ACTICARP';
  SELECT REF(m) INTO refM2
  FROM Medicament m
  WHERE m.nomMolecule = 'ACTIDRALYTE';
  SELECT REF(m) INTO refM3
  FROM Medicament m
  WHERE m.nomMolecule = 'CALCIUM REPTILE';
  SELECT REF(m) INTO refM4
  FROM Medicament m
  WHERE m.nomMolecule = 'VITA REPTILE';
  SELECT REF(m) INTO refM5
  FROM Medicament m
  WHERE m.nomMolecule = 'MILBEMAX';
  SELECT REF(m) INTO refM6
  FROM Medicament m
  WHERE m.nomMolecule = 'ANIMAZEN';
  SELECT REF(m) INTO refM7
  FROM Medicament m
  WHERE m.nomMolecule = 'OCEVIT';
  SELECT REF(v) INTO refV1
  FROM Veterinaire v
  WHERE v.nom = 'Harry';
  SELECT REF(v) INTO refV2
  FROM Veterinaire v
  WHERE v.nom = 'Cybil';
  SELECT REF(v) INTO refV3
  FROM Veterinaire v
  WHERE v.nom = 'Alessa';

  INSERT INTO Traitement (id, veterinaire, debut, duree, prescriptions)
  VALUES (id_traitement_seq.NEXTVAL, refV1, to_date('2019-07-5', 'yyyy-mm-dd'), 40,
          col_Prescription(
              typ_Prescription(
                  refM4, 5
                ),
              typ_Prescription(
                  refM3, 24
                )));


  INSERT INTO Traitement
  VALUES (id_traitement_seq.NEXTVAL, refV2, to_date('2019-09-10', 'yyyy-mm-dd'), 5,
          col_Prescription(
              typ_Prescription(
                  refM5, 12
                )
            ));
  INSERT INTO Traitement
  VALUES (id_traitement_seq.NEXTVAL, refV3, to_date('2019-10-10', 'yyyy-mm-dd'), 5,
          col_Prescription(
              typ_Prescription(
                  refM1, 80
                ),
              typ_Prescription(
                  refM2, 20
                )
            ));
END;
/


-- INSERT ANIMAL
DECLARE
  refT1 REF TYP_TRAITEMENT;
  refT2 REF TYP_TRAITEMENT;
  refT3 REF TYP_TRAITEMENT;
  refE1 REF TYP_ESPECE;
  refE2 REF TYP_ESPECE;
  refE3 REF TYP_ESPECE;
  refE4 REF TYP_ESPECE;

BEGIN
  SELECT REF(t) INTO refT1
  FROM Traitement t
  WHERE t.id = 1;
  SELECT REF(t) INTO refT2
  FROM Traitement t
  WHERE t.id = 2;
  SELECT REF(t) INTO refT3
  FROM Traitement t
  WHERE t.id = 3;
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

  INSERT INTO Animal
  VALUES ('Filou', 5, 45, NULL, refE4,
          liste_ref_Traitement(
              ref_Traitement(refT3)
            ));
  INSERT INTO Animal
  VALUES ('Bob', 20, 40, to_date('2013-12-15', 'yyyy-mm-dd'), refE2,
          liste_ref_traitement(ref_Traitement(refT1)));
  INSERT INTO Animal
  VALUES ('Margerite', 600, 80, to_date('2018-12-15', 'yyyy-mm-dd'), refE1,
          liste_ref_traitement(ref_Traitement(refT3)
            ));
  INSERT INTO Animal VALUES ('Sunny', 6, 40, to_date('2014-12-15', 'yyyy-mm-dd'), refE3, NULL);
  INSERT INTO Animal VALUES ('Izao', 7, 55, NULL, refE3, NULL);
  INSERT INTO Animal
  VALUES ('Cristale', 8, 60, NULL, refE3,
          liste_ref_traitement(ref_Traitement(refT2)
            ));

END;
/
-- Insert Client
CREATE SEQUENCE id_client_seq START WITH 1;
/

DECLARE
  refA1 REF TYP_ANIMAL;
  refA2 REF TYP_ANIMAL;
  refA3 REF TYP_ANIMAL;
  refA4 REF TYP_ANIMAL;
  refA5 REF TYP_ANIMAL;
  refA6 REF TYP_ANIMAL;
BEGIN
  SELECT REF(a) INTO refA1
  FROM Animal a
  WHERE a.nom = 'Filou'
    AND a.espece.nom = 'chat';
  SELECT REF(a) INTO refA2
  FROM Animal a
  WHERE a.nom = 'Bob'
    AND a.espece.nom = 'anaconda';
  SELECT REF(a) INTO refA3
  FROM Animal a
  WHERE a.nom = 'Margerite'
    AND a.espece.nom = 'vache';
  SELECT REF(a) INTO refA4
  FROM Animal a
  WHERE a.nom = 'Sunny'
    AND a.espece.nom = 'chien';
  SELECT REF(a) INTO refA5
  FROM Animal a
  WHERE a.nom = 'Izao'
    AND a.espece.nom = 'chien';
  SELECT REF(a) INTO refA6
  FROM Animal a
  WHERE a.nom = 'Cristale'
    AND a.espece.nom = 'chien';

  INSERT INTO Client
  VALUES (id_client_seq.NEXTVAL, 'Guerin', 'Maurice', to_date('1940-04-04', 'yyyy-mm-dd'), 'Saint-Andre', '0643564829',
          liste_ref_Animal(ref_Animal(refA1), ref_Animal(refA2), ref_Animal(refA3)));
  INSERT INTO Client
  VALUES (id_client_seq.NEXTVAL, 'Allaire', 'Laurence', to_date('1969-02-04', 'yyyy-mm-dd'), 'Saint-Molf', '0761444829',
          liste_ref_Animal(ref_Animal(refA4)));
  INSERT INTO Client
  VALUES (id_client_seq.NEXTVAL, 'Danilo', 'Melani', to_date('1999-04-15', 'yyyy-mm-dd'), 'Guerande', '0643784890',
          liste_ref_Animal(ref_Animal(refA5)));
  INSERT INTO Client
  VALUES (id_client_seq.NEXTVAL, 'Halgand', 'Melanie', to_date('1998-01-01', 'yyyy-mm-dd'), 'Herbignac', '0656764829',
          liste_ref_Animal(ref_Animal(refA6)));
END;
/