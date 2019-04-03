# Normalisation 

L'objectif est de revoir notre modèle actuel sur les compositions, les contraintes ansi que de s'assurer que toutes les tables du modèle sont en **3NF**.

Pour chaque table il faudra vérifier : 
- 1NF ? : 
    - existence d'une clé ? 
    - atomicité ? 
- 2NF ? : 
    - 1NF ? 
    - Attribut non clé qui ne peuvent être déterminé par une partie de la clé ? 
- 3NF ? 
    - 2NF ? 
    - Un attribut non clé ne détermine pas d'autre attribut non clé ? 

Toutes les relation sont en 1NF car elles comportent toutes au moins une clé candidate, et une clé  est un ensemble d’attributs minimal qui permet de déterminer tous les autres attributs de facon unique. Tous les attributs de ces tables sont atomiques. 

Ensuite pour la vérification de 2NF et 3NF, nous allons analysé chaque table séparément de la même manièe que cela a été présenté ci-dessus :  

ClasseEspece : 
- 2NF ? 
    - 1NF 
    - Oui car la clé est composé d'un attribut seulement 
- 3NF ? 
    - 2NF
    - Oui, car un seul attribut dans la classe 

La `ClasseEspece` est en **3NF** 

Espece : 
- 2NF ? 
    - 1NF 
    - Oui car la clé est composé d'un attribut 
- 3NF ? 
    - 2NF 
    - Oui car il y a un seul attribut non clé 

La `Esece` est en **3NF** 

Client
- 2NF ?
    - 1NF 
    - Pour la clé candidate (id) c'est trivial car un seul attribut 
    - Pour la clé candidate (nom,prenom,dateNaissance) est bien minimale d'apres la note de clarification, pour déterminer une personne. 
- 3NF ? 
    - 2NF 
    - Oui, car un téléphone et une adresse non aucun lien entre-eux. 

La `Client` est en **3NF** 

Animal 
- 2NF ? 
    - 1NF 
    - Pour la clé candiate (id) il y a un seul attribut 
    - Pour la clé candidate (nom,proprietaire), car il y a aucune partie de la clé qui puissent déterminer poids, la taille, la dateNaissance et l'espece. 
- 3NF ? 
    - 2NF 
    - Oui car le poids, la taille, la dateNaissance et l'espece non aucun lien entre-eux 

La `Animal` est en **3NF** 

Veterinaire et Assistant 
- 2NF ? 
    - 1NF 
    - Pour la clé candidate (id) c'est trivial car un seul attribut 
    - Pour la clé candidate (nom,prenom,dateNaissance) est bien minimale d'apres la note de clarification, pour déterminer une personne. 
- 3NF ? 
    - 2NF 
    - Oui, car aucun attribut non clé ne peut déterminer l'adresse, le téléphone ou la spécialité

La `Veterinaire` et `Assistant` est en **3NF** 

Medicament 
- 2NF ? 
    - 1NF 
    - Oui, car il n'y a qu'un seul attribut dans la clé
- 3NF ? 
    - 2NF 
    - Oui, car il y a qu'un seul attribut non clé 

La `Medicament` est en **3NF** 

AutorisationMedicament 
- 2NF ? 
    - 1NF 
    - Oui, ccar il n'y pas d'attribut non clé  
- 3NF ? 
    - 2NF 
    - Oui, car il n'y pas d'attribut non clé 

Traitement 
- 2NF ? 
    - 1NF 
    - Oui, car une clé composé d'un seul attribut 
- 3NF ? 
    - 2NF 
    - Oui, car il n'y a aycun lien entre début, animal, duree et veterinaire. 

La `Traitement` est en **3NF** 

Prescription 
- 2NF ? 
    - 1NF 
    - Oui, car medicament ne peut déterminer une quantite et car traitement ne peut déterminer une quantité
- 3NF ? 
    - 2NF 
    - Oui, car un seul attribut non clé 

La `Prescription` est en **3NF** 