-- Liste des veterinaires 
CREATE OR REPLACE TYPE typ_veterinaire AS OBJECT
(
  id  NUMBER(2),
  nom VARCHAR2(20)
);
/

CREATE TABLE Veterinaire OF typ_veterinaire ; 
/ 

-- Liste des médicaaments 
CREATE OR REPLACE TYPE typ_medicament  AS OBJECT
(
  nomMolecule VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE liste_medicament AS TABLE OF typ_medicament ;
/

-- Liste des traitements suivis 
CREATE OR REPLACE TYPE typ_traitement AS OBJECT
(
  veterinaire typ_veterinaire,
  debut       DATE,
  duree       NUMBER(2),
  medicament  liste_medicament
);
/

-- Liste des epèces et classes d'annimaux 
CREATE OR REPLACE TYPE type_classe AS OBJECT 
( 
  nom VARCHAR2(50)
); 
/ 

CREATE TABLE Classe OF type_classe ; 
/ 


CREATE OR REPLACE TYPE type_espece AS OBJECT
( 
  nom VARCHAR2(20), 
  classe REF type_classe 
); 
/ 

CREATE TABLE Espece OF type_espece ; 
/ 


-- Listes d'annimaux 
CREATE TYPE typ_animal AS OBJECT
(
  nom           VARCHAR2(20),
  poids         FLOAT,
  taille        FLOAT,
  dateNaissance DATE,
  espece        REF type_espece, 
  traitement    typ_traitement
);
/

CREATE OR REPLACE TYPE liste_animaux AS TABLE OF typ_animal;
/



-- Client 
CREATE TABLE Client (
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
  NESTED TABLE animal STORE AS nt_liste_animaux ;
/ 

