CREATE TYPE TYP_VETERINAIRE AS OBJECT
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

)
/
CREATE TYPE TYP_MEDICAMENT AS OBJECT
(
  nomMolecule VARCHAR2(20)
);
/
CREATE TYPE LISTE_MEDICAMENTS AS TABLE OF TYP_MEDICAMENT;
/
CREATE TYPE TYP_TRAITEMENT AS OBJECT
(
  veterinaire TYP_VETERINAIRE,
  debut       DATE,
  duree       NUMBER(2),
  medicament  TYP_MEDICAMENT
);
/
CREATE TYPE TYP_ANIMAL AS OBJECT
(
  nom           VARCHAR2(20),
  poids         FLOAT,
  taille        FLOAT,
  dateNaissance DATE,
  espece        TYP_ESPECE,
  traitement    TYP_TRAITEMENT
);
/
CREATE TYPE LISTE_ANIMAUX AS TABLE OF TYP_ANIMAL;
/
CREATE TABLE CLIENT
(
  nom           VARCHAR2(20) NOT NULL,
  prenom        VARCHAR2(20) NOT NULL,
  dateNaissance DATE         NOT NULL,
  adresse       VARCHAR2(20) NOT NULL,
  numero        VARCHAR2(10) NOT NULL,
  animal        LISTE_ANIMAUX,
  UNIQUE (nom, prenom, dateNaissance),
  CONSTRAINT ck_phone
    CHECK (numero LIKE '[0-9]{10}')
)
NESTED TABLE animal STORE AS liste_animaux;