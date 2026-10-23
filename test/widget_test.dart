import 'package:flutter_test/flutter_test.dart';

import 'package:ma_biblio/main.dart';

void main() {
  testWidgets('MyApp displays the welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bienvenue dans MaBiblio'), findsOneWidget);
    expect(find.text('Voir le catalogue'), findsOneWidget);
  });
}
