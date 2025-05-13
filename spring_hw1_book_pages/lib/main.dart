import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Simple Book App', home: BookScreen());
  }
}

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Simple Book'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: BookPagesView(),
    );
  }
}

class BookPagesView extends StatelessWidget {
  final List<Widget> bookContentPages = [
    SinglePage(
      pageNumber: 1,
      textContent: 'Swipe left to see the next page.',
      pageColor: Colors.white,
    ),
    SinglePage(
      pageNumber: 2,
      textContent: 'This is the second page of book.',
      pageColor: Colors.lightBlue[100]!,
    ),
    SinglePage(
      pageNumber: 3,
      textContent: 'This is the third page of book.',
      pageColor: Colors.lightGreen[100]!,
    ),
    SinglePage(
      pageNumber: 4,
      textContent: 'This is the final page.',
      pageColor: Colors.orange[100]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(children: bookContentPages);
  }
}

class SinglePage extends StatelessWidget {
  final int pageNumber;
  final String textContent;
  final Color pageColor;

  SinglePage({
    required this.pageNumber,
    required this.textContent,
    required this.pageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageColor,
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                textContent,
                style: TextStyle(fontSize: 20.0, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Text(
            'Page $pageNumber',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
