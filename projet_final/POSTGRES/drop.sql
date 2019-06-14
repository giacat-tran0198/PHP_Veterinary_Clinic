/* Supprime les tables réalisés */

DROP VIEW  Clinique.VPersonnelMedical ; 
DROP TABLE Clinique.Prescription ; 
DROP TABLE Clinique.Traitement ; 
DROP TABLE Clinique.AutorisationMedicament ; 
DROP TABLE Clinique.Medicament ;
DROP TABLE Clinique.Assistant ;
DROP TABLE Clinique.Veterinaire ; 
DROP TABLE Clinique.Animal ;
DROP TABLE Clinique.Client ; 
DROP TABLE Clinique.Espece ; 
DROP TABLE Clinique.ClasseEspece ; 
DROP SCHEMA IF EXISTS Clinique ; 

/* Il existe 2 solutions pour le "drop" table ici
nous pouvons faire table par table en faisant attention 
aux clés étrangères ou réaliser un drop schéma en cascade 
qui réalise le drop de toutes les tables du schéma dans 
le bon ordre sans oublie  

DROP SCHEMA IF EXISTS Clinique CASCADE ; 

*/ 