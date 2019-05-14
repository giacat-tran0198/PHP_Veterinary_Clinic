// Clients

create (mg : client {nom : 'Guerin', prenom : 'Maurice', dateNaissance : '1940-04-04', adresse : 'Saint-Andre', numero : '0643564829'})
create (la : client {nom : 'Allaire', prenom : 'Laurence', dateNaissance : '1969-02-04', adresse : 'Saint-Molf', numero : '0761444829'})
create (md : client {nom : 'Danilo', prenom : 'Melani', dateNaissance : '1999-04-15', adresse : 'Guerande', numero : '0643784890'})
create (mh : client {nom : 'Halgand', prenom : 'Melanie', dateNaissance : '1998-01-01', adresse : 'Herbignac', numero : '0656764829'})

// Vétérinaires

create (hm : veterinaire {nom : 'Mason', prenom : 'Harry', dateNaissance : '1970-02-03', adresse : 'Saint-Andre', numero : '0643558829', specialite : 'mammifere'})
create (cb : veterinaire {nom : 'Bennett', prenom : 'Cybil', dateNaissance : '1980-12-08', adresse : 'Saint-Andre', numero : '0666564529', specialite : 'reptile'})
create (ag : veterinaire {nom : 'Gillespie', prenom : 'Alessa', dateNaissance : '1960-10-08', adresse : 'Saint-Brieux', numero : '0662565859', specialite : 'oiseau'})
create (mk : veterinaire {nom : 'Kaufmann', prenom : 'Michael', dateNaissance : '1965-05-23', adresse : 'Saint-Ange', numero : '0646564595', specialite : 'reptile'})
create (js : veterinaire {nom : 'Sunderland', prenom : 'James', dateNaissance : '1975-06-16', adresse : 'Saint-Mils', numero : '0648264459', specialite : 'oiseau'})

// Animaux

create (filou : animal {nom : 'Filou', poids : 5, taille : 45, espece : 'chat'})
create (izao : animal {nom : 'Izao', poids : 7, taille : 55, espece : 'chien'})
create (cristale : animal {nom : 'Cristale', poids : 8, taille : 60, espece : 'chien'})
create (sunny : animal {nom : 'Sunny', poids : 6, taille : 40, dateNaissance : '2014-12-15', espece : 'chien'})
create (bob : animal {nom : 'Bob', poids : 20, taille : 40, dateNaissance : '2013-12-15', espece : 'anaconda'})
create (margerite : animal {nom : 'Margerite', poids : 600, taille : 80, dateNaissance : '2018-12-15', espece : 'vache'})

//Médicaments

create (milbemax : medicament {nomMolecule : 'MILBEMAX', description : 'Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens'})
create (animazen : medicament {nomMolecule : 'ANIMAZEN', description : 'Aliment complémentaire pour les périodes de stress chez les chiens, chats.'})
create (ocevit : medicament {nomMolecule : 'OCEVIT', description : 'Aliment complémentaire chez les oiseaux de cage et de voliere'})
create (actidralyte : medicament {nomMolecule : 'ACTIDRALYTE', description : 'Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets'})
create (acticarp : medicament {nomMolecule : 'ACTICARP', description : 'Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins'})
create (calciumreptile : medicament {nomMolecule : 'CALCIUM REPTILE', description : 'Aliment complémentaire pour assurer la solidité de la carapace et du squelette chez les reptiles'})
create (vivareptile : medicament {nomMolecule : 'VITA REPTILE', description : 'Aliment complémentaire riche en vitamine pour reptiles'})


// Relations : 

// Propriétaires :


// Traitements :