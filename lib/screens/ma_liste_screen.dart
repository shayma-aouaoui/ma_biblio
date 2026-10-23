import 'package:flutter/material.dart';

import '../data/livres_data.dart';
import '../models/livre.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;
  final Map<String, bool> _genres = {
    'Jeunesse': true,
    'Roman': true,
    'Science': true,
    'Histoire': true,
    'Informatique': true,
  };

  late final List<Livre> _livres = List<Livre>.from(livres);

  bool get _tousLesGenresSelectionnes => _genres.values.every((value) => value);
  bool get _aucunGenreSelectionne => _genres.values.every((value) => !value);

  bool? get _etatTousLesGenres {
    if (_tousLesGenresSelectionnes) return true;
    if (_aucunGenreSelectionne) return false;
    return null;
  }

  List<Livre> get _livresFiltres {
    return _livres.where((livre) {
      final genreSelectionne = _genres[livre.genre] ?? false;
      final correspondAuFiltreNouveaute = !_nouveautesSeulement || livre.nouveaute;
      return genreSelectionne && correspondAuFiltreNouveaute;
    }).toList();
  }

  Map<String, IconData> get _iconesGenres => {
    'Jeunesse': Icons.child_care,
    'Roman': Icons.book,
    'Science': Icons.science,
    'Histoire': Icons.account_balance,
    'Informatique': Icons.computer,
  };

  @override
  Widget build(BuildContext context) {
    final livresAffiches = _livresFiltres;
    final livresLus = livresAffiches.where((livre) => livre.lu).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lus : $livresLus / ${livresAffiches.length}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            onChanged: (value) {
              setState(() {
                _nouveautesSeulement = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.green,
          ),
          CheckboxListTile(
            title: const Text('Tous les genres'),
            value: _etatTousLesGenres,
            tristate: true,
            onChanged: (value) {
              final nouvelleValeur = value ?? true;
              setState(() {
                for (final genre in _genres.keys) {
                  _genres[genre] = nouvelleValeur;
                }
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue,
          ),
          ..._genres.keys.map((genre) {
            final nombreLivres = _livres.where((livre) => livre.genre == genre).length;
            return CheckboxListTile(
              key: ValueKey('genre-$genre'),
              secondary: Icon(_iconesGenres[genre] ?? Icons.bookmark, color: Colors.orange),
              title: Text(genre),
              subtitle: Text('$nombreLivres livre${nombreLivres > 1 ? 's' : ''}'),
              value: _genres[genre],
              onChanged: (value) {
                setState(() {
                  _genres[genre] = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.deepPurple,
            );
          }),
          const SizedBox(height: 16),
          const Text(
            'Livres filtrés',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: livresAffiches.length,
            itemBuilder: (context, index) {
              final livre = livresAffiches[index];
              return CheckboxListTile(
                value: livre.lu,
                title: Text(
                  livre.titre,
                  style: TextStyle(
                    decoration: livre.lu ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text('${livre.auteur} • ${livre.genre}'),
                onChanged: (value) {
                  setState(() {
                    final indexDansListe = _livres.indexWhere((item) => item.id == livre.id);
                    if (indexDansListe != -1) {
                      _livres[indexDansListe] = _livres[indexDansListe].copyWith(
                        lu: value ?? false,
                      );
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.teal,
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ],
      ),
    );
  }
}
