

import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: ListTile.divideTiles(
          context: context,
          tiles: const [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mon profil'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Confidentialité'),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Langue'),
            ),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text('Apparence'),
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('Stockage'),
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Sécurité'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Aide'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
