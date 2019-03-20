# MLD : Clinique Vétérinaire :

**Client**(nom : string, prenom : string, dateNaissance : date, adresse : string, #numero: char(10))
  avec {(nom,prenom,dateNaissance,adresse) NOT NULL AND (numero compose de 10 chiffres) }

**Animal**(#nom : string, #proprietaire=>Client(numero), poids : float, taille: float, dateNaissance : date , espece=>Espece(nom))
  avec {(poids,taille,espece) NOT NULL AND (poids > 0) AND (taille > 0) }

**Veterinaire**(nom : string, prenom : string, dateNaissance : date, adresse : string, #numero: char(10),specialite=>ClasseEspece(nom))
  avec {(nom,prenom,dateNaissance,adresse,specialite) NOT NULL AND (numero compose de 10 chiffres) }

**Assistant**(nom : string, prenom : string, dateNaissance : date, adresse : string, #numero: char(10),specialite=>ClasseEspece(nom))
  avec {(nom,prenom,dateNaissance,adresse,specialite) NOT NULL AND (numero compose de 10 chiffres) }

**ClasseEspece**(#nom : string)

**Espece**(#nom: string,classe=>ClasseEspece(nom))
    avec {(classe) NOT NULL}

**Medicament**(#nomMolecule : string, description : string )
    avec {(description) NOT NULL}

**MedicamentAutorise**(#medicament=>Medicament(nomMolecule),#espece=>Espece(nom))

**Traitement**(#idTraitement : integer, debut : date, animal=>Animal(nom),proprietaire=>Animal(proprietaire), duree :integer, veterinaire=>Veterinaire(numero))
  avec {(debut,animal,proprietaire,duree,veterinaire) NOT NULL AND (duree > 0)}

**Prescription**(#medicament=>Medicament(nomMolecule),#traitement=>Traitement(idTraitement),quantite : integer)
  avec {(quantite) NOT NULL AND (quantite > 0)}


## Questions et justification à voir : 
Pour les personnes nous avons choisi un héritage par classe fille car ce sont des hériatges exclusifs,de plus la classe mère est abstraite et ne possède aucune association.




Nous avons choisi de créer une clé artificielle pour les relations suivantes : Client, Veterinaire, Assistant et Traitement.