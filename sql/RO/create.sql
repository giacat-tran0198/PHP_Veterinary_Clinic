CREATE OR REPLACE TYPE typ_veterinaire AS OBJECT
(
  id  NUMBER(2),
  nom VARCHAR2(20)
);
/
CREATE TABLE Espece
(
  nom VARCHAR2(50) PRIMARY KEY
);

CREATE TABLE ClasseEspece (

    nom VARCHAR2(50) PRIMARY KEY

);
/
CREATE OR REPLACE TYPE typ_medicament AS OBJECT
(
  nomMolecule VARCHAR2(20)
);
/
CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament;
/
CREATE OR REPLACE TYPE TYP_TRAITEMENT AS OBJECT
(
  veterinaire typ_veterinaire,
  debut       DATE,
  duree       NUMBER(2),
  medicament  liste_medicament
)
NESTED TABLE medicament STORE AS liste_med;

CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament;
/
CREATE OR REPLACE TYPE typ_animal AS OBJECT
(
  nom           VARCHAR2(20),
  poids         FLOAT,
  taille        FLOAT,
  dateNaissance DATE,
  espece        TYP_ESPECE,
  traitement    TYP_TRAITEMENT
);
/
CREATE OR REPLACE TYPE liste_animaux AS TABLE OF typ_animal;
/
CREATE TABLE CLIENT
(
  nom           VARCHAR2(20) NOT NULL,
  prenom        VARCHAR2(20) NOT NULL,
  dateNaissance DATE         NOT NULL,
  adresse       VARCHAR2(20) NOT NULL,
  numero        VARCHAR2(10) NOT NULL,
  animal        liste_animaux,
  UNIQUE (nom, prenom, dateNaissance),
  CONSTRAINT ck_phone
    CHECK (numero LIKE '[0-9]{10}')
)
NESTED TABLE animal STORE AS liste_animaux;