
import 'package:flutter/material.dart';

class Livre {
  final String titre;
  final String auteur;
  final int annee;
  final Color couleur;
  final double note;
  final bool nouveaute;

  const Livre({
    required this.titre,
    required this.auteur,
    required this.annee,
    required this.couleur,
    required this.note,
    this.nouveaute = false,
  });
}
