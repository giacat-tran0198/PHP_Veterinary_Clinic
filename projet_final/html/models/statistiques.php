<?php

function getBdd(){
  $vHost = 'tuxa.sme.utc';
  $vPort = '5432';
  $vData = 'dbbdd0p021';
  $vUser = 'bdd0p021';
  $vPass = '0iXDOuzF';

  $vConn = new PDO("pgsql:host=$vHost;port=$vPort;dbname=$vData", $vUser, $vPass);
  if (!$vConn) {
    die("Connection failed: " . pg_last_error());
  }

  return $vConn;
}

function getPetsBetweenAge($minAge, $maxAge) {
  $vConn = getBdd();

  try {
    $query = "
    SELECT A.id, A.nom, A.poids, A.taille, A.dateNaissance, EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) AS age, A.espece, E.classe
    FROM Clinique.Animal A, Clinique.Espece E
    WHERE
    A.espece = E.nom AND
    A.dateNaissance IS NOT NULL AND
    EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) BETWEEN ? AND ? ;
    ";

    $vSt = $vConn->prepare($query);
    $vSt->execute([$minAge, $maxAge]);
  }

  catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }

  return $vSt->fetchAll(\PDO::FETCH_ASSOC);
}


//Nombre d' animaux par classe d'espèce
function getPetsByspecie(){
  $vConn = getBdd();

  try {
    $query = "
    SELECT E.nom , COUNT(A.nom) AS nombre
    FROM Clinique.Animal A LEFT JOIN Clinique.Espece E ON A.espece = E.nom
    GROUP BY E.nom ;
    ";

    $vSt = $vConn->prepare($query);
    $vSt->execute();
  }

  catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }
  return $vSt->fetchAll(\PDO::FETCH_ASSOC);
}

// Récupérer tous les clients
function getCustomers(){
  $vConn = getBdd();

  try {
    $query = "SELECT * FROM Clinique.Client";
    $vSt = $vConn->prepare($query);
    $vSt->execute();
  }

  catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }
  return $vSt->fetchAll(\PDO::FETCH_ASSOC);
}


// Faire les listes des animaux pour un client donné
function getPetsByCustomerId($customerId){
  $vConn = getBdd();

  try {
    $query = "
    SELECT A.id, A.nom, A.poids, A.taille,A.dateNaissance ,  EXTRACT(YEAR FROM NOW())-EXTRACT(YEAR FROM A.dateNaissance) AS age, A.espece, E.classe
    FROM Clinique.Animal A, Clinique.Espece E
    WHERE
      A.proprietaire = ? AND
      A.espece = E.nom ;
    ";

    $vSt = $vConn->prepare($query);
    $vSt->execute([$customerId]);
  }

  catch(Exception $e){
    die('Erreur : '.$e->getMessage());
  }
  return $vSt->fetchAll(\PDO::FETCH_ASSOC);
}
