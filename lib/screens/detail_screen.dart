import 'package:flutter/material.dart';

import '../models/livre.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.livre,
  });

  final Livre livre;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Livre _livre;

  @override
  void initState() {
    super.initState();
    _livre = widget.livre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_livre.titre),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                color: _livre.couleur,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                child: Text(
                  _livre.titre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Auteur'),
                subtitle: Text(_livre.auteur),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Année'),
                subtitle: Text('${_livre.annee}'),
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Genre'),
                subtitle: Text(_livre.genre),
              ),
              OverflowBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _livre = _livre.copyWith(favori: !_livre.favori);
                      });
                    },
                    icon: Icon(
                      _livre.favori ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: Text(
                      _livre.favori ? 'Retirer des favoris' : 'Ajouter aux favoris',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _livre = _livre.copyWith(lu: !_livre.lu);
                      });
                    },
                    icon: Icon(
                      _livre.lu ? Icons.check_box : Icons.check_box_outline_blank,
                    ),
                    label: Text(
                      _livre.lu ? 'Marquer comme non lu' : 'Marquer comme lu',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
