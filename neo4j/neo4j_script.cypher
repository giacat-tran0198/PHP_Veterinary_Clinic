// Clients

create (mg : client {nom : 'Guerin', prenom : 'Maurice', dateNaissance : datetime('1940-04-04'), adresse : 'Saint-Andre', numero : '0643564829'})
create (la : client {nom : 'Allaire', prenom : 'Laurence', dateNaissance : datetime('1969-02-04'), adresse : 'Saint-Molf', numero : '0761444829'})
create (md : client {nom : 'Danilo', prenom : 'Melani', dateNaissance : datetime('1999-04-15'), adresse : 'Guerande', numero : '0643784890'})
create (mh : client {nom : 'Halgand', prenom : 'Melanie', dateNaissance : datetime('1998-01-01'), adresse : 'Herbignac', numero : '0656764829'})

// Vétérinaires

create (hm : veterinaire {nom : 'Mason', prenom : 'Harry', dateNaissance : datetime('1970-02-03'), adresse : 'Saint-Andre', numero : '0643558829', specialite : 'mammifere'})
create (cb : veterinaire {nom : 'Bennett', prenom : 'Cybil', dateNaissance : datetime('1980-12-08'), adresse : 'Saint-Andre', numero : '0666564529', specialite : 'reptile'})
create (ag : veterinaire {nom : 'Gillespie', prenom : 'Alessa', dateNaissance : datetime('1960-10-08'), adresse : 'Saint-Brieux', numero : '0662565859', specialite : 'oiseau'})
create (mk : veterinaire {nom : 'Kaufmann', prenom : 'Michael', dateNaissance : datetime('1965-05-23'), adresse : 'Saint-Ange', numero : '0646564595', specialite : 'reptile'})
create (js : veterinaire {nom : 'Sunderland', prenom : 'James', dateNaissance : datetime('1975-06-16'), adresse : 'Saint-Mils', numero : '0648264459', specialite : 'oiseau'})

// Animaux

create (filou : animal {nom : 'Filou', poids : 5, taille : 45, espece : 'chat'})
create (izao : animal {nom : 'Izao', poids : 7, taille : 55, espece : 'chien'})
create (cristale : animal {nom : 'Cristale', poids : 8, taille : 60, espece : 'chien'})
create (sunny : animal {nom : 'Sunny', poids : 6, taille : 40, dateNaissance : datetime('2014-12-15'), espece : 'chien'})
create (bob : animal {nom : 'Bob', poids : 20, taille : 40, dateNaissance : datetime('2013-12-15'), espece : 'anaconda'})
create (margerite : animal {nom : 'Margerite', poids : 600, taille : 80, dateNaissance : datetime('2018-12-15'), espece : 'vache'})

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

match (p1 : client {nom : 'Guerin'}), (a1 : animal {nom : 'Filou'}), (a2 : animal {nom : 'Bob'}), (a3 : animal {nom : 'Margerite'})
create (p1) -[r1:POSSEDE]->(a1)
create (p1) -[r2:POSSEDE]->(a2)
create (p1) -[r3:POSSEDE]->(a3)
return p1, a1, a2, a3, r1, r2, r3

match (p2 : client {nom : 'Allaire'}), (b : animal {nom : 'Sunny'})
create (p2) -[s:POSSEDE]->(b)
return p2, b, s

match (p3 : client {nom : 'Danilo'}), (c : animal {nom : 'Izao'})
create (p3) -[t:POSSEDE]->(c)
return p3, c, t

match (p4 : client {nom : 'Halgand'}), (d : animal {nom : 'Cristale'})
create (p4) -[u:POSSEDE]->(d)
return p4, d, u

// Traitements :
match(a: animal {nom: 'Filou'}), (m: medicament{nomMolecule: 'ANIMAZEN'}), (v: veterinaire{nom:'Mason'})
create (trait:Traitements {type: "Traitements", debut: datetime('2019-08-15'), duree: 10})
create (v)-[l:DONNES]->(trait)
create (a)<-[l1:TRAITEMENTS]-(trait)
create (trait)<-[l2:COMPOSANT {quantite:3}]-(m)
return a,m,v,trait,l,l1,l2

match (a: animal {nom: 'Bob'}), (m1: medicament{nomMolecule: 'VITA REPTILE'}),(m2:medicament{nomMolecule: 'CALCIUM REPTILE'}), (v: veterinaire{nom:'Bennett'})
create (trait:Traitements {type: "Traitements", debut: datetime('2019-07-5'), duree: 40})
create (v)-[l:DONNES]->(trait)
create (a)<-[l1:TRAITEMENTS]-(trait)
create (trait)<-[l2:COMPOSANT {quantite: 3}]-(m1)
create (trait)<-[l3:COMPOSANT {quantite: 3}]-(m2)
return a,m1,m2,v,trait,l,l1,l2,l3

match (a: animal {nom: 'Margerite'}) , (m1: medicament{nomMolecule: 'ACTICARP'}), (m2: medicament{nomMolecule: 'ACTIDRALYTE'}), (v: veterinaire{nom:'Mason'})
create (trait:Traitements {type: "Traitements", debut: datetime('2019-10-10'), duree: 5})
create (v)-[l:DONNES]->(trait)
create (a)<-[l1:TRAITEMENTS]-(trait)
create (trait)<-[l2:COMPOSANT {quantite:3}]-(m1)
create (trait)<-[l3:COMPOSANT {quantite:1}]-(m2)
return a,m1,m2,v,trait,l,l1,l2,l3

match (a: animal {nom: 'Cristale'}), (m: medicament{nomMolecule: 'MILBEMAX'}), (v: veterinaire{nom:'Mason'})
create (trait:Traitements {type: "Traitements", debut: datetime('2019-09-10'), duree: 5})
create (v)-[l:DONNES]->(trait)
create (a)<-[l1:TRAITEMENTS]-(trait)
create (trait)<-[l2:COMPOSANT {quantite: 3}]-(m)
return a,m,v,trait,l,l1,l2