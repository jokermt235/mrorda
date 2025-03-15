import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = "";
  String output = "0";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        output = "0";
      } else if (value == "=") {
        try {
          output = evaluateExpression(input);
        } catch (e) {
          output = "Error";
        }
      } else {
        input += value;
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      return expression.isNotEmpty
          ? "${double.parse(expression.replaceAll('×', '*').replaceAll('÷', '/'))}"
          : "0";
    } catch (e) {
      return "Error";
    }
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color,
        ),
        onPressed: () => onButtonPressed(text),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Calculator", style: GoogleFonts.poppins()),
          backgroundColor: Colors.grey[900],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  input,
                  style: GoogleFonts.poppins(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  output,
                  style: GoogleFonts.poppins(fontSize: 48, color: Colors.green),
                ),
              ),
            ),
            Divider(color: Colors.grey),
            Column(
              children: [
                Row(
                  children: ["7", "8", "9", "÷"].map((e) => buildButton(e, Colors.grey[800]!)).toList(),
                ),
                Row(
                  children: ["4", "5", "6", "×"].map((e) => buildButton(e, Colors.grey[800]!)).toList(),
                ),
                Row(
                  children: ["1", "2", "3", "-"].map((e) => buildButton(e, Colors.grey[800]!)).toList(),
                ),
                Row(
                  children: ["C", "0", "=", "+"].map((e) => buildButton(e, e == "C" ? Colors.red : Colors.grey[800]!)).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
