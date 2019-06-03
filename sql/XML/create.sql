/*------------------------------------------------------------*/
/*------------------ Les types d'annimaux :-------------------*/
/*------------------------------------------------------------*/

CREATE TABLE ClasseEspece (
    nom VARCHAR(50), 
    PRIMARY KEY (nom)
);
/

CREATE TABLE Espece (
    nom VARCHAR(50) PRIMARY KEY,
    classe VARCHAR(50) NOT NULL,
    FOREIGN KEY(classe) REFERENCES ClasseEspece(nom)
);
/

/*------------------------------------------------------------*/
/*---------------------- Les Clients :------------------------*/
/*------------------------------------------------------------*/
CREATE TABLE Client (
    id INTEGER,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    dateNaissance DATE NOT NULL,
    adresse VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE (nom,prenom,dateNaissance),
    CONSTRAINT ck_phone
        CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))
);
/


/*------------------------------------------------------------*/
/*---------------------- Les animaux :------------------------*/
/*------------------------------------------------------------*/

CREATE TABLE Animal (
    id INTEGER,
    nom VARCHAR(50) NOT NULL,
    proprietaire INTEGER NOT NULL,
    poids FLOAT NOT NULL,
    taille FLOAT NOT NULL,
    dateNaissance DATE,
    espece VARCHAR NOT NULL,
    traitement XMLType,
    PRIMARY KEY (id),
    FOREIGN KEY (proprietaire) REFERENCES Client(id), 
    FOREIGN KEY (espece) REFERENCES Espece(nom) ,
    UNIQUE (nom,proprietaire),
    CONSTRAINT chk_poids CHECK (poids > 0),
    CONSTRAINT chk_taille CHECK (taille > 0)
);
/
-----------------------------------------------------------------------
-- Il est possible pour un animal de ne pas recevoir de traitements  --
-----------------------------------------------------------------------


