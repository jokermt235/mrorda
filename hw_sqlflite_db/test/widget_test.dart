import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw_sqlflite_db/main.dart';

void main() {
  testWidgets('Add note and check if it appears in list', (WidgetTester tester) async {
    await tester.pumpWidget(NoteApp());

    expect(find.byType(ListTile), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'Test Title');
    await tester.enterText(find.byType(TextField).at(1), 'Test Content');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });

  testWidgets('Delete note and check if it is removed from list', (WidgetTester tester) async {
    await tester.pumpWidget(NoteApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'Test Title');
    await tester.enterText(find.byType(TextField).at(1), 'Test Content');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsNothing);
  });
}
