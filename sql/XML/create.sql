/*------------------------------------------------------------*/
/*------------------ Les types d'annimaux :-------------------*/
/*------------------------------------------------------------*/

CREATE TABLE ClasseEspece (
    nom VARCHAR2(50),
    PRIMARY KEY (nom)
);
/

CREATE TABLE Espece (
    nom VARCHAR2(50) PRIMARY KEY,
    classe VARCHAR2(50) NOT NULL,
    FOREIGN KEY(classe) REFERENCES ClasseEspece(nom)
);
/

/*------------------------------------------------------------*/
/*---------------------- Les Clients :------------------------*/
/*------------------------------------------------------------*/
CREATE TABLE Client (
    id INTEGER,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    dateNaissance DATE NOT NULL,
    adresse VARCHAR2(50) NOT NULL,
    numero VARCHAR2(10) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE (nom,prenom,dateNaissance),
    CHECK (REGEXP_LIKE(numero, '^0\d{9}$'))
);
/


/*------------------------------------------------------------*/
/*---------------------- Les animaux :------------------------*/
/*------------------------------------------------------------*/

CREATE TABLE Animal (
    id INTEGER,
    nom VARCHAR2(50) NOT NULL,
    proprietaire INTEGER NOT NULL,
    poids FLOAT NOT NULL,
    taille FLOAT NOT NULL,
    dateNaissance DATE,
    espece VARCHAR2(50) NOT NULL,
    traitement XMLType,
    PRIMARY KEY (id),
    FOREIGN KEY (proprietaire) REFERENCES Client(id),
    FOREIGN KEY (espece) REFERENCES Espece(nom) ,
    UNIQUE (nom,proprietaire),
    CHECK (poids > 0 AND taille > 0)
);
/
-----------------------------------------------------------------------
-- Il est possible pour un animal de ne pas recevoir de traitements  --
-----------------------------------------------------------------------
