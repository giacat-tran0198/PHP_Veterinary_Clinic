# MLD : Clinique Vétérinaire :

**Client**(#id : integer, nom : string, prenom : string, dateNaissance : date, adresse : string, numero: char(10))
  
  avec {(nom,prenom,dateNaissance,adresse,numero) NOT NULL AND (numero compose de 10 chiffres) AND (nom,prenom,dateNaissance) clé candidate }

**Animal**(#nom : string, #proprietaire=>Client(id), poids : float, taille: float, dateNaissance : date , espece=>Espece(nom))
  
  avec {(poids,taille,espece) NOT NULL AND (poids > 0) AND (taille > 0) }

**Veterinaire**(#id : integer, nom : string, prenom : string, dateNaissance : date, adresse : string, numero: char(10),specialite=>ClasseEspece(nom))
  
  avec {(nom,prenom,dateNaissance,adresse,numero,specialite) NOT NULL AND (numero compose de 10 chiffres) AND (nom,prenom,dateNaissance) clé candidate }

**Assistant**(#id : integer, nom : string, prenom : string, dateNaissance : date, adresse : string, numero: char(10),specialite=>ClasseEspece(nom))
  
  avec {(nom,prenom,dateNaissance,adresse,numero,specialite) NOT NULL AND (numero compose de 10 chiffres) AND (nom,prenom,dateNaissance) clé candidate }

**ClasseEspece**(#nom : string)

**Espece**(#nom: string,classe=>ClasseEspece(nom))
  
  avec {(classe) NOT NULL}

**Medicament**(#nomMolecule : string, description : string )
  
  avec {(description) NOT NULL}

**AutorisationMedicament**(#medicament=>Medicament(nomMolecule),#espece=>Espece(nom))

**Traitement**(#id : integer, debut : date, animal=>Animal(nom), duree :integer, veterinaire=>Veterinaire(id))
  
  avec {(debut,animal,duree,veterinaire) NOT NULL AND (duree > 0)}

**Prescription**(#medicament=>Medicament(nomMolecule),#traitement=>Traitement(idTraitement),quantite : integer)
  
  avec {(quantite) NOT NULL AND (quantite > 0)}

## Contraintes

- Projection(Medicament,nomMolecule)=Projection(AutorisationMedicament,medicament). 
  - Permet de vérifier que tous les médicaments sont autorisés pour au moins une espèce.
- Projection(Animal,proprietaire)=Projection(Client,id). 
  - Permet de vérifier que tous les clients font soigner au moins un animal dans la clinique.
- vPersonnelMedical=Union(Veterinaire,Assistant)
  - Permet d'obtenir l'ensemble du personnel médical.
- Jointure(vPersonnelMedical,Client,vPersonnelMedical.nom=Client.nom, vPersonnelMedical.prenom=Client.prenom, vPersonnelMedical.dateNaissance=Client.dateNaissance)=ensemble vide.
  - Pour s'assurer qu'aucun membre du personnel médical ne fait soigner un de ses animaux dans la clinique. 


## Questions et justifications : 
Pour les personnes nous avons choisi un héritage par classe fille car ce sont des héritages exclusifs, de plus la classe mère est abstraite et ne possède aucune association.

Nous avons choisi de créer une clé artificielle pour les relations suivantes : Client, Veterinaire, Assistant et Traitement. Utiliser une clé naturelle aurait nécéssité l'ajout de plusieurs attributs dans les relations, ce qui complexifie la manipulation et la récupération des données.