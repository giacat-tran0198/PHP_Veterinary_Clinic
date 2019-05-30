SELECT * FROM Client ; 
/

SELECT * FROM Espece ; 
/

SELECT  A.proprietaire, A.nom , A.poids, A.taille, A.dateNaissance, A.espece, t.veterinaire.nom , t.debut , t.duree, m.nomMolecule , m.quantite 
FROM Animal A , TABLE(A.traitement) t , TABLE(t.medicament) m
/ 


SELECT  C.id , C.nom , C.prenom , C.adresse , C.dateNaissance , C.numero 
FROM Client C , TABLE(C.animaux) A ; 
/ 