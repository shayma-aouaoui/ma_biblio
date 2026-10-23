
import 'package:flutter/material.dart';

class Livre {
  final int id;
  final String titre;
  final String auteur;
  final String genre;
  final int annee;
  final Color couleur;
  final double note;
  final bool nouveaute;
  final bool favori;
  final bool lu;

  const Livre({
    required this.id,
    required this.titre,
    required this.auteur,
    required this.genre,
    required this.annee,
    required this.couleur,
    required this.note,
    this.nouveaute = false,
    this.favori = false,
    this.lu = false,
  });

  Livre copyWith({
    int? id,
    String? titre,
    String? auteur,
    String? genre,
    int? annee,
    Color? couleur,
    double? note,
    bool? nouveaute,
    bool? favori,
    bool? lu,
  }) {
    return Livre(
      id: id ?? this.id,
      titre: titre ?? this.titre,
      auteur: auteur ?? this.auteur,
      genre: genre ?? this.genre,
      annee: annee ?? this.annee,
      couleur: couleur ?? this.couleur,
      note: note ?? this.note,
      nouveaute: nouveaute ?? this.nouveaute,
      favori: favori ?? this.favori,
      lu: lu ?? this.lu,
    );
  }
}
