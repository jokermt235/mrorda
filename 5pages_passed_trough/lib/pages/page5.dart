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
          'https://herculeanprod.blob.core.windows.net/images/Teams%2Ff7142407-1373-45fd-8ece-3a2eba092809.jpg',
        ),
      ),
    );
  }
}
