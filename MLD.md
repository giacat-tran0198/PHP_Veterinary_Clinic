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
Pour les personnes nous avons choisi un héritage par classe fille car ce sont des hériatges exclusifs et de plus la classe mère est abstraite et ne possède aucune association.
Idée : changer la clé de Client et PersonnelMedical au numéro de téléphone car toutes personnes à un numéro unique et non null. De plus cela faiclite les références entre classe.


Problème avec PersonnelMedical, Veterinaire et Assistant : héritage par classe fille ou référence ??????
Problème avec traitement : un animal peut suivre plusieurs traitement avec meme date de début préscrit par différent veterinaire ??????
Création d'une clé artificielle pour Traitement, en raison de la complexité des clés naturelles existantes
