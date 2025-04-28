import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String themePreference;

  const SettingsScreen({super.key, required this.themePreference});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Theme: $themePreference'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}