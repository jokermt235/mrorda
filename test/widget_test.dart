import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_shelf_riverpod/main.dart';

void main() {
  testWidgets('Tapping screen changes book title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: BookShelfApp()),
    );

    // Проверяем, что первая книга показана
    expect(find.textContaining('Книга 1'), findsOneWidget);

    // Тапаем по экрану
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Теперь должна отображаться следующая книга
    expect(find.textContaining('Книга 2'), findsOneWidget);
  });
}
