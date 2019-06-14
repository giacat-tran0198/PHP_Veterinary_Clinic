

-- Liste de tous les médicaments pris par un animal 
SELECT A.nom, A.traitement.EXTRACT('traitements/traitement/prescription/medicament/nomMolecule/node()').GETSTRINGVAL() AS medicaments 
FROM Animal A
WHERE traitement is NOT NULL ;  
/

-- Liste des vétérinaires qui ont prescrit un traitement a l'animal en question 
SELECT A.nom , A.traitement.EXTRACT('traitements/traitement/veterinaire/nom/node()').GETSTRINGVAL() AS veterinaire
FROM Animal A
WHERE traitement is NOT NULL ; 
/

-- Tous les a,nimaux qui se sont fait traiter par Harry 
SELECT A.nom   
FROM Animal A
WHERE A.traitement.EXTRACT('traitements/traitement/veterinaire[nom = "Harry"]').GETSTRINGVAL() IS NOT NULL ; 
/