

import 'package:flutter/material.dart';
import '../models/livre.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  // Liste des livres (données d'exemple).
  static final List<Livre> livres = [
    Livre(
      id: 1,
      titre: 'Le Petit Prince',
      auteur: 'Antoine de Saint-Exupéry',
      genre: 'Jeunesse',
      annee: 1943,
      note: 4.8,
      couleur: Colors.blue,
      nouveaute: true,
    ),
    Livre(
      id: 2,
      titre: 'Les Misérables',
      auteur: 'Victor Hugo',
      genre: 'Roman',
      annee: 1862,
      note: 4.7,
      couleur: Colors.red,
    ),
    Livre(
      id: 3,
      titre: 'L’Étranger',
      auteur: 'Albert Camus',
      genre: 'Roman',
      annee: 1942,
      note: 4.5,
      couleur: Colors.green,
      nouveaute: true,
    ),
    Livre(
      id: 4,
      titre: 'Clean Code',
      auteur: 'Robert C. Martin',
      genre: 'Informatique',
      annee: 2008,
      note: 4.6,
      couleur: Colors.orange,
    ),
    Livre(
      id: 5,
      titre: 'Une brève histoire du temps',
      auteur: 'Stephen Hawking',
      genre: 'Science',
      annee: 1988,
      note: 4.4,
      couleur: Colors.purple,
      nouveaute: true,
    ),
    Livre(
      id: 6,
      titre: 'Sapiens',
      auteur: 'Yuval Noah Harari',
      genre: 'Histoire',
      annee: 2011,
      note: 4.7,
      couleur: Colors.teal,
    ),
  ];

  // Widget réutilisable pour afficher un livre.
  Widget livreTile(Livre livre) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: livre.couleur,
        child: Text(
          '${livre.id}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(livre.titre),
      subtitle: Text(
        '${livre.auteur} • ${livre.genre} • ${livre.annee}',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(livre.note.toString()),
          const SizedBox(width: 8),
          Icon(
            livre.favori
                ? Icons.favorite
                : Icons.favorite_border,
            color: livre.favori ? Colors.red : Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Q2.7 : filtrer les nouveautés.
    final List<Livre> nouveautes =
        livres.where((livre) => livre.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue des livres'),
      ),

      // Défilement global pour éviter le débordement
      // lorsque la liste verticale utilise shrinkWrap.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Q2.8 : titre de la section nouveautés.
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Nouveautés',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Q2.7 : liste horizontale de 160 pixels.
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nouveautes.length,
                itemBuilder: (context, index) {
                  final livre = nouveautes[index];

                  return Container(
                    width: 110,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: livre.couleur,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      livre.titre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Q2.8 : titre du catalogue complet.
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Tout le catalogue',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Q2.4, Q2.6 et Q2.9 :
            // ListView.separated avec shrinkWrap.
            // Les éléments sont mesurés selon leur contenu.
            // Le défilement vertical est assuré par le parent.
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: livres.length,
              itemBuilder: (context, index) {
                return livreTile(livres[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 72,
                  thickness: 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
