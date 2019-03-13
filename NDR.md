Note de révision
==
Cette note vient apporter des changements et des précisions à la note de clarification.
## Fonctions principales de la base de données


### Gestion du personnel

Il était auparavant envisagé que d'autres postes soient ajoutés plus tard dans la base de données. 

Nous avons restreint la gestion du personnel au personnel médical uniquement. Il sera toujours possible de rajouter de nouveaux postes mais ils devront être de nature médicale.

L'hypothèse suivante a été rajoutée : tous les membres du personnel médical ont une spécialité.

### Gestion des clients et de leurs animaux

Plusieurs animaux traités dans la clinique peuvent porter le même nom. Cependant, plusieurs animaux traités ayant le même propriétaire ont tous un nom unique.

### Gestion des animaux : 
Nous nous autorisons à avoir des classes d'espèces pour lesquels il n'existe pas de personnel médical spécialisé dans la clinique. L'ajout de nouvelles classes d'espèces est possible, pour permettre l'ajout d'une plus grande variété d'animaux. 

### Gestion des traitements
Un médicament enregistré dans les données de la clinique est forcément autorisé pour au moins une espèce.

## Propriétés des objets principaux de la base
Une personne, donc un client ou un membre du personnel, est identifié de façon unique par la combinaison de son nom, son prénom et sa date de naissance.

## Analyse des données statistiques de la clinique

Le client voudrait avoir les poids et tailles moyens des animaux d'une espèce traités. Il n'a donc pas besoin d'un historique des différents poids et taille d'un même individu. A chaque nouvelle mesure, celle-ci écrase l'ancienne valeur. 

