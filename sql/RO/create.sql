CREATE OR REPLACE TYPE typ_veterinaire AS OBJECT
(
  nom VARCHAR2(20)
);
/

CREATE TABLE ClasseEspece (
    
    nom VARCHAR2(20) PRIMARY KEY
);
/

CREATE TABLE Espece
(
  nom VARCHAR2(20) PRIMARY KEY,
  classe VARCHAR2(20) REFERENCES ClasseEspece(nom)
);
/


CREATE OR REPLACE TYPE typ_medicament AS OBJECT
(
  nomMolecule VARCHAR2(20),
  quantite    NUMBER(2)
);
/


CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament;
/

CREATE OR REPLACE TYPE typ_traitement AS OBJECT
(
  veterinaire typ_veterinaire,
  debut       DATE,
  duree       NUMBER(2),
  medicament  liste_medicament
); 
/

CREATE OR REPLACE TYPE liste_traitement AS TABLE OF typ_traitement;
/


CREATE TABLE Client
(
  id            INTEGER PRIMARY KEY,
  nom           VARCHAR2(20) NOT NULL,
  prenom        VARCHAR2(20) NOT NULL,
  dateNaissance DATE         NOT NULL,
  adresse       VARCHAR2(20) NOT NULL,
  numero        VARCHAR2(10) NOT NULL,
  UNIQUE (nom, prenom, dateNaissance),
  CONSTRAINT ck_phone
    CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))
);
/



CREATE TABLE Animal
(
  proprietaire  INTEGER,
  nom           VARCHAR2(20),
  poids         FLOAT NOT NULL,
  taille        FLOAT NOT NULL,
  dateNaissance DATE,
  espece        VARCHAR2(50) NOT NULL,
  traitement    liste_traitement,
  PRIMARY KEY (proprietaire,nom), 
  FOREIGN KEY (proprietaire) REFERENCES Client(id),
  FOREIGN KEY (espece) REFERENCES Espece(nom), 
  CONSTRAINT ck_poids
    CHECK (poids>0), 
  CONSTRAINT ck_taille
    CHECK (taille>0)
)
  NESTED TABLE traitement STORE AS nt_liste_traitement(
  NESTED TABLE medicament STORE AS nt_liste_medicament);
/ 