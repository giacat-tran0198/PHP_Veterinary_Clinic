/* Requete SQL pour répondre à des questions dans le cahier des charges */ 

/* 1 ) Obtenir facilement des informations statistiques, 
comme la quantité de chaque type de médicament prescrit 
pour un animal donné */ 

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
      T.animal = 6
GROUP BY M.nomMolecule ;

/* 2 ) La quantité d'un médicament prescrit au total dans la clinique */ 

SELECT SUM(P.quantite) AS quantite_medicament
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M
WHERE P.medicament = M.nomMolecule AND 
      M.nomMolecule = 'MILBEMAX'
GROUP BY M.nomMolecule ;

/* 3) Les poids et taille moyenne des animaux d'une espèce traités */ 