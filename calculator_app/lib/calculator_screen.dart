import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Import expressions package
import 'login_screen.dart'; // Assuming you have this file for navigation

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = "";
  String result = "0";

  void onButtonClick(String value) {
    setState(() {
      if (value == "C") {
        expression = "";
        result = "0";
      } else if (value == "=") {
        try {
          final exp = Expression.parse(expression);
          final evaluator = const ExpressionEvaluator();
          final evalResult = evaluator.eval(exp, {});
          result = evalResult.toString();
        } catch (e) {
          result = "Error";
        }
      } else {
        expression += value;
      }
    });
  }

  Widget buildButton(String text, Color color, Color textColor) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Use backgroundColor instead of primary
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: EdgeInsets.all(20),
        ),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 28, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> logout() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200], // Light grey background for the screen
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  expression,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                result,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            Divider(
              color: Colors.deepPurple,
              height: 1,
              thickness: 2,
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("8", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("9", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("/", Colors.deepPurple, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("5", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("6", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("*", Colors.deepPurple, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("2", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("3", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("-", Colors.deepPurple, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("C", Colors.redAccent, Colors.white),
                    buildButton("0", Colors.deepPurple[100]!, Colors.black87),
                    buildButton("=", Colors.deepPurple, Colors.white),
                    buildButton("+", Colors.deepPurple, Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
