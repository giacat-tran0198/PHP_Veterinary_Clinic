# Note de clarification - MongoDB

Cette note de clarification apporte des précisions sur la conception de la base de données de la clinique vétérinaire, en utilisant MongoDB.

## Objets de la base de données

Tous les objets de la conception initiale en relationnel n'ont pas été retenus. Les objets conservés sont :

- Animal
- Client
- Espece
- ClasseEspece
- Traitement
- Medicament

Pour des raisons techniques, la base de données ne vérifiera plus si les médicaments prescrits sont bien autorisés pour l'espèce de l'animal traité.