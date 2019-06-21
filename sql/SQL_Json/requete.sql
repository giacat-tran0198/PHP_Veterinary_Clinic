-- Liste de tous les médicaments pris par un animal
SELECT a.nom, m->>'nomMolecule' AS medicaments
FROM animal a, JSON_ARRAY_ELEMENTS(a.traitement) t,JSON_ARRAY_ELEMENTS(t->'medicament') m ;

-- Liste des vétérinaires qui ont prescrit un traitement a l'animal en question
SELECT a.nom, t->'veterinaire'->>'nom' AS veterinaire
FROM animal a, JSON_ARRAY_ELEMENTS(a.traitement) t ;

-- Tous les a,nimaux qui se sont fait traiter par Potter
SELECT a.nom AS nom_animal_traite_par_POTTER
FROM animal a, JSON_ARRAY_ELEMENTS(a.traitement) t
WHERE t->'veterinaire'->>'nom' = 'Potter';
