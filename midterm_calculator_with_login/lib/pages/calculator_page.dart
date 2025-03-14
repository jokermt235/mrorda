import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = ''; 
  String _output = ''; 
  double? num1, num2;
  String? operation;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '';
        num1 = num2 = null;
        operation = null;
      } else if (value == '=') {
        if (num1 != null && operation != null && _input.isNotEmpty) {
          num2 = double.tryParse(_input);
          if (num2 != null) {
            switch (operation) {
              case '+':
                _output = (num1! + num2!).toString();
                break;
              case '-':
                _output = (num1! - num2!).toString();
                break;
              case '*':
                _output = (num1! * num2!).toString();
                break;
              case '/':
                _output = num2 == 0 ? 'Error' : (num1! / num2!).toString();
                break;
            }
            _input = _output;
            num1 = null;
            num2 = null;
            operation = null;
          }
        }
      } else if ('+-*/'.contains(value)) {
        if (_input.isNotEmpty) {
          num1 = double.tryParse(_input);
          operation = value;
          _input = '';
        }
      } else {
        _input += value;
      }
    });
  }

  Widget _buildButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: color ?? Colors.pink[100],
            padding: EdgeInsets.all(20),
            elevation: 5,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.purple[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                _output.isNotEmpty ? _output : _input,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purple[900]),
              ),
            ),
          ),
          Divider(thickness: 2, color: Colors.purple[300]),
          Column(
            children: [
              Row(
                children: ['7', '8', '9', '/']
                    .map((btn) => _buildButton(btn, color: Colors.purple[100]))
                    .toList(),
              ),
              Row(
                children: ['4', '5', '6', '*']
                    .map((btn) => _buildButton(btn, color: Colors.purple[100]))
                    .toList(),
              ),
              Row(
                children: ['1', '2', '3', '-']
                    .map((btn) => _buildButton(btn, color: Colors.purple[100]))
                    .toList(),
              ),
              Row(
                children: [
                  _buildButton('C', color: Colors.pink[200], textColor: Colors.white),
                  _buildButton('0', color: Colors.pink[100]),
                  _buildButton('=', color: Colors.pink[200], textColor: Colors.white),
                  _buildButton('+', color: Colors.purple[100]),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
