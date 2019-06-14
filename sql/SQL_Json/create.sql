CREATE TABLE ClasseEspece (
    nom VARCHAR(50), 
    PRIMARY KEY (nom)
);

CREATE TABLE Espece (
    nom VARCHAR(50) PRIMARY KEY,
    classe VARCHAR(50) NOT NULL,
    FOREIGN KEY(classe) REFERENCES ClasseEspece(nom)
);

CREATE TABLE Client (
    id SERIAL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    dateNaissance DATE NOT NULL,
    adresse VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE (nom,prenom,dateNaissance),
    CONSTRAINT ck_phone
        CHECK(numero ~ '[0-9]{10}')
);

CREATE TABLE Animal (
    id SERIAL,
    nom VARCHAR(50) NOT NULL,
    proprietaire INTEGER NOT NULL,
    poids FLOAT NOT NULL,
    taille FLOAT NOT NULL,
    dateNaissance DATE,
    espece VARCHAR NOT NULL,
    traitement JSON , 
    PRIMARY KEY (id),
    FOREIGN KEY (proprietaire) REFERENCES Client(id), 
    FOREIGN KEY (espece) REFERENCES Espece(nom) ,
    UNIQUE (nom,proprietaire),
    CONSTRAINT chk_poids CHECK (poids > 0),
    CONSTRAINT chk_taille CHECK (taille > 0 )
);

