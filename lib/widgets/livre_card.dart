import 'package:flutter/material.dart';

import '../models/livre.dart';

class LivreCard extends StatelessWidget {
  const LivreCard({
    super.key,
    required this.livre,
    this.onTap,
  });

  final Livre livre;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shadowColor: Colors.black26,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: livre.couleur,
            child: Text(
              '${livre.id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
