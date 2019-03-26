Creation des tables

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

/* 2 <PRENOM> */

Veterinaire
Assistant

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

Autorisation Medicament
Traitement
Prescription
