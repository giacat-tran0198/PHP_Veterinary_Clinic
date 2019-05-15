// Client 
create (mg : client {nom : 'Guerin', prenom : 'Maurice', dateNaissance : datetime('1940-04-04'), adresse : 'Saint-Andre', numero : '0643564829'})
create (la : client {nom : 'Allaire', prenom : 'Laurence', dateNaissance : datetime('1969-02-04'), adresse : 'Saint-Molf', numero : '0761444829'})
create (md : client {nom : 'Danilo', prenom : 'Melani', dateNaissance : datetime('1999-04-15'), adresse : 'Guerande', numero : '0643784890'})
create (mh : client {nom : 'Halgand', prenom : 'Melanie', dateNaissance : datetime('1998-01-01'), adresse : 'Herbignac', numero : '0656764829'})


// Veterianire 
create (hm : veterinaire {nom : 'Mason', prenom : 'Harry', dateNaissance : datetime('1970-02-03'), adresse : 'Saint-Andre', numero : '0643558829', specialite : 'mammifere'})
create (cb : veterinaire {nom : 'Bennett', prenom : 'Cybil', dateNaissance : datetime('1980-12-08'), adresse : 'Saint-Andre', numero : '0666564529', specialite : 'reptile'})
create (ag : veterinaire {nom : 'Gillespie', prenom : 'Alessa', dateNaissance : datetime('1960-10-08'), adresse : 'Saint-Brieux', numero : '0662565859', specialite : 'oiseau'})
create (mk : veterinaire {nom : 'Kaufmann', prenom : 'Michael', dateNaissance : datetime('1965-05-23'), adresse : 'Saint-Ange', numero : '0646564595', specialite : 'reptile'})
create (js : veterinaire {nom : 'Sunderland', prenom : 'James', dateNaissance : datetime('1975-06-16'), adresse : 'Saint-Mils', numero : '0648264459', specialite : 'oiseau'})


// Animal 
create (filou : animal {nom : 'Filou', poids : 5, taille : 45, espece : 'chat'})
create (izao : animal {nom : 'Izao', poids : 7, taille : 55, espece : 'chien'})
create (cristale : animal {nom : 'Cristale', poids : 8, taille : 60, espece : 'chien'})
create (sunny : animal {nom : 'Sunny', poids : 6, taille : 40, dateNaissance : datetime('2014-12-15'), espece : 'chien'})
create (bob : animal {nom : 'Bob', poids : 20, taille : 40, dateNaissance : datetime('2013-12-15'), espece : 'anaconda'})
create (margerite : animal {nom : 'Margerite', poids : 600, taille : 80, dateNaissance : datetime('2018-12-15'), espece : 'vache'})


// Medicament 
create (milbemax : medicament {nomMolecule : 'MILBEMAX', description : 'Antiparasitaire (milbémycine et praziquantel) contre les cestodes et les nématodes des chiens'})
create (animazen : medicament {nomMolecule : 'ANIMAZEN', description : 'Aliment complémentaire pour les périodes de stress chez les chiens, chats.'})
create (ocevit : medicament {nomMolecule : 'OCEVIT', description : 'Aliment complémentaire chez les oiseaux de cage et de voliere'})
create (actidralyte : medicament {nomMolecule : 'ACTIDRALYTE', description : 'Aliment complémentaire pour compenser la perte en électrolytes chez les poulains, veaux, agneaux, chevreaux et porcelets'})
create (acticarp : medicament {nomMolecule : 'ACTICARP', description : 'Anti-inflammatoire non-stéroïdien (carprofène) en solution injectable pour bovins'})
create (calciumreptile : medicament {nomMolecule : 'CALCIUM REPTILE', description : 'Aliment complémentaire pour assurer la solidité de la carapace et du squelette chez les reptiles'})
create (vitareptile : medicament {nomMolecule : 'VITA REPTILE', description : 'Aliment complémentaire riche en vitamine pour reptiles'})



// Possede (proprietaire => animal) 
create (mg)-[r1:POSSEDE]->(filou)
create (mg)-[r2:POSSEDE]->(bob)
create (mg)-[r3:POSSEDE]->(margerite)
create (la) -[s:POSSEDE]->(sunny)
create (md) -[t:POSSEDE]->(izao)
create (mh) -[u:POSSEDE]->(cristale)


// Traitements 
create (trait1:Traitements {type: "Traitements", debut: datetime('2019-08-15'), duree: 10})
create (hm)-[l:DONNES]->(trait1)
create (filou)<-[l1:TRAITEMENTS]-(trait1)
create (trait1)<-[l2:COMPOSANT {quantite:3}]-(animazen)

create (trait2:Traitements {type: "Traitements", debut: datetime('2019-07-5'), duree: 40})
create (cb)-[l3:DONNES]->(trait2)
create (bob)<-[l4:TRAITEMENTS]-(trait2)
create (trait2)<-[l5:COMPOSANT {quantite: 3}]-(vitareptile)
create (trait2)<-[l6:COMPOSANT {quantite: 3}]-(calciumreptile)


create (trait3:Traitements {type: "Traitements", debut: datetime('2019-10-10'), duree: 5})
create (hm)-[l7:DONNES]->(trait3)
create (margerite)<-[l8:TRAITEMENTS]-(trait3)
create (trait3)<-[l9:COMPOSANT {quantite:3}]-(acticarp)
create (trait3)<-[l10:COMPOSANT {quantite:1}]-(actidralyte)


create (trait4:Traitements {type: "Traitements", debut: datetime('2019-09-10'), duree: 5})
create (hm)-[l11:DONNES]->(trait4)
create (cristale)<-[l12:TRAITEMENTS]-(trait4)
create (trait4)<-[l13:COMPOSANT {quantite: 3}]-(milbemax)


with mg, la, md, mh, hm, cb, ag, mk, js, filou, cristale, sunny, bob, margerite, milbemax, animazen, ocevit, actidralyte, acticarp, calciumreptile, vitareptile
match p=()-->() return p
