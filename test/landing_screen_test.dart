import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmarrugo_flutter_cats/screens/landing_screen.dart';
import 'package:tmarrugo_flutter_cats/screens/detail_screen.dart';
import 'package:tmarrugo_flutter_cats/providers/providers.dart';

void main() {
  testWidgets('test to load breeds on a list and search it', (WidgetTester tester) async {

    await mockNetworkImagesFor(() async {
      final mockBreeds = [
        {
          'id': 'abys',
          'name': 'Abyssinian',
          'origin': 'Egypt',
          'intelligence': 5,
          'image': {'url': 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg'}
        },
        {
          'id': 'beng',
          'name': 'Bengal',
          'origin': 'United States',
          'intelligence': 5,
          'image': {'url': 'https://cdn2.thecatapi.com/images/O3btzLlsO.png'}
        },
      ];

      final container = ProviderContainer(overrides: [
        breedsProvider.overrideWith((ref) async => mockBreeds),
      ]);

      await tester.pumpWidget(
        ProviderScope(
          parent: container,
          child: MaterialApp(home: LandingScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.widgetWithText(Card, 'Abyssinian'), findsOneWidget);
      expect(find.widgetWithText(Card, 'Bengal'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Bengal');
      await tester.pump();

      expect(find.widgetWithText(Card, 'Abyssinian'), findsNothing);
      expect(find.widgetWithText(Card, 'Bengal'), findsOneWidget);

      await tester.tap(find.widgetWithText(Card, 'Bengal'));
      await tester.pumpAndSettle();

      expect(find.byType(DetailScreen), findsOneWidget);
    });
  });
}
