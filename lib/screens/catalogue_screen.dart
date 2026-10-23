
import 'package:flutter/material.dart';

import '../data/livres_data.dart' as livres_data;
import '../models/livre.dart';
import 'detail_screen.dart';
import '../widgets/livre_card.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  static final List<Livre> livres = livres_data.livres;

  @override
  Widget build(BuildContext context) {
    final List<Livre> nouveautes = livres.where((livre) => livre.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue des livres'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Nouveautés',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nouveautes.length,
              itemBuilder: (context, index) {
                final livre = nouveautes[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(livre: livre),
                      ),
                    );
                  },
                  child: Container(
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
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Tout le catalogue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: livres.length,
              itemBuilder: (context, index) {
                final livre = livres[index];
                return LivreCard(
                  livre: livre,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(livre: livre),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
