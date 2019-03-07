Note de clarification 
===
# Projet de conception et de réalisation de la base de données de la clinique vétérinaire A

## Contexte du projet


Dans le cadre de l’UV NF17 le présent projet concerne la conception et la réalisation d’une base de donnée de gestion d’une clinique vétérinaire.

## Acteurs du projet


Maîtrise d’ouvrage : M. Z administrateur de la clinique, représenté par M. Lussier

Maîtrise d’œuvre :

-   William LENOIR
-   Anna Chevalier
-   Floriane Allaire
-   Tran Quoc Giat Giat

## Données d'entrée sur les différentes composantes du projet


- Aspect technique
    - Cahier des charges fourni par la MOA (référencé https://librecours.net/projet/projets-19p-nx17/projets-19p-nx17.xhtml)
    - Définition des contraintes techniques (référencé https://librecours.net/projet/projets-19p-nx17/cadre.xhtml)

- Aspect projet
    - Définition du cadre du projet (référencé https://librecours.net/projet/projets-19p-nx17/cadre.xhtml)

    - Définition des livrables attendus (référencé https://librecours.net/projet/projets-19p-nx17/livrables-nx17.xhtml)


## Objet du projet


Il s’agit de mener à bien les phases de définition et de réalisation d’un projet de développement informatique pour le compte de la clinique vétérinaire A. 

La phase de formalisation du projet a été réalisée par la maîtrise d'ouvrage avec le cahier des charges. 


Le projet a pour vocation d'améliorer l'organisation interne de la clinique grâce à une gestion informatisée des ressources humaines, des données des clients et de leurs animaux. Le projet permettra également de gérer des processus métiers tels que le suivi des prescriptions médicales des différents vétérinaires.

## Produits du projet


- Une base de données permettant de gérer l'ensemble des processus de la clinique vétérinaire.

- Des interfaces permettant d'ajouter et de modifier les données de la base, ainsi que de visualiser les différentes analyses statistiques sur le fonctionnement de la clinique et son historique.

**Synthèse des livrables attendus :**

- Note de clarification du projet
- Modèle Conceptuel de Données (MCD)
- Modèle Logique de Données (MLD)
- Base de données relationnelle avec ses principales requêtes SQL et des données de test
- Des preuves de concept (POC) pour Neo4J/MongoDB, Oracle RO, Oracle/XML et PostgreSQL/JSON.

## Objets principaux de la base de données


Les principaux objets manipulés par la base de données sont les suivants :

-   Client
-   Poste
-   Personnel
-   Classe d'espèce animale
-   Espèce
-   Animal
-   Médicament
-   Autorisation d'utilisation de médicament
-   Traitement
-   Prescription de médicament

## Utilisateurs principaux

Les utilisateurs de la base de données sont l’administrateur de la clinique, les vétérinaires et les assistants vétérinaires.

## Rôles des utilisateurs


Les rôles des différents utilisateurs sur la base de données sont ici donnés à titre indicatif et peuvent évoluer au cours du projet en fonction des besoins de la MOA.

La base de données doit permettre au gestionnaire de la clinique d’ajouter de nouveaux clients ainsi que leurs animaux, membres du personnel et médicaments.

La base de données doit permettre aux vétérinaires d’enregistrer les traitements qu’ils ont donnés avec les différentes prescriptions de médicaments.


## Fonctions principales de la base de données




###  Gestion du personnel

La base de données doit permettre de consulter le poste et la spécialité d’un personnel de la clinique. Pour le moment, seuls deux postes ont été définis : vétérinaire et assistant. Par la suite d'autres postes pourront être ajoutés à la base.

La spécialité d’un membre du personnel est une classe d’espèce animale. Les classes d’espèces animales comprennent : les mammifères, les reptiles, les oiseaux et autre.


Un membre du personnel possède toujours un poste. De plus, chaque membre du personnel présente toujours une unique spécialité.


Un personnel de la clinique ne peut pas avoir un animal traité par la clinique. 

Un personnel possède aussi des informations générales : nom, prénom, date de naissance, adresse et numéro de téléphone. Ces informations sont toutes obligatoires. 

### Gestion des clients et de leurs animaux

La base de données doit permettre d’identifier le client propriétaire d'un animal et inversement.

Un client peut posséder plusieurs animaux et chaque animal a un unique propriétaire. Dans le cas où un animal aurait plusieurs propriétaires, un seul propriétaire sera enregistré comme client dans la base (si besoin, une autorisation écrite permettra à une autre personne de récupérer un animal).

Un client possède aussi des informations générales pour le contacter si besoin avec : nom, prénom, date de naissance, adresse et numéro de téléphone. 


Un animal possède un nom et une espèce. Une espèce appartient à une des classes d'espèces animales. Les différentes espèces pourront être ajoutées dans la base de données en fonction des besoins de la clinique et des animaux à traiter. Le poids et la taille d'un animal seront obligatoirement renseignés en cm et en kg. Enfin, l'année de naissance de l'animal pourra ou non être renseignée en fonction des cas.

### Gestion des traitements

Un médicament est identifié exclusivement par le nom de la molécule qu’il comporte. Il ne peut donc pas y avoir plusieurs médicaments comportant la même molécule (les différentes appellations d’un médicament : désignations commerciales, nom générique, etc. ne sont donc pas gérées). Un médicament comporte aussi une brève description de ses effets. 

Un médicament ne peut être utilisé que pour certaines espèces bien particulières. Des autorisations d'utilisation de médicament seront renseignées dans la base afin d'attester qu'un médicament donné peut bien être prescrit pour une espèce donnée.

Un traitement est prescrit par un unique vétérinaire et concerne un animal accueilli par la clinique.

Un traitement comporte une date de début (jour, mois et année) ainsi qu'une durée exprimée en jours.

Un traitement comporte une ou plusieurs prescriptions de médicaments. Une prescription de médicament concerne un unique médicament à la fois et indique la quantité à prendre en nombre de prises unitaires par jour.

Un traitement est toujours prescrit par un vétérinaire.

La base de données doit permettre de conserver un historique des traitements donnés par les vétérinaires, avec les différentes prescriptions de médicaments et les animaux concernés. 



## Analyse des données statistiques de la clinique


La base de données doit permettre à l’administrateur de la clinique d’obtenir des informations statistiques sur les médicaments prescrits et les animaux reçus.

Parmi ces fonctions nous pouvons citer : 

- les quantités totales de chacun des médicaments administrés à un animal donné sur une période de temps définie. 

- Les quantités totales de médicaments prescrits sur l’ensemble de la clinique. 

- La taille et le poids moyens des animaux d'une espèce traitée.

## Propriétés des objets principaux de la base


**Client**

-   nom, *chaîne de caractères obligatoire*
-   prénom, *chaîne de caractères obligatoire*
-   date de naissance, *date obligatoire*
-   adresse, *chaîne de caractères obligatoire*
-   numéro de téléphone, *chaîne de caractères obligatoire*


**Poste**

- nom, *chaîne de caractères obligatoire*

**Personnel**

-   nom, *chaîne de caractères obligatoire*
-   prénom, *chaîne de caractères obligatoire*
-   date de naissance, *date obligatoire*
-   adresse, *chaîne de caractères obligatoire*
-   numéro de téléphone, *chaîne de caractères obligatoire*
-   poste, *obligatoire*


-   spécialité, *obligatoire*


**Classe d’espèce animale**

-   nom, *chaîne de caractères obligatoire*

**Espèce**

-   nom, *chaîne de caractères obligatoire*
-   classe d'espèce animale, *obligatoire*




**Animal**

-   nom, *chaîne de caractères obligatoire*
-   espèce, *obligatoire*
-   dernier poids mesuré (en kg), *nombre réel obligatoire*
-   dernière taille mesurée (en cm), *nombre réel obligatoire*
-   année de naissance, *nombre entier, non obligatoire*

-   client propriétaire, *obligatoire*


**Médicament**

-   nom de la molécule, *chaîne de caractères obligatoire*
-   description des effets, *texte obligatoire*

**Autorisation d'utilisation de médicament**

-   nom de la molécule, *chaîne de caractères obligatoire*
-   nom de l'espèce, *chaîne de caractères obligatoire*

**Traitement**

-   début, *date obligatoire*
-   durée (en jours), *entier obligatoire*

-   vétérinaire, *obligatoire*

**Prescription de médicament**

-   nom de la molécule, *chaîne de caractère obligatoire*
-   quantité (en nombre de prises unitaires par jour : exemples : nombre de gélules, d’injections, etc. à prendre chaque jour), *entier obligatoire*
-   traitement, *obligatoire*


## Objectifs à atteindre


**Qualité/performance du produit du projet**

La base de données a pour vocation de conserver l’historique de l’ensemble des prescriptions médicales des praticiens de la clinique. Il est donc primordial d’assurer l’intégrité et la traçabilité des données récoltées.


**Délai du projet**

Le délai de ce projet est de 3 mois avec une date de début au 04/03/2019 et date de réception au 14/06/2019. 


## Contraintes à respecter


- Contraintes techniques : la base de données relationnelle doit être réalisée avec PostgreSQL.
- Le code doit être compatible avec les versions installées sur les serveurs de l'UTC.
- Les applications web doivent être développées en PHP et déployées sur les serveurs UTC.
- Le suivi du projet est centralisé sur Git.
- Les comptes-rendus doivent être rédigés en markdown.
- Réalisation d'un modèle UML au format PlantUml .

## Conséquences attendues


- Maintien d’une activité de soin vétérinaire de qualité, avec un outil de gestion informatique moderne permettant de rester concurrentiel par rapport aux autres cliniques de la région. 

- Meilleure connaissance des populations animales accueillies et des pratiques thérapeutiques de la clinique.

_______________________________


| Document : Note de clarification version 1 | Date: 07/03/2019 |
| -------------------------------------------| ---------------- |
| Signature : MOA, M. Lussier                | Signature MOE    |
