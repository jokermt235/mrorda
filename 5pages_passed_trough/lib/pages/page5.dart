import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  final String info;
  const Page5({required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 5')),
      body: Center(
        child: Image.network(
          'https://kg.akipress.org/ui-jslib/20151210aitmatov/images/b92fff97-3f84-4290-b8ef-6639d1f20b01__open_kg.jpg',
        ),
      ),
    );
  }
}
