import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Импортируем библиотеку для математических выражений

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '';

  // Функция для обновления экрана калькулятора
  void _onButtonPressed(String value) {
    setState(() {
      _display += value;
    });
  }

  // Функция для выполнения вычислений
  void _calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_display); // Парсим выражение
      ContextModel cm = ContextModel();
      double result = exp.evaluate(
        EvaluationType.REAL,
        cm,
      ); // Выполняем вычисление

      setState(() {
        _display = result.toString();
      });
    } catch (e) {
      setState(() {
        _display = 'Ошибка';
      });
    }
  }

  // Функция для очистки экрана
  void _clear() {
    setState(() {
      _display = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Калькулятор")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_display, style: TextStyle(fontSize: 40)),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                List<String> buttons = [
                  '7',
                  '8',
                  '9',
                  '/',
                  '4',
                  '5',
                  '6',
                  '*',
                  '1',
                  '2',
                  '3',
                  '-',
                  'C',
                  '0',
                  '=',
                  '+',
                ];
                return ElevatedButton(
                  onPressed: () {
                    if (buttons[index] == '=') {
                      _calculate();
                    } else if (buttons[index] == 'C') {
                      _clear();
                    } else {
                      _onButtonPressed(buttons[index]);
                    }
                  },
                  child: Text(buttons[index], style: TextStyle(fontSize: 24)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
