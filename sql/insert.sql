# Insertions


INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Guerin','Maurice','1940-04-04','Saint-Andre','0643564829');
INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Allaire','Laurence','1969-02-04','Saint-Molf','0761444829');
INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Danilo','Melani','1999-04-15','Guerande','0643784890');
INSERT INTO Clinique.Client(nom,prenom,dateNaissance,adresse,numero) VALUES('Halgand','Melanie','1998-01-01','Herbignac','0656764829');

INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Filou','1','500','45','2000-04-18','chat');
INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,espece) VALUES ('Izao','3','700','55','chien');
INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,espece) VALUES ('Cristale','4','800','60','chien');
INSERT INTO Clinique.Animal(nom,proprietaire,poids,taille,dateNaissance,espece) VALUES ('Sunny','2','600','40','2014-12-15','chien');




INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Harry','Mason','1970-02-03','Saint-Andre','0643558829', 'mammifere');
INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Cybil','Bennett','1980-15-08','Saint-Andre','0666564529', 'reptile');
INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Alessa','Gillespie','1960-18-08','Saint-Brieux','0662565859', 'oiseau');
INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Michael','Kaufmann','1965-05-23','Saint-Ange','0646564595', 'reptile');
INSERT INTO Clinique.Veterinaire(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('James','Sunderland','1975-06-16','Saint-Mils','0648264459', 'oiseau');

INSERT INTO Clinique.Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Lisa','Garland','1983-04-04','Saint-Jean','0644664456', 'oiseau');
INSERT INTO Clinique.Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Douglas','Cartland','1972-11-10','Saint-Mils','0690564782', 'mammifere');
INSERT INTO Clinique.Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Claudia','Wolf','1987-03-01','Saint-Andre','0641364168', 'reptile');
INSERT INTO Clinique.Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Vincent','Smith','1988-07-12','Saint-Ange','0646564260', 'oiseau');
INSERT INTO Clinique.Assistant(nom,prenom,dateNaissance,adresse,numero, specialite) VALUES('Eileen','Galvin','1982-05-14','Saint-Ange','0645964135', 'mammifere');




INSERT INTO Clinique.ClasseEspece(nom) VALUES('mammifere');
INSERT INTO Clinique.ClasseEspece(nom) VALUES('reptile');
INSERT INTO Clinique.ClasseEspece(nom) VALUES('oiseau');
INSERT INTO Clinique.ClasseEspece(nom) VALUES('autre');

INSERT INTO Clinique.Espece (nom,classe) VALUES('chat','mammifere');
INSERT INTO Clinique.Espece (nom,classe) VALUES('chien','mammifere');
INSERT INTO Clinique.Espece (nom,classe) VALUES('anaconda','reptile');


INSERT INTO Clinique.Medicament(nomMolecule,description) VALUES('MILBEMAX Comprimés Chiens','Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens');
INSERT INTO Clinique.Medicament(nomMolecule,description) VALUES('ANIMAZEN','Aliment complémentaire pour les périodes de stress chez les chiens, chats.');
INSERT INTO Clinique.Medicament(nomMolecule,description) VALUES('OCEVIT','Aliment complémentaire chez les oiseaux de cage et de voliere');


INSERT INTO Clinique.Medicament(nomMolecule,description) 
VALUES(
    'ACTIDRALYTE',
    'Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets'    
);


INSERT INTO Clinique.AutorisationMedicament(medicament,espece) 
VALUES(
    'ACTIDRALYTE',
    'vache'    
);

INSERT INTO Clinique.Medicament(nomMolecule,description) 
VALUES(
    'ACTICARP 50 mg/ml',
    'Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins'    
);

INSERT INTO Clinique.AutorisationMedicament(medicament,espece) 
VALUES(
    'ACTICARP 50 mg/ml',
    'vache'    
);


INSERT INTO Clinique.Medicament(nomMolecule,description) 
VALUES(
    'CALCIUM REPTILE',
    'Aliment complémentaire pour assurer la solidité de la carapace et du squelette chez les reptiles'    
);


INSERT INTO Clinique.AutorisationMedicament(medicament,espece) 
VALUES(
    'CALCIUM REPTILE',
    'anaconda'    
);

INSERT INTO Clinique.Medicament(nomMolecule,description) 
VALUES(
    'VITA REPTILE',
    'Aliment complémentaire riche en vitamine pour reptiles'    
);

INSERT INTO Clinique.AutorisationMedicament(medicament,espece) 
VALUES(
    'VITA REPTILE',
    'anaconda'    
);

INSERT INTO Clinique.AutorisationMedicament(medicament,espece) VALUES('MILBEMAX Comprimés Chiens','chien');
INSERT INTO Clinique.AutorisationMedicament(medicament,espece) VALUES('ANIMAZEN','chien');
INSERT INTO Clinique.AutorisationMedicament(medicament,espece) VALUES('ANIMAZEN','chat');
INSERT INTO Clinique.AutorisationMedicament(medicament,espece) VALUES('OCEVIT','oiseau');


/*
Traitement
Prescription */
