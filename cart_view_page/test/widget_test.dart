import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cart_view_page/main.dart';

void main() {
  testWidgets('MyApp renders without errors', (WidgetTester tester) async {
    // Запускаем приложение
    await tester.pumpWidget(const MyApp());

    // Проверяем, что MaterialApp создан
    expect(find.byType(MaterialApp), findsOneWidget);

    // Проверяем, что на главной странице есть заголовок 'Home Page'
    expect(find.text('Home Page'), findsOneWidget);
  });
}