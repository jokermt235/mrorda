import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  final String section;
  final String mode;
  const SettingsPage({super.key, required this.section, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Center(
        child: Text("Section: $section\nMode: $mode",
            style: const TextStyle(fontSize: 24), textAlign: TextAlign.center),
      ),
    );
  }
}
