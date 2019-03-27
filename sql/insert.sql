Insertions

A corriger :

- il manque les point virgule

/* 1 <Floriane>  
A voir pour l'insertion avec foreign key car pas sur d'etre bon  
et pas besoin d'id car incrémenté automatiqument normalement */

INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Guerin','Maurice','1940-04-04','Saint-Andre','0643564829');
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Allaire','Laurence','1969-02-04','Saint-Molf','0761444829');
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Danilo','Melani','1999-04-15','Guerande','0643784890');
INSERT INTO client(nom,prenom,dateNaissance,adresse,numero) VALUES('Halgand','Melanie','1998-01-01','Herbignac','0656764829');

INSERT INTO animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Filou','1','500','45','2000-04-18','chat');
INSERT INTO animal(nom,proprietaire,poids,taille,espece) VALUES ('Izao','3','700','55','chien');
INSERT INTO animal(nom,proprietaire,poids,taille,espece) VALUES ('Cristale','4','800','60','chien');
INSERT INTO animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Sunny','2','600','40','2014-12-15','chien');

/* 2 <William> */


INSERT INTO veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Harry','Mason','1970-02-03','Saint-Andre','0643558829', 'mammifere');
INSERT INTO veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Cybil','Bennett','1980-15-08','Saint-Andre','0666564529', 'reptile');
INSERT INTO veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Alessa','Gillespie','1960-18-08','Saint-Brieux','0662565859', 'oiseau');
INSERT INTO veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Michael','Kaufmann','1965-05-23','Saint-Ange','0646564595', 'reptile');
INSERT INTO veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('James','Sunderland','1975-06-16','Saint-Mils','0648264459', 'oiseau');

INSERT INTO Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Lisa','Garland','1983-04-04','Saint-Jean','0644664456', 'oiseau');
INSERT INTO Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Douglas','Cartland','1972-11-10','Saint-Mils','0690564782', 'mammifere');
INSERT INTO Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Claudia','Wolf','1987-03-01','Saint-Andre','0641364168', 'reptile');
INSERT INTO Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Vincent','Smith','1988-07-12','Saint-Ange','0646564260', 'oiseau');
INSERT INTO Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Eileen','Galvin','1982-05-14','Saint-Ange','0645964135', 'mammifere');

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

INSERT INTO Medicament(nomMolecule,description) VALUES('MILBEMAX Comprimés Chiens','Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens');
INSERT INTO Medicament(nomMolecule,description) VALUES('ANIMAZEN','Aliment complémentaire pour les périodes de stress chez les chiens, chats.');
INSERT INTO Medicament(nomMolecule,description) VALUES('OCEVIT','Aliment complémentaire chez les oiseaux de cage et de voliere');

INSERT INTO MedicamentAutorise(medicament,espece) VALUES('MILBEMAX Comprimés Chiens','chien');
INSERT INTO MedicamentAutorise(medicament,espece) VALUES('ANIMAZEN','chien');
INSERT INTO MedicamentAutorise(medicament,espece) VALUES('ANIMAZEN','chat');
INSERT INTO MedicamentAutorise(medicament,espece) VALUES('OCEVIT','oiseau');

5 <En groupe mercredi>

Traitement
Prescription
