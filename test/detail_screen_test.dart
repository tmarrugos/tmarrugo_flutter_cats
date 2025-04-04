import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:tmarrugo_flutter_cats/screens/detail_screen.dart';

void main() {
  testWidgets('test to detail screen', (WidgetTester tester) async {
    final breedData = {
      'name': 'Abyssinian',
      'origin': 'Egypt',
      'intelligence': 5,
      'adaptability': 5,
      'life_span': '14 - 15',
      'description': 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
      'image': {'url': 'https://example.com/cat.jpg'}
    };

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(home: DetailScreen(breed: breedData),),
      );

      await tester.pumpAndSettle();

      expect(find.text('Abyssinian'), findsOneWidget);

      expect(find.textContaining('Origin: Egypt'), findsOneWidget);
      expect(find.textContaining('Intelligence: 5'), findsOneWidget);
      expect(find.textContaining('Adaptability: 5'), findsOneWidget);
      expect(find.textContaining('Life Span: 14 - 15 years'), findsOneWidget);
      expect(find.textContaining('Description: The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
