# Base de données en Neo4J 

L'un des grands aventages du Neo4j est sa liberté, il faut donc ajouter des contraintes pour rendre la base exploitable.

## Les classes : 
La classe `Client`: 
- nom : string (not null)
- prenom : string (not null)
- dateNaissance : date (not null)
- adresse : string (not null)
- numero : integer (not null) < composé de 10 chiffres>

Les contraintes pour cette classes sont : 
- (nom,prenom,dateNaissance) UNIQUE 

La classe `Animal` : 
- nom : string (not null)
- poids : integer (not null)  < poids >0 > 
- taille : integer (not null)  < taille > 0 >
- dateNaissance : date (not null or null)
- espece : string (not null)

Les contraintes pour cette classes sont : 
- Un client ne peut pas avoir 2 animaux avec le même nom 

La classe `Vétérinaire` : 
- nom : string (not null)
- prenom : string (not null)
- dateNaissance : date (not null)
- adresse : string (not null)
- numero : integer (not null) < composé de 10 chiffres>
- specialite : string (not null)

Les contraintes pour cette classes sont : 
- (nom,prenom,dateNaissance) UNIQUE 

La classe `Traitement` : 
- debut : date (not null )
- duree : integer (not null)


La classe `Médicament` : 
- nom : string (not null)
- description : string (not null)

Les contraintes pour cette classes sont : 
- (nom) UNIQUE 

## Les Associations : 
- Tout `Animal` doit être associé a un seul `Client` 
- Tout `Client` doit être associé a au moins un `Animal` 
- Tout `Traitement` doit être associé a un seul `Veterinaire` et un seul `Animal` 
- Tout `Traitement` doit être associé à au moins un `Médicament` avec dans l'association une donnée sur la **quantité : integer (not null) < quantite >0>**
- Un `Animal` n'est pas obligé de suivre un `Traitement` 
- Un `Medicament` n'est pas obligé d'être utilisé dans un `Traitement` 
- Un `Veterinaire` n'est pas d'être rattaché à un traitement `Traitement` 



