import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Try Catch Example')),
        body: Center(
          child: FutureWidget(),
        ),
      ),
    );
  }
}

class FutureWidget extends StatefulWidget {
  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  String result = "Loading...";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Function simulating a network call with Future
  Future<void> _fetchData() async {
    try {
      // Simulate a network request that might fail
      String data = await fetchDataFromServer();
      setState(() {
        result = data;
      });
    } catch (e) {
      setState(() {
        result = 'Failed to fetch data: $e';
      });
    }
  }

  // Simulating a function that might throw an error
  Future<String> fetchDataFromServer() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Uncomment the following line to simulate an error
    // throw Exception("Network error");

    return 'Data fetched successfully!';
  }

  @override
  Widget build(BuildContext context) {
    return Text(result, style: TextStyle(fontSize: 20));
  }
}
