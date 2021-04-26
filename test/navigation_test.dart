// This is a basic Flutter widget test for navigation in home screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_muhammad/StateManagment/AppSettingsProvider.dart';
import 'package:test_muhammad/UI/HomeScreen/HomeScreen.dart';


void main() {
  testWidgets('Test Navigation Tabs in home screen',
          (WidgetTester tester) async {
        // set & locate the screen
        await tester.pumpWidget(
          MaterialApp(
            home: HomeScreen(),
          ),
        );

        //detect the element on the screen
        expect(find.byElementType(NavigationTab), findsOneWidget);
        await tester.tap(find.byElementType(NavigationTab));
        await tester.pumpAndSettle();

        //Here you want to be sure that your page is shown
        expect(find.byElementType(NavigationTab), findsOneWidget);
      });
}
