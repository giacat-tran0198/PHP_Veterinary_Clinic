-- Classe ClasseEspece
CREATE OR REPLACE TYPE typ_ClasseEspece AS OBJECT  (
  nom VARCHAR2(20)
);
/

CREATE TABLE ClasseEspece OF typ_ClasseEspece (
  PRIMARY KEY (nom)
);
/

-- Classe Espece

CREATE OR REPLACE TYPE  typ_Espece AS OBJECT (
  nom VARCHAR2(20),
  classe REF typ_ClasseEspece
);
/


CREATE OR REPLACE TYPE  ref_Espece AS OBJECT (
  refEspece REF typ_Espece
);
/


CREATE OR REPLACE TYPE liste_ref_Espece AS TABLE OF ref_Espece;
/
CREATE TABLE Espece OF typ_Espece (
    PRIMARY KEY (nom),
    SCOPE FOR (classe) IS ClasseEspece
);
/

-- Classe Vétérinaire
CREATE OR REPLACE TYPE typ_veterinaire AS OBJECT (
  id NUMBER(2),
  nom           VARCHAR2(50),
  prenom        VARCHAR2(50),
  dateNaissance DATE ,
  adresse       VARCHAR(50),
  numero        VARCHAR2(10),
  specialite REF typ_ClasseEspece
);
/

CREATE TABLE Veterinaire OF typ_veterinaire (
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



CREATE OR REPLACE TYPE typ_assistant AS OBJECT (
  id NUMBER(2),
  nom           VARCHAR2(50),
  prenom        VARCHAR2(50),
  dateNaissance DATE ,
  adresse       VARCHAR(50),
  numero        VARCHAR2(10),
  specialite REF typ_ClasseEspece
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
CREATE OR REPLACE TYPE typ_medicament AS OBJECT (
  nomMolecule     VARCHAR2(20),
  descriptionMed  VARCHAR2(255),
  autorisation liste_ref_Espece
);
/

CREATE TABLE Medicament OF typ_medicament (
  PRIMARY KEY (nomMolecule),
  descriptionMed NOT NULL
  
)NESTED TABLE autorisation STORE AS nt_autorisation;
/


--CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament;
--/

CREATE OR REPLACE TYPE typ_Prescription AS OBJECT (

    med REF typ_medicament,
    quantite INTEGER

);
/

CREATE OR REPLACE TYPE col_Prescription AS TABLE OF typ_Prescription;
/

CREATE OR REPLACE TYPE typ_traitement AS OBJECT
(
  id NUMBER(2),
  veterinaire REF typ_veterinaire,
  debut       DATE,
  duree       NUMBER(2),
  prescriptions col_Prescription
);
/

CREATE TABLE Traitement OF typ_traitement (

    PRIMARY KEY (id),
    debut NOT NULL,
    duree NOT NULL,
    CHECK (duree>0),
    SCOPE FOR (veterinaire) IS Veterinaire


)NESTED TABLE prescriptions STORE AS nt_prescriptions;
/

--CREATE OR REPLACE TYPE liste_traitement AS TABLE OF typ_traitement;
--/

CREATE OR REPLACE TYPE ref_Traitement AS OBJECT (ref_Traitement REF typ_traitement);
/

CREATE OR REPLACE TYPE liste_ref_Traitement AS TABLE OF ref_Traitement;
/


CREATE OR REPLACE TYPE typ_Animal AS OBJECT
(
  nom           VARCHAR2(20),
  poids         FLOAT,
  taille        FLOAT,
  dateNaissance DATE,
  espece        REF typ_Espece,
  traitement    liste_ref_Traitement
  
);
/



CREATE TABLE Animal OF typ_Animal
(
  nom           NOT NULL,
  poids         NOT NULL,
  taille        NOT NULL,
  espece        NOT NULL,


 SCOPE FOR (espece) IS Espece,
 CHECK (poids>0 AND taille>0) 
)NESTED TABLE traitement STORE AS nt_traitements;
/ 

-- Class Client

CREATE OR REPLACE TYPE typ_client AS OBJECT (
  id            NUMBER(2),
  nom           VARCHAR2(20),
  prenom        VARCHAR2(20),
  dateNaissance DATE,
  adresse       VARCHAR2(20),
  numero        VARCHAR2(10)
);
/

CREATE TABLE Client OF typ_client (
  PRIMARY KEY (id),
  nom           NOT NULL,
  prenom        NOT NULL,
  adresse       NOT NULL,
  dateNaissance NOT NULL,
  numero        NOT NULL,
  UNIQUE (nom, prenom, dateNaissance),
  CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))
);
/