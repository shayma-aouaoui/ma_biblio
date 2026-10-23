import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ma_biblio/main.dart';
import 'package:ma_biblio/screens/galerie_screen.dart';

void main() {
  testWidgets('MyApp displays the welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue dans MaBiblio'), findsOneWidget);
    expect(find.text('Voir le catalogue'), findsOneWidget);
  });

  testWidgets('Gallery switches views and opens book details',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: GalerieScreen()));

    expect(find.byType(GridView), findsOneWidget);
    await tester.tap(find.byTooltip('Afficher la liste'));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);

    await tester.tap(find.text('Le Petit Prince').first);
    await tester.pumpAndSettle();
    expect(find.text('A. de Saint-Exupéry'), findsOneWidget);
  });
}
