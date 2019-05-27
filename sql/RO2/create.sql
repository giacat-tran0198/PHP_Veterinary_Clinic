

-- Classe Vétérinaire
CREATE OR REPLACE TYPE typ_veterinaire AS OBJECT (
  nom           VARCHAR2(50),
  prenom        VARCHAR2(50),
  dateNaissance DATE , 
  adresse       VARCHAR(50), 
  numero        VARCHAR2(10) 
);
/

CREATE TABLE veterinaire OF typ_veterinaire ( 
  nom           NOT NULL ,
  prenom        NOT NULL ,
  dateNaissance NOT NULL ,
  adresse       NOT NULL ,
  numero        NOT NULL , 
  UNIQUE(nom,prenom,dateNaissance), 
  CONSTRAINT ck_phone
    CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))

)

-- Class Animal 
 



-- Class Client 

CREATE OR REPLACE TYPE typ_client AS OBJECT ( 
  nom VARCHAR2  VARCHAR2(20),
  nom           VARCHAR2(20),
  prenom        VARCHAR2(20), 
  dateNaissance DATE,         
  adresse       VARCHAR2(20), 
  numero        VARCHAR2(10)
); 
/ 

CREATE TABLE Client OF typ_client ( 
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
  nom VARCHAR2(20) PRIMARY KEY,
  classe REF typ_ClasseEspece 
);
/

CREATE TABLE Espece OF typ_Espece ( 
    PRIMARY KEY (nom), 
    SCOPE FOR (classe) IS ClasseEspece 
); 
/ 


-- Classe Medicament 
CREATE OR REPLACE TYPE typ_medicament AS OBJECT (
  nomMolecule     VARCHAR2(20),
  descriptionMed  VARCHAR2(255),
);
/

CREATE TABLE Medicament OF typ_medicament ( 
  PRIMARY KEY (nomMolecule), 
  descriptionMed NOT NULL , 
); 
/ 

-- Autorisation     
-- Problème avec l'unicité (medicament,espece) 
CREATE TABLE Autorisation (
  medicament REF typ_medicament , 
  espece     REF  typ_Espece , 
  SCOPE FOR (medicament) IS Medicament, 
  SCOPE FOR (espece) IS Espece 
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