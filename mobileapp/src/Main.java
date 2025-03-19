import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Login & Calculator',
                theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final String correctUsername = "user";
    final String correctPassword = "1234";

    void login() {
        if (usernameController.text == correctUsername && passwordController.text == correctPassword) {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorPage()),
      );
        } else {
            ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid username or password')),
      );
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(title: Text('Login')),
        body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
            ),
        TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
            ),
        SizedBox(height: 20),
        ElevatedButton(
                onPressed: login,
                child: Text('Login'),
            ),
          ],
        ),
      ),
    );
    }
}

class CalculatorPage extends StatefulWidget {
    @override
    _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
    String output = "0";
    String _output = "0";
    double num1 = 0;
    double num2 = 0;
    String operand = "";

    void buttonPressed(String buttonText) {
        if (buttonText == "C") {
            _output = "0";
            num1 = 0;
            num2 = 0;
            operand = "";
        } else if (buttonText == "=") {
            num2 = double.parse(output);
            if (operand == "+") {
                _output = (num1 + num2).toString();
            } else if (operand == "-") {
                _output = (num1 - num2).toString();
            } else if (operand == "x") {
                _output = (num1 * num2).toString();
            } else if (operand == "/") {
                _output = (num1 / num2).toString();
            }
            num1 = 0;
            num2 = 0;
            operand = "";
        } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
            num1 = double.parse(output);
            operand = buttonText;
            _output = "0";
        } else {
            _output += buttonText;
        }
        setState(() {
            output = _output;
        });
    }

    Widget buildButton(String buttonText) {
        return Expanded(
                child: ElevatedButton(
                onPressed: () => buttonPressed(buttonText),
                child: Text(buttonText, style: TextStyle(fontSize: 24)),
      ),
    );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(title: Text('Calculator')),
        body: Column(
                children: [
        Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(output, style: TextStyle(fontSize: 48)),
          ),
        Expanded(child: Divider()),
        Column(
                children: [
        Row(children: [buildButton("7"), buildButton("8"), buildButton("9"), buildButton("/")]),
        Row(children: [buildButton("4"), buildButton("5"), buildButton("6"), buildButton("x")]),
        Row(children: [buildButton("1"), buildButton("2"), buildButton("3"), buildButton("-")]),
        Row(children: [buildButton("C"), buildButton("0"), buildButton("="), buildButton("+")]),
            ],
          )
        ],
      ),
    );
    }
}
