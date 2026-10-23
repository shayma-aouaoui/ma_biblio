# Partie 06 — Grilles Flutter

| Constructeur | Nombre de colonnes | Génération des éléments | Cas d'usage conseillé |
| --- | --- | --- | --- |
| `GridView.count` | Fixe (`crossAxisCount`) | Tous les enfants sont créés avec `children` | Petite grille dont le nombre d'éléments est limité et connu |
| `GridView.extent` | Adaptatif selon `maxCrossAxisExtent` | Tous les enfants sont créés avec `children` | Petite grille qui doit adapter ses colonnes à la largeur disponible |
| `GridView.builder` | Défini par son `gridDelegate` (fixe ou adaptatif) | À la demande, au fur et à mesure du défilement | Grille longue ou dynamique, pour limiter le travail et la mémoire |

`SliverGridDelegateWithMaxCrossAxisExtent` reproduit le comportement de `GridView.extent`.
Dans la galerie finale, le délégué à nombre fixe est utilisé avec des seuils de largeur
explicites afin de respecter les règles responsive demandées : 2 colonnes sous 600 px,
3 jusqu'à 900 px et 4 au-delà.

Comme les constructeurs `GridView.count` et `GridView.extent` prennent une liste
`children`, ils construisent tous les éléments immédiatement. Pour une très grande
collection, il vaut mieux utiliser `GridView.builder`, qui construit les éléments
visibles à la demande.
