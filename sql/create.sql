/*Creation des tables

A corriger :

- nom d'une table commence par une majuscule
- manque des virgules parfois
- vérifier que des types équivalents ont été mis à chaque fois (notamment pour les clefs étrangères), parfois les varchar n'ont pas de limite de caractères*/

/* 1 <Floriane> De plus correction du prof a faire ! */

CREATE TABLE client ( 
    id INTEGER AUTO_INCREMENT , 
    nom VARCHAR(50) NOT NULL , 
    prenom VARCHAR(50) NOT NULL , 
    dateNaissance DATE NOT NULL , 
    adresse VARCHAR(50) NOT NULL , 
    numero VARCHAR(10) NOT NULL , 
    PRIMARY KEY(id)
    UNIQUE (nom,prenom,dateNaissance), 
    CONSTRAINT ck_phone 
        CHECK(numero 
            LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) 
)

CREATE TABLE animal (
    id INTEGER AUTO_INCREMENT , 
    nom VARCHAR(50) NOT NULL, 
    proprietaire INTEGER NOT NULL, 
    poids FLOAT NOT NULL , 
    taille FLOAT NOT NULL , 
    dateNaissance DATE, 
    espece VARCHAR NOT NULL , 
    PRIMARY KEY (id), 
    UNIQUE (nom,proprietaire), 
    CONSTRAINT chk_poids CHECK (poids > 0)
    CONSTRAINT chk_taille CHECK (taille > 0 )
)

/* 2 <CAT> */
CREATE TABLE Veterinaire
(
  id            INTEGER AUTO_INCREMENT,
  nom           VARCHAR(50) NOT NULL,
  prenom        VARCHAR(50) NOT NULL,
  dateNaissance DATE        NOT NULL,
  adreesse      VARCHAR(50) NOT NULL,
  numero        CHAR(10)    NOT NULL,
  FOREIGN KEY (specialite) REFERENCES classeEspece (nom),
  PRIMARY KEY (id),
  UNIQUE (nom, prenom, dateNaissance),
  CONSTRAINT ck_phone
    CHECK ( numero LIKE ('0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
);
CREATE TABLE Assiant
(
  id            INTEGER AUTO_INCREMENT,
  nom           VARCHAR(50) NOT NULL,
  prenom        VARCHAR(50) NOT NULL,
  dateNaissance DATE        NOT NULL,
  adreesse      VARCHAR(50) NOT NULL,
  numero        CHAR(10)    NOT NULL,
  FOREIGN KEY (specialite) REFERENCES classeEspece (nom),
  PRIMARY KEY (id),
  UNIQUE (nom, prenom, dateNaissance),
  CONSTRAINT ck_phone
    CHECK ( numero LIKE ('0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
);

/* 3 <ANNA> */
Classe espèce
espèce
Medicament

CREATE TABLE classeEspece (

    nom VARCHAR PRIMARY KEY
);

CREATE TABLE espece (

    nom VARCHAR PRIMARY KEY,
    classe VARCHAR NOT NULL,
    FOREIGN KEY(classe) REFERENCES classeEspece(nom)
);

CREATE TABLE medicament (

    nomMolecule VARCHAR(100) PRIMARY KEY,
    description VARCHAR NOT NULL
);


/* 4 <WILLIAM> */ 

CREATE TABLE AutorisationMedicament (
    medicament VARCHAR(100),
    espece VARCHAR(100),
    PRIMARY KEY(medicament, espece),
    FOREIGN KEY(medicament) REFERENCES medicament(nomMolecule),
    FOREIGN KEY(espece) REFERENCES espece(nom)

);

CREATE TABLE Traitement (
    id INTEGER AUTO_INCREMENT, 
    debut DATE NOT NULL,
    animal INTEGER NOT NULL,
    duree INTEGER NOT NULL,
    veterinaire INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(animal) REFERENCES animal(id),
    FOREIGN KEY(veterinaire) REFERENCES veterinaire(id),
    CONSTRAINT chk_duree CHECK (duree > 0)
);

CREATE TABLE Prescription (
    medicament VARCHAR(100),
    traitement INTEGER,
    quantite INTEGER NOT NULL,
    PRIMARY KEY(medicament, traitement),
    FOREIGN KEY(medicament) REFERENCES medicament(nomMolecule),
    FOREIGN KEY(traitement) REFERENCES Traitement(id),
    CONSTRAINT chk_quantite CHECK (quantite > 0)
);
