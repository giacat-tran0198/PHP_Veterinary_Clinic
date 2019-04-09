/* Requete SQL pour répondre à des questions dans le cahier des charges */ 


/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 1 ) Obtenir facilement des informations statistiques, comme la 
  quantité de chaque type de médicament prescrit pour un animal donné */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 


DO $$ 
DECLARE
   animal_num INTEGER := 1 ;
BEGIN 
   RAISE NOTICE 'L animal a pour id :  %', animal_num ;
END $$;


SELECT M.nomMolecule AS medicament_prescrit , SUM(P.quantite) AS quantite_prescrite
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M, Clinique.Animal A
WHERE P.medicament = M.nomMolecule AND 
      T.animal = A.id AND 
      T.animal = 6 /*animal a donner */ 
GROUP BY M.nomMolecule ;


/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 2 ) La quantité d'un médicament prescrit au total dans la clinique */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
SELECT SUM(P.quantite) AS quantite_medicament
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M
WHERE P.medicament = M.nomMolecule AND 
      M.nomMolecule = 'MILBEMAX'
GROUP BY M.nomMolecule ;




/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 3) Les poids et taille moyenne des animaux d'une espèce traités    */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
SELECT A.espece, AVG(A.taille) AS taille_moyenne, AVG(A.poids) AS poids_moyen
FROM Clinique.Animal A
GROUP BY A.espece
ORDER BY A.espece ; 





/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 4) Faire les listes des animaux pour un client donnée              */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 




/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 5) Liste des animaux par classe d'espèce                           */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
SELECT E.nom , COUNT(A.nom) AS nombre 
FROM Clinique.Animal A LEFT JOIN Clinique.Espece E ON A.espece = E.nom 
GROUP BY E.nom ; 




/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 6) Selection des animaux d'une tranche d'age avec $inf et $sup     */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
