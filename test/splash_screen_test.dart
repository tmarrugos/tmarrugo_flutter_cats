import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmarrugo_flutter_cats/screens/splash_screen.dart';
import 'package:tmarrugo_flutter_cats/screens/landing_screen.dart';

void main() {
  testWidgets('test to open landing from splash', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: SplashScreen())),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Cat Breeds'), findsOneWidget);

    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    await tester.pumpAndSettle();

    expect(find.byType(LandingScreen), findsOneWidget);
  });
}
