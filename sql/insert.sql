Insertions

/* 1 <Floriane>  
A voir pour l'insertion avec foreign key car pas sur d'etre bon  
et pas besoin d'id car incrémenté automatiqument normalement */

INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Guerin','Maurice','1940-04-04','Saint-Andre','0643564829')
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Allaire','Laurence','1969-02-04','Saint-Molf','0761444829')
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Danilo','Melani','1999-04-15','Guerande','0643784890')
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Halgand','Melanie','1998-01-01','Herbignac','0656764829')

INSERT INTO animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Filou','1','500','45','2000-04-18','chat')
INSERT INTO animal(nom,proprietaire,poids,taille,espece) VALUES ('Izao','3','700','55','chien')
INSERT INTO animal(nom,proprietaire,poids,taille,espece) VALUES ('Cristale','4','800','60','chien')
INSERT INTO animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Sunny','2','600','40','2014-12-15','chien')

/* 2 <William> */

Insertion Vétérinaire / Assistant

/* 3 <ANNA> */

Insertion Espèce / Classe Espèce

INSERT INTO classeEspece(nom) VALUES('mammifere');
INSERT INTO classeEspece(nom) VALUES('reptile');
INSERT INTO classeEspece(nom) VALUES('oiseau');
INSERT INTO classeEspece(nom) VALUES('autre');

INSERT INTO espece (nom,classe) VALUES('chat','mammifere');
INSERT INTO espece (nom,classe) VALUES('chien','mammifere');
INSERT INTO espece (nom,classe) VALUES('anaconda','reptile');

/* 4 <Prenom> */ 

Insertion Medicament / Autorisation Medicament + insérer espèce + classe si non présent sur git


5 <En groupe mercredi>

Traitement
Prescription
