import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'auth_page.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 48.0;
  double resultFontSize = 64.0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.length > 1 ? equation.substring(0, equation.length - 1) : "0";
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          final exp = Parser().parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equation = equation == "0" ? buttonText : equation + buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, Color bgColor, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bgColor),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            // Display section for equation and result
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Text(
                equation,
                style: TextStyle(fontSize: equationFontSize, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Divider(color: Colors.white54),
            // Calculator buttons
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("C", Colors.redAccent, Colors.white),
                        buildButton("⌫", Colors.blueGrey, Colors.white),
                        buildButton("÷", Colors.blue, Colors.white),
                        buildButton("×", Colors.blue, Colors.white),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7", Colors.grey.shade800, Colors.white),
                        buildButton("8", Colors.grey.shade800, Colors.white),
                        buildButton("9", Colors.grey.shade800, Colors.white),
                        buildButton("-", Colors.blue, Colors.white),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4", Colors.grey.shade800, Colors.white),
                        buildButton("5", Colors.grey.shade800, Colors.white),
                        buildButton("6", Colors.grey.shade800, Colors.white),
                        buildButton("+", Colors.blue, Colors.white),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1", Colors.grey.shade800, Colors.white),
                        buildButton("2", Colors.grey.shade800, Colors.white),
                        buildButton("3", Colors.grey.shade800, Colors.white),
                        buildButton("=", Colors.redAccent, Colors.white),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0", Colors.grey.shade800, Colors.white),
                        buildButton(".", Colors.grey.shade800, Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}