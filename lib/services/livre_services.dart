import '../data/livres_data.dart';
import '../models/livre.dart';

class LivreService {
  const LivreService();

  List<Livre> get tous => livres;

  List<Livre> get nouveautes => livres.where((livre) => livre.nouveaute).toList();

  List<Livre> get favoris => livres.where((livre) => livre.favori).toList();

  List<Livre> parGenre(String genre) {
    return livres.where((livre) => livre.genre == genre).toList();
  }
}
