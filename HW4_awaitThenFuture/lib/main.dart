import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exception Handling Demo')),
        body: Center(child: DataFetcher()),
      ),
    );
  }
}

class DataFetcher extends StatefulWidget {
  @override
  _DataFetcherState createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  String message = "Loading data...";

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  Future<void> retrieveData() async {
    try {
      String data = await simulateNetworkRequest();
      setState(() {
        message = data;
      });
    } catch (error) {
      setState(() {
        message = 'Error: Unable to fetch data. $error';
      });
    }
  }

  Future<String> simulateNetworkRequest() async {
    await Future.delayed(Duration(seconds: 3));

    return 'Data has been successfully retrieved!';
  }

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(fontSize: 22, color: Colors.blue));
  }
}
