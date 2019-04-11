# Normalisation 

L'objectif est de revoir notre modèle actuel sur les compositions, les contraintes ansi que de s'assurer que toutes les tables du modèle sont en **3NF**.

Pour chaque table il faudra déterminer les DF, en déduire les clés candidates et vérifier leur forme normale: 
- 1NF ? : 
    - existence d'une clé ? 
    - atomicité ? 
- 2NF ? : 
    - 1NF ? 
    - Attribut non clé qui ne peuvent être déterminé par une partie de la clé ? 
- 3NF ? 
    - 2NF ? 
    - Un attribut non clé ne détermine pas d'autre attribut non clé ? 

Dans toutes les tables, F désigne l'ensemble des DF, F+ la fermeture transitive et CM la couverture minimale.



`ClasseEspece` : F={} car la table comporte un seul attribut (nom). La seule clé candidate est donc (nom).
- 1NF ? : 
    - une clé : nom
    - attribut atomique
- 2NF ? 
    - 1NF 
    - Oui, car la clé est composé d'un attribut seulement 
- 3NF ? 
    - 2NF
    - Oui, car un seul attribut dans la table

ClasseEspece est en **3NF** 


`Espece` : F={nom → classe}. F+=F et CM=F. La seule clé candidate est nom. 
- 1NF ? : 
    - une clé : nom
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Oui, car la clé est composé d'un seul attribut 
- 3NF ? 
    - 2NF 
    - Oui, car il y a un seul attribut non clé 

Espece est en **3NF** 


`Client` :

F={

    id → nom, prenom, dateNaissance, adresse, numero ; 
    (nom, prenom, dateNaissance) → id, adresse, numero

}

Numero et adresse ne se déterminent pas l'un l'autre, car le numéro peut être un numéro de portable ou de fixe.

F+=F, 

CM= {

    id → nom ; 
    id → prenom ; 
    id → dateNaissance ; 
    id → adresse ; 
    id → numero ; 
    (nom, prenom, dateNaissance) → id; 
    (nom, prenom, dateNaissance) → adresse ; 
    (nom, prenom, dateNaissance) → numero
    
}

id détermine tous les autres attributs, c'est donc une clé candidate.
De manière analogue, (nom,prenom,dateNaissance) est une clé candidate.
- 1NF ? : 
    - deux clés : id et (nom,prenom,dateNaissance)
    - attributs atomiques
- 2NF ?
    - 1NF 
    - Pour la clé candidate (id), c'est trivial car un seul attribut 
    - La clé candidate (nom,prenom,dateNaissance) est bien minimale, d'après la note de clarification, pour déterminer une personne. 
- 3NF ? 
    - 2NF 
    - Oui, car un téléphone et une adresse ne se déterminent pas l'un l'autre : deux personnes habitant à la même adresse ont deux numéros de portable différents.

Client est en **3NF** 


`Animal` : 

F={

    id → nom, proprietaire,poids, taille, dateNaissance, espece ;
    (nom, proprietaire) → id, poids, taille, dateNaissance, espece

}

F+= F

CM = {

    id → nom;
    id → proprietaire;
    id → poids;
    id → taille; 
    id → dateNaissance; 
    id → espece;
    (nom, proprietaire) → id;
    (nom, proprietaire) → poids;
    (nom, proprietaire) → taille;
    (nom, proprietaire) → dateNaissance; 
    (nom, proprietaire) → espece;

}

id et (nom, proprietaire) sont clés candidates : ils déterminent tous les autres attributs de la table.
- 1NF ? : 
    - deux clés : id et (nom,prenom,dateNaissance)
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Pour la clé candiate (id) il y a un seul attribut 
    - Pour la clé candidate (nom,proprietaire), il n'y a aucune partie de la clé qui puisse déterminer seule poids, taille, dateNaissance et espece. 
- 3NF ? 
    - 2NF 
    - Oui car poids, taille, dateNaissance et espece ne se déterminent pas les uns les autres

Animal est en **3NF** 


`Veterinaire` et `Assistant`

F={

    id → nom, prenom, dateNaissance, adresse, numero, specialite ; 
    (nom, prenom, dateNaissance) → id, adresse, numero, specialite

}

F+= F

CM = {

    id → nom ;
    id → prenom ;
    id → dateNaissance ;
    id → adresse ; 
    id → numero ; 
    id → specialite ; 
    (nom, prenom, dateNaissance) → id ;
    (nom, prenom, dateNaissance) → adresse ; 
    (nom, prenom, dateNaissance) → numero ; 
    (nom, prenom, dateNaissance) → specialite
    
}

id et (nom, prenom, dateNaissance) sont des clés candidates, car ils déterminent tous les autres attributs.
- 1NF ? : 
    - deux clés : id et (nom,prenom,dateNaissance)
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Pour la clé candidate (id), c'est trivial car un seul attribut 
    - La clé candidate (nom,prenom,dateNaissance) est bien minimale d'après la note de clarification, pour déterminer une personne. 
- 3NF ? 
    - 2NF 
    - Oui, car aucun attribut non clé ne peut déterminer l'adresse, le téléphone ou la spécialité

Veterinaire et Assistant  sont en **3NF** 


`Medicament` : 

F= {

    nomMolecule → description
    
}

Une seule DF donc F+=F et CM=F. Une seule clé candidate : nomMolecule.
- 1NF ? : 
    - une clé : nomMolecule
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Oui, car il n'y a qu'un seul attribut dans la clé
- 3NF ? 
    - 2NF 
    - Oui, car il y a qu'un seul attribut non clé 

Medicament est en **3NF** 


`AutorisationMedicament` : 
F= {

    medicament → espece
    
}

(car une espece peut être traitée par plusieurs médicaments)

Une seule DF donc F+=F et CM=F. Une seule clé candidate : medicament.
- 1NF ? : 
    - une clé : medicament
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Oui, car il n'y pas d'attribut non clé  
- 3NF ? 
    - 2NF 
    - Oui, car il n'y pas d'attribut non clé 

AutorisationMedicament est en **3NF**


`Traitement` :

F={

    id → debut, animal, duree, veterinaire

}

F+= F

CM = {

    id → debut; 
    id → animal;
    id → duree;
    id → veterinaire

}

id n'est déterminé par aucun autre attribut, il fait donc partie de la clé. Comme il détermine tous les autres attributs, il est déjà une clé.
Donc la seule clé candidate est : id.
- 1NF ? : 
    - une clé : id
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Oui, car la clé est composée d'un seul attribut 
- 3NF ? 
    - 2NF 
    - Oui, car debut, animal, duree et veterinaire ne se déterminent pas les uns les autres

Traitement est en **3NF** 


`Prescription` : 

F= {

    (medicament,traitement) → quantite
    
}

Une seule DF donc F+=F et CM=F, car on a besoin des 2 attributs medicament et traitement pour déterminer la quantité à prescrire. 

Une seule clé candidate : (medicament,traitement).

- 1NF ? : 
    - une clé : (medicament, traitement)
    - attributs atomiques
- 2NF ? 
    - 1NF 
    - Oui, car medicament  ne peut seul déterminer une quantité, et traitement ne peut seul déterminer une quantité
- 3NF ? 
    - 2NF 
    - Oui, car un seul attribut non clé 

Prescription est en **3NF** 





