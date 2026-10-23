import 'package:flutter/material.dart';

import '../data/livres_data.dart';
import '../models/livre.dart';
import '../widgets/livre_card.dart';
import '../widgets/livre_grid_item.dart';
import 'detail_screen.dart';

class GalerieScreen extends StatefulWidget {
  const GalerieScreen({super.key});

  @override
  State<GalerieScreen> createState() => _GalerieScreenState();
}

class _GalerieScreenState extends State<GalerieScreen> {
  late final List<Livre> _livres = List<Livre>.of(livres);
  bool _afficherGrille = true;

  void _trierParNote() {
    setState(() {
      _livres.sort((a, b) => b.note.compareTo(a.note));
    });
  }

  void _ouvrirDetail(Livre livre) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetailScreen(livre: livre),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final largeur = MediaQuery.of(context).size.width;
    final colonnes = largeur < 600
        ? 2
        : largeur <= 900
            ? 3
            : 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galerie'),
        actions: [
          IconButton(
            tooltip: _afficherGrille ? 'Afficher la liste' : 'Afficher la grille',
            icon: Icon(_afficherGrille ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _afficherGrille = !_afficherGrille;
              });
            },
          ),
          IconButton(
            tooltip: 'Trier par note décroissante',
            icon: const Icon(Icons.sort),
            onPressed: _trierParNote,
          ),
        ],
      ),
      body: _afficherGrille
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: _livres.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: colonnes,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final livre = _livres[index];
                  return LivreGridItem(
                    livre: livre,
                    onTap: () => _ouvrirDetail(livre),
                  );
                },
              ),
            )
          : ListView.builder(
              itemCount: _livres.length,
              itemBuilder: (context, index) {
                final livre = _livres[index];
                return LivreCard(
                  livre: livre,
                  onTap: () => _ouvrirDetail(livre),
                );
              },
            ),
    );
  }
}
