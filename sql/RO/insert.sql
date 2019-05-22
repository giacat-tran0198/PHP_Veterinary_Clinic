INSERT INTO CLASSE
VALUES ('mammifere');
INSERT INTO CLASSE
VALUES ('reptile');
INSERT INTO CLASSE
VALUES ('oiseau');

INSERT INTO ESPECE
VALUES ('chat', (SELECT ref(c) FROM Classe c WHERE c.nom = 'mammifere'));
INSERT INTO Espece
VALUES ('chien', (SELECT ref(c) FROM Classe c WHERE c.nom = 'mammifere'));
INSERT INTO Espece
VALUES ('anaconda', (SELECT ref(c) FROM Classe c WHERE c.nom = 'reptile'));
INSERT INTO Espece
VALUES ('perroquet', (SELECT ref(c) FROM Classe c WHERE c.nom = 'oiseau'));
INSERT INTO Espece
VALUES ('vache', (SELECT ref(c) FROM Classe c WHERE c.nom = 'mammifere'));


INSERT INTO VETERINAIRE
VALUES (TYP_VETERINAIRE(1, 'Harry'));
INSERT INTO VETERINAIRE
VALUES (TYP_VETERINAIRE(2, 'Cybil'));
INSERT INTO VETERINAIRE
VALUES (TYP_VETERINAIRE(3, 'Alessa'));
INSERT INTO VETERINAIRE
VALUES (TYP_VETERINAIRE(4, 'Michael'));
INSERT INTO VETERINAIRE
VALUES (TYP_VETERINAIRE(5, 'James'));

INSERT INTO CLIENT
VALUES ('Guerin', 'Maurice', to_date('1940-04-04', 'yyyy-mm-dd'), 'Saint-Andre', '0643564829',
        liste_animaux(
            TYP_ANIMAL(
                'Filou', 5, 45, NULL,
                (SELECT ref(e) FROM Espece e WHERE e.NOM = 'chat'),
                LISTE_TRAITEMENTS(
                    TYP_TRAITEMENT(
                        TYP_VETERINAIRE(1, 'Harry'),
                        to_date('2019-08-15', 'yyyy-mm-dd'), 10,
                        LISTE_MEDICAMENT(
                            TYP_MEDICAMENT('ANIMAZEN')
                          )
                      )
                  )
              ),
            TYP_ANIMAL(
                'Bob', 20, 40, to_date('2013-12-15', 'yyyy-mm-dd'),
                (SELECT ref(e) FROM Espece e WHERE e.NOM = 'anaconda'),
                LISTE_TRAITEMENTS(
                    TYP_TRAITEMENT(
                        TYP_VETERINAIRE(2, 'Cybil'),
                        to_date('2019-07-5', 'yyyy-mm-dd'), 40,
                        LISTE_MEDICAMENT(
                            TYP_MEDICAMENT('VITA REPTILE'),
                            TYP_MEDICAMENT('CALCIUM REPTILE')
                          )
                      )
                  )
              ),
            TYP_ANIMAL(
                'Margerite', 600, 80, to_date('2018-12-15', 'yyyy-mm-dd'),
                (SELECT REF(e) FROM Espece e WHERE e.NOM = 'vache'),
                LISTE_TRAITEMENTS(
                    TYP_TRAITEMENT(
                        TYP_VETERINAIRE(3, 'Alessa'),
                        to_date('2019-10-10', 'yyyy-mm-dd'), 5,
                        LISTE_MEDICAMENT(
                            TYP_MEDICAMENT('ACTICARP'),
                            TYP_MEDICAMENT('ACTIDRALYTE')
                          )
                      )
                  )
              )));
INSERT INTO CLIENT
VALUES ('Allaire', 'Laurence', to_date('1969-02-04', 'yyyy-mm-dd'), 'Saint-Molf', '0761444829',
        liste_animaux(
            TYP_ANIMAL(
                'Sunny', 6, 40, to_date('2014-12-15', 'yyyy-mm-dd'),
                (SELECT ref(e) FROM Espece e WHERE e.NOM = 'chien'),
                NULL
              )
          ));

INSERT INTO CLIENT
VALUES ('Danilo', 'Melani', to_date('1999-04-15', 'yyyy-mm-dd'), 'Guerande', '0643784890',
        liste_animaux(
            TYP_ANIMAL(
                'Izao', 7, 55, NULL,
                (SELECT ref(e) FROM Espece e WHERE e.NOM = 'chien'),
                NULL
              )
          ));

INSERT INTO CLIENT
VALUES ('Halgand', 'Melanie', to_date('1998-01-01', 'yyyy-mm-dd'), 'Herbignac', '0656764829',
        liste_animaux(
            TYP_ANIMAL(
                'Cristale', 8, 60, NULL,
                (SELECT ref(e) FROM Espece e WHERE e.NOM = 'chien'),
                LISTE_TRAITEMENTS(
                    TYP_TRAITEMENT(
                        TYP_VETERINAIRE(1, 'Harry'),
                        to_date('2019-09-10', 'yyyy-mm-dd'), 5,
                        LISTE_MEDICAMENT(
                            TYP_MEDICAMENT('MILBEMAX')
                          )
                      )
                  )
              )
          ));