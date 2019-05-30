SELECT * FROM Client ; 
/

SELECT * FROM Espece ; 
/

SELECT  C.id , C.nom , C.prenom , C.adresse , C.dateNaissance , C.numero 
FROM Client C , TABLE(C.animaux) A ; 
/ 