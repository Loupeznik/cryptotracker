// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cryptotracker/screens/popular_coins.dart';
import 'package:cryptotracker/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PopularCoinsScreen());

    expect(find.byType(ListItem), findsWidgets);
    expect(find.byIcon(Icons.favorite_border), findsWidgets);

    await tester.tap(find.byType(ListItem));
    await tester.pump();

    expect(find.byWidget(const CircularProgressIndicator()), findsOneWidget);
  });
}
