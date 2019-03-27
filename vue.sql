CREATE VIEW Clinique.VPersonnelMedical (nom,prenom,dateNaissance,adresse,numero)
AS
SELECT V.nom,V.prenom,V.dateNaissance,V.adresse,V.numero FROM Clinique.Veterinaire V
UNION
SELECT A.nom,A.prenom,A.dateNaissance,A.adresse,A.numero FROM Clinique.Assistant A;