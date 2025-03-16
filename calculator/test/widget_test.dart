import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:calculator/home_screen.dart';

void main() {
  testWidgets('Calculator screen loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(primaryColor: Colors.orangeAccent),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculator'),
            backgroundColor: Colors.orangeAccent,
          ),
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          body: const HomeScreen(),
        ),
      ),
    );

    // Verify that the calculator screen loads correctly.
    expect(find.text('Calculator'), findsOneWidget);
  });
}