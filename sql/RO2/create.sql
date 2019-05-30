-- Classe ClasseEspece
CREATE OR REPLACE TYPE TYP_CLASSEESPECE AS OBJECT(
  nom VARCHAR2(20)
);
/

CREATE TABLE ClasseEspece OF TYP_CLASSEESPECE(
  PRIMARY KEY (nom)
);
/

-- Classe Espece

CREATE OR REPLACE TYPE TYP_ESPECE AS OBJECT(
  nom    VARCHAR2(20),
  classe REF TYP_CLASSEESPECE
);
/

CREATE OR REPLACE TYPE REF_ESPECE AS OBJECT(
  refEspece REF TYP_ESPECE
);
/

CREATE OR REPLACE TYPE LISTE_REF_ESPECE AS TABLE OF REF_ESPECE;
/
CREATE TABLE Espece OF TYP_ESPECE(
  PRIMARY KEY(nom),
  SCOPE FOR (classe) IS ClasseEspece
);
/

-- Classe Vétérinaire
CREATE OR REPLACE TYPE TYP_VETERINAIRE AS OBJECT(
  id            NUMBER(2),
  nom           VARCHAR2(50),
  prenom        VARCHAR2(50),
  dateNaissance DATE,
  adresse       VARCHAR(50),
  numero        VARCHAR2(10),
  specialite    REF TYP_CLASSEESPECE
);
/

CREATE TABLE Veterinaire OF TYP_VETERINAIRE(
  PRIMARY KEY  (ID),
  nom NOT NULL ,
  prenom NOT NULL ,
  dateNaissance NOT NULL ,
  adresse NOT NULL ,
  numero NOT NULL ,
  UNIQUE (nom,prenom,dateNaissance),
  CHECK (REGEXP_LIKE(numero, '^0\d{9}$')),
  SCOPE FOR (specialite) IS ClasseEspece
);
/

CREATE OR REPLACE TYPE TYP_ASSISTANT AS OBJECT(
  id            NUMBER(2),
  nom           VARCHAR2(50),
  prenom        VARCHAR2(50),
  dateNaissance DATE,
  adresse       VARCHAR(50),
  numero        VARCHAR2(10),
  specialite    REF TYP_CLASSEESPECE
);
/
CREATE TABLE Assistant OF typ_assistant (
  PRIMARY KEY(id),
  nom           NOT NULL ,
  prenom        NOT NULL ,
  dateNaissance NOT NULL ,
  adresse       NOT NULL ,
  numero        NOT NULL ,
  UNIQUE(nom,prenom,dateNaissance),
  CHECK (REGEXP_LIKE(numero, '^0\d{9}$')),

  SCOPE FOR (specialite) IS ClasseEspece

);
/

-- Classe Medicament
CREATE OR REPLACE TYPE TYP_MEDICAMENT AS OBJECT(
  nomMolecule    VARCHAR2(20),
  descriptionMed VARCHAR2(255),
  autorisation   LISTE_REF_ESPECE
);
/

CREATE TABLE Medicament OF TYP_MEDICAMENT(
  PRIMARY KEY  (nomMolecule),
  descriptionMed NOT NULL
)
NESTED TABLE autorisation STORE AS nt_autorisation;
/

--CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament;
--/

CREATE OR REPLACE TYPE TYP_PRESCRIPTION AS OBJECT(
  med      REF TYP_MEDICAMENT,
  quantite INTEGER
);
/

CREATE OR REPLACE TYPE COL_PRESCRIPTION AS TABLE OF TYP_PRESCRIPTION;
/

CREATE OR REPLACE TYPE TYP_TRAITEMENT AS OBJECT(
  id            NUMBER(2),
  veterinaire   REF TYP_VETERINAIRE,
  debut         DATE,
  duree         NUMBER(2),
  prescriptions COL_PRESCRIPTION
);
/

CREATE TABLE Traitement OF TYP_TRAITEMENT(
  PRIMARY KEY  (ID),
  debut NOT NULL,
  duree NOT NULL,
  CHECK (duree>0),
  SCOPE FOR (veterinaire) IS Veterinaire
)
NESTED TABLE prescriptions STORE AS nt_prescriptions;
/

--CREATE OR REPLACE TYPE liste_traitement AS TABLE OF typ_traitement;
--/

CREATE OR REPLACE TYPE REF_TRAITEMENT AS OBJECT(
  ref_Traitement REF TYP_TRAITEMENT
);
/

CREATE OR REPLACE TYPE LISTE_REF_TRAITEMENT AS TABLE OF REF_TRAITEMENT;
/

CREATE OR REPLACE TYPE TYP_ANIMAL AS OBJECT(
  nom           VARCHAR2(20),
  poids         FLOAT,
  taille        FLOAT,
  dateNaissance DATE,
  espece        REF TYP_ESPECE,
  traitement    LISTE_REF_TRAITEMENT

);
/

CREATE TABLE Animal OF TYP_ANIMAL(
  nom   NOT NULL ,
  poids NOT NULL,
  taille NOT NULL,
  espece NOT NULL,
  SCOPE FOR(espece) IS Espece,
  CHECK (poids>0 AND taille> 0)
)
NESTED TABLE traitement STORE AS nt_traitements;
/

-- Class Client

CREATE OR REPLACE TYPE REF_ANIMAL AS OBJECT(
  ref_Animal REF TYP_ANIMAL
);
/
CREATE OR REPLACE TYPE LISTE_REF_ANIMAL AS TABLE OF REF_ANIMAL;
/

CREATE OR REPLACE TYPE TYP_CLIENT AS OBJECT(
  id            NUMBER(2),
  nom           VARCHAR2(20),
  prenom        VARCHAR2(20),
  dateNaissance DATE,
  adresse       VARCHAR2(20),
  numero        VARCHAR2(10),
  animaux       LISTE_REF_ANIMAL

);
/

CREATE TABLE Client OF TYP_CLIENT(
  PRIMARY KEY (id),
  nom NOT NULL,
  prenom NOT NULL,
  adresse NOT NULL,
  dateNaissance NOT NULL,
  numero NOT NULL,
  UNIQUE (nom, prenom, dateNaissance),
  CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))
)
NESTED TABLE animaux STORE AS nt_animaux;
/