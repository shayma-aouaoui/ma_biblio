
import 'package:flutter/material.dart';
import '../models/livre.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  static final List<Livre> livres = livres;

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
      subtitle: Text('${livre.auteur} • ${livre.genre} • ${livre.annee}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 18),
          const SizedBox(width: 4),
          Text(livre.note.toString()),
          const SizedBox(width: 8),
          Icon(
            livre.favori ? Icons.favorite : Icons.favorite_border,
            color: livre.favori ? Colors.red : Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Livre> nouveautes = livres.where((livre) => livre.nouveaute).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue des livres'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Tout le catalogue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: livres.length,
              itemBuilder: (context, index) {
                return livreTile(livres[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(indent: 72, thickness: 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
