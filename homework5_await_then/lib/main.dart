import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureTestScreen(),
    );
  }
}

class FutureTestScreen extends StatefulWidget {
  @override
  _FutureTestScreenState createState() => _FutureTestScreenState();
}

class _FutureTestScreenState extends State<FutureTestScreen> {
  String _result = "Нажмите кнопку, чтобы загрузить данные";

  // Метод, который симулирует загрузку данных с задержкой
  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Задержка в 2 секунды
    return "Данные успешно загружены!";
  }

  // Метод, который вызывает Future и обновляет UI
  void _loadData() {
    setState(() {
      _result = "Загрузка...";
    });

    _fetchData()
        .then((data) {
          setState(() {
            _result = data;
          });
        })
        .catchError((error) {
          setState(() {
            _result = "Ошибка загрузки данных";
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Тестирование Future"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadData,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text("Загрузить данные", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
