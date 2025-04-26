import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fin_riverpod/main.dart'; // use your correct project name

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BookApp()); // match your main widget name

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
