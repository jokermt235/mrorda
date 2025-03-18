import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SumScreen());
  }
}

class SumScreen extends StatefulWidget {
  @override
  _SumScreenState createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);

    if (num1 != null && num2 != null) {
      setState(() {
        _result = (num1 + num2).toString();
      });
    } else {
      setState(() {
        _result = 'enter valid numbers';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sum Calculator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    child: TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        hintText: 'Num 1',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('+', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 20),
                  Container(
                    width: 80,
                    child: TextField(
                      controller: _controller2,
                      decoration: InputDecoration(
                        hintText: 'Num 2',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('=', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 20),
                  Container(
                    width: 80,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Result',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: OutlineInputBorder(),
                      ),
                      controller: TextEditingController(text: _result),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateSum,
                child: Text('Calculate Sum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
