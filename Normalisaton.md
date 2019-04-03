# Normalisation 

L'objectif est de revoir notre modèle actuel sur les compositions, les contraintes ansi que s'assurer que le modèle respecte une **3NF** 

Pour chaque table il faudra vérifier : 
- 1NF ? : 
    - clé ? 
    - atomicité ? 
- 2NF ? : 
    - 1NF ? 
    - Attribut non clé qui ne peuvent être déterminé par une partie de la clé ? 
- 3NF ? 
    - 2NF ? 
    - Un attribut non clé ne détermine pas d'attribut non clé ? 

La partie 1NF est respecté pour toutes les tables car elles comportent toutes au moins une clé candidate. Et tous les attributs de ces tables sont atomique. 

Ensuite pour la vérification de 2NF et 3NF, nous allons analysé chaque table séparément de la même manièe que cela a été présenté ci-dessus :  

ClasseEspece : 
- 2NF ? 
    - 1NF 
    - Oui car la clé est composé d'un attribut seulement 
- 3NF ? 
    - 2NF
    - Oui, car un seul attribut dans la classe 

Espece : 
- 2NF ? 
    - 1NF 
    - Oui car la clé est composé d'un attribut 
- 3NF ? 
    - 2NF 
    - Oui car il y a un seul attribut non clé 

Client
- 2NF ?
    - 1NF 
    - Pour la clé candidate (id) c'est trivial car un seul attribut 
    - Pour la clé candidate (nom,prenom,dateNaissance) est bien minimale d'apres la note de clarification, pour déterminer une personne. 
- 3NF ? 
    - 2NF 
    - Oui, car un téléphone et une adresse ne peuvent déterminer une personne (téléphone fixe peut être partagé par plusieurs personne et de même pour l'adresse)

Animal 
- 2NF ? 
    - 







Nous avons 10 tables, il faudra donc effectuer une vérifications pour chacune d'entre-elles 

Traitement : 
- 1NF ? : 
    - clé : **Oui**, nous avons comme clé candidate : {(id)}
    - atomicité : **Oui**, composé seulement de chiffres
- 2NF ? : 
    - 1NF : oui 
    - 