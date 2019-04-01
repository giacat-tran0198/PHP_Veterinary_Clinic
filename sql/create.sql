/* Creation des tables */

/* Pas besoin de contraintes sur les dates : 
    CONSTRAINT chk_naissance 
        CHECK (dateNaissance <= NOW())
*/ 

CREATE SCHEMA Clinique ;

CREATE TABLE Clinique.ClasseEspece (
    nom VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Clinique.Espece (
    nom VARCHAR(50) PRIMARY KEY,
    classe VARCHAR(50) NOT NULL,
    FOREIGN KEY(classe) REFERENCES Clinique.ClasseEspece(nom)
);

CREATE TABLE Clinique.Client (
    id SERIAL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    dateNaissance DATE NOT NULL,
    adresse VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE (nom,prenom,dateNaissance),
    CONSTRAINT ck_phone
        CHECK(numero ~ '[0-9]{10}'),
);

CREATE TABLE Clinique.Animal (
    id SERIAL,
    nom VARCHAR(50) NOT NULL,
    proprietaire INTEGER NOT NULL,
    poids FLOAT NOT NULL,
    taille FLOAT NOT NULL,
    dateNaissance DATE,
    espece VARCHAR NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (espece) REFERENCES Clinique.Espece(nom) ,
    UNIQUE (nom,proprietaire),
    CONSTRAINT chk_poids CHECK (poids > 0),
    CONSTRAINT chk_taille CHECK (taille > 0 ),
);

CREATE TABLE Clinique.Veterinaire(
    id            SERIAL,
    nom           VARCHAR(50) NOT NULL,
    prenom        VARCHAR(50) NOT NULL,
    dateNaissance DATE        NOT NULL,
    adresse      VARCHAR(50) NOT NULL,
    numero        CHAR(10)    NOT NULL,
    specialite    VARCHAR(50),
    FOREIGN KEY (specialite) REFERENCES Clinique.ClasseEspece (nom),
    PRIMARY KEY (id),
    UNIQUE (nom, prenom, dateNaissance),
    CONSTRAINT ck_phone
        CHECK ( numero ~ '[0-9]{10}'),
);

CREATE TABLE Clinique.Assistant
(
    id            SERIAL,
    nom           VARCHAR(50) NOT NULL,
    prenom        VARCHAR(50) NOT NULL,
    dateNaissance DATE        NOT NULL,
    adresse      VARCHAR(50) NOT NULL,
    numero        CHAR(10)    NOT NULL,
    specialite    VARCHAR(50),
    FOREIGN KEY (specialite) REFERENCES Clinique.ClasseEspece (nom),
    PRIMARY KEY (id),
    UNIQUE (nom, prenom, dateNaissance),
    CONSTRAINT ck_phone
        CHECK ( numero ~ '[0-9]{10}'), 
);


CREATE TABLE Clinique.Medicament (
    nomMolecule VARCHAR(100) PRIMARY KEY,
    description TEXT NOT NULL
);


CREATE TABLE Clinique.AutorisationMedicament(
    medicament VARCHAR(100),
    espece VARCHAR(100),
    PRIMARY KEY(medicament, espece),
    FOREIGN KEY(medicament) REFERENCES Clinique.Medicament(nomMolecule),
    FOREIGN KEY(espece) REFERENCES Clinique.Espece(nom)
);

CREATE TABLE Clinique.Traitement (
    id SERIAL,
    debut DATE NOT NULL,
    animal INTEGER NOT NULL,
    duree INTEGER NOT NULL,
    veterinaire INTEGER NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(animal) REFERENCES Clinique.Animal(id),
    FOREIGN KEY(veterinaire) REFERENCES Clinique.Veterinaire(id),
    CONSTRAINT chk_duree CHECK (duree > 0),
);

CREATE TABLE Clinique.Prescription (
    medicament VARCHAR(100),
    traitement INTEGER,
    quantite INTEGER NOT NULL,
    PRIMARY KEY(medicament, traitement),
    FOREIGN KEY(medicament) REFERENCES Clinique.Medicament(nomMolecule),
    FOREIGN KEY(traitement) REFERENCES Clinique.Traitement(id),
    CONSTRAINT chk_quantite CHECK (quantite > 0)
);



/*------------------------------------------------------------*/
/*------------------ Réalisation de vues :--------------------*/ 
/*------------------------------------------------------------*/
CREATE VIEW Clinique.VPersonnelMedical (nom,prenom,dateNaissance,adresse,numero,specialite)
AS
SELECT V.nom,V.prenom,V.dateNaissance,V.adresse,V.numero,V.specialite FROM Clinique.Veterinaire V
UNION
SELECT A.nom,A.prenom,A.dateNaissance,A.adresse,A.numero,A.specialite FROM Clinique.Assistant A;
