// This is a basic Flutter widget test for search Bar in searchTab.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_muhammad/Components/SearchBar.dart';

import 'package:test_muhammad/UI/HomeScreen/Tabs/SearchTab.dart';


void main() {
  testWidgets('search test starts here', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SearchTab(),
      ),
    );
    expect(find.byElementType(SearchBar), findsOneWidget);
    await tester.tap(find.byElementType(SearchBar));

    //Here you want to be sure that your page is shown
    expect(find.byElementType(SearchBar), findsOneWidget);
  });

}
