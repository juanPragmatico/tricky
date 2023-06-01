import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictaetoc/main.dart';

void main() {
  testWidgets('Tic Tac Toe should have a 3x3 grid of buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final buttons = find.byType(GestureDetector);
    expect(buttons, findsNWidgets(9));
  });

  testWidgets('Tic Tac Toe should switch players after marking a square',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final button0 = find.widgetWithText(Text, '');
    await tester.tap(button0);
    await tester.pump();
    final button1 = find.widgetWithText(Text, 'X');
    await tester.tap(button1);
    await tester.pump();
    final button2 = find.widgetWithText(Text, '');
    expect(button2, findsOneWidget);
  });
}
