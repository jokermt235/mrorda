import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = "Нажмите кнопку для выполнения операции";

  // Функция, которая возвращает Future
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Симуляция задержки
    // Исключение может быть выброшено
    if (DateTime.now().second % 2 == 0) {
      throw Exception('Ошибка при получении данных');
    }
    return "Данные успешно получены!";
  }

  // Метод для выполнения операции с обработкой ошибок
  void _getData() {
    setState(() {
      _result = "Загрузка...";
    });

    // Используем try, catch и then для обработки результатов
    fetchData()
        .then((data) {
          setState(() {
            _result = data; // Успешный результат
          });
        })
        .catchError((error) {
          setState(() {
            _result = error.toString(); // Обработка ошибки
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Try-Catch-Then Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _getData, child: Text("Получить данные")),
          ],
        ),
      ),
    );
  }
}
