/* Requete SQL pour répondre à des questions dans le cahier des charges */ 


/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 1 ) Obtenir facilement des informations statistiques, comme la 
  quantité de chaque type de médicament prescrit pour un animal donné */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 

\echo " Obtenir facilement des informations statistiques, comme la quantité de chaque type de médicament prescrit pour un animal donné "; 

PREPARE requete_animal (INTEGER) AS 
   SELECT M.nomMolecule AS medicament_prescrit , SUM(P.quantite) AS quantite_prescrite
   FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
           Clinique.Medicament M, Clinique.Animal A
   WHERE P.medicament = M.nomMolecule AND 
         T.animal = A.id AND 
         T.animal = $1  
   GROUP BY M.nomMolecule ;
EXECUTE requete_animal (5); 
DEALLOCATE requete_animal ; 



/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 2 ) La quantité d'un médicament prescrit au total dans la clinique */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 

\echo "La quantité d'un médicament prescrit au total dans la clinique"; 

SELECT M.nomMolecule AS medicament , SUM(P.quantite) AS quantite_medicament
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M
WHERE P.medicament = M.nomMolecule
GROUP BY M.nomMolecule ;


/* Variante : Pour un spécifique */ 

\echo "La quantité d'un médicament spécifique prescrit au total dans la clinique" ; 

PREPARE medicament_requete AS 
SELECT SUM(P.quantite) AS quantite_medicament
FROM Clinique.Prescription P LEFT JOIN Clinique.Traitement T ON P.traitement = T.id ,
        Clinique.Medicament M
WHERE P.medicament = M.nomMolecule AND 
      M.nomMolecule = $1 ; 
EXECUTE medicament_requete ('MILBEMAX'); 
DEALLOCATE medicament_requete ; 



/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 3) Les poids et taille moyenne des animaux d'une espèce traités    */ 
/* Traité signifie qu'il a suivie un traitement dans la clinique      */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 

\echo " Les poids et taille moyenne des animaux d'une espèce traités"; 

SELECT A.espece, AVG(A.taille) AS taille_moyenne, AVG(A.poids) AS poids_moyen
FROM Clinique.Animal A LEFT JOIN Clinique.Traitement T ON A.id = T.animal 
WHERE T.animal IS NOT NULL 
GROUP BY A.espece
ORDER BY A.espece ; 

/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 4) Faire les listes des animaux pour un client donné               */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
\echo "Faire les listes des animaux pour un client donné"; 

PREPARE requete_client (INTEGER) AS 
   SELECT A.id, A.nom, A.poids, A.taille,A.dateNaissance ,  EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) AS age, A.espece, E.classe
   FROM Clinique.Animal A, Clinique.Espece E
   WHERE A.proprietaire = $1 AND 
         A.espece = E.nom ;
EXECUTE requete_client (1); 
DEALLOCATE requete_client ; 


/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 
/* 5) Nombre d' animaux par classe d'espèce                           */ 
/* ------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------ */ 


\echo "Nombre d' animaux par classe d'espèce " ; 

SELECT E.nom , COUNT(A.nom) AS nombre 
FROM Clinique.Animal A LEFT JOIN Clinique.Espece E ON A.espece = E.nom 
GROUP BY E.nom ; 


/* ------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------ */ 
/* 6) Selection des animaux d'un age compris entre une valeur inf et une valeur max     */ 
/* ------------------------------------------------------------------------------------ */ 
/* ------------------------------------------------------------------------------------ */ 

\echo "Selection des animaux d'un age compris entre une valeur inf et une valeur max" ; 

PREPARE requete_age (INTEGER) AS 
SELECT A.id, A.nom, A.poids, A.taille, A.dateNaissance, EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) AS age, A.espece, E.classe
FROM Clinique.Animal A, Clinique.Espece E
WHERE A.espece = E.nom AND 
      A.dateNaissance IS NOT NULL AND
      EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) BETWEEN $1 AND $2 ; 
EXECUTE requete_age (1,5); 
DEALLOCATE requete_age ; 
