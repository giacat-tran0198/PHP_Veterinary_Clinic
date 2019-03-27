Note de révision
==
Cette note vient apporter des changements et des précisions à la note de clarification.

## Fonctions principales de la base de données

### Gestion des personnes
Une personne, donc un client ou un membre du personnel, est identifiée de façon unique par la combinaison de son nom, son prénom et sa date de naissance.

### Gestion du personnel

Il était auparavant envisagé que d'autres postes soient ajoutés plus tard dans la base de données. 

Nous avons restreint la gestion du personnel au personnel médical uniquement. Il sera toujours possible de rajouter de nouveaux postes mais ils devront être de nature médicale.

L'hypothèse suivante a été rajoutée : tous les membres du personnel médical ont une spécialité.

### Gestion des animaux

Plusieurs animaux traités dans la clinique peuvent porter le même nom. Cependant, les animaux portant un même nom ont des propriétaires différents.

Un animal n’est pas obligé de suivre un traitement (effectivement une simple consultation sans prescription de médicaments donnera lieu à l'enregistrement de l'animal dans la base).

Nous nous autorisons à avoir des classes d'espèces pour lesquelles il n'existe pas de personnel médical spécialisé dans la clinique. 

De plus, une classe d'espèce peut ne pas avoir d'espèce associée dans la base de données.

Enfin une espèce peut ne pas avoir d'animal associé dans la base de données.


### Gestion des traitements
Un médicament enregistré dans les données de la clinique est forcément autorisé pour au moins une espèce.



### Analyse des données statistiques de la clinique

Le client voudrait avoir les poids et tailles moyens des animaux d'une espèce traitée. Il n'a donc pas besoin d'un historique des différents poids et taille d'un même individu. A chaque nouvelle mesure, celle-ci écrase l'ancienne valeur. 

## MCD : UML

La classe Prescription a été transformée en une classe association entre Traitement et Médicament.
_______________________________


| Document : Note de révision version 1 | Date: 14/03/2019 |
| -------------------------------------------| ---------------- |
| Signature : MOA                | Signature : MOE    |






## Code SQL : 
On suppose que tous les individus de la base ainsi que les animaux ne peuvent être né dans le futur. Pour cela, on impose une contrainte sur la date de naissance qui doit être dans le passé ou aujourd'hui (surtout pour les animaux). 

Pour les traitements, la date de début doit soit être aujourd'hui ou dans le futur. Il est inutile pour un vétérinaire de prescrire un traitement dans le passé pour un de ses patients. La date de début doit donc être aujourd'hui ou dans le futur pour qu'elle soit respectée. 
