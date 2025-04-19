import 'package:flutter/material.dart';
import 'db/database_helper.dart';  // Импортируем нашу базу данных

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final dbHelper = DatabaseHelper();  // Экземпляр DatabaseHelper

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SQLite Example')),  // Заголовок приложения
        body: MyHomePage(dbHelper: dbHelper),  // Тело с передачей dbHelper
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final DatabaseHelper dbHelper;
  MyHomePage({required this.dbHelper});  // Принимаем экземпляр DatabaseHelper

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();  // Контроллер для поля ввода
  List<String> usernames = [];  // Список для хранения пользователей

  // Метод для сохранения имени в базу данных
  void _saveUsername() async {
    final username = _controller.text;
    await widget.dbHelper.insertUser(username);  // Сохраняем в базе
    List<String> allUsers = await widget.dbHelper.getUsers();  // Получаем все имена пользователей
    setState(() {
      usernames = allUsers;  // Обновляем состояние, чтобы отобразить список
    });
  }

  // Инициализация данных при старте экрана
  @override
  void initState() {
    super.initState();
    widget.dbHelper.getUsers().then((list) {
      setState(() {
        usernames = list;  // Загружаем пользователей при запуске
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),  // Отступы
      child: Column(
        children: [
          // Поле ввода для имени пользователя
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter username'),  // Текстовая метка
          ),
          SizedBox(height: 10),
          // Кнопка для сохранения имени в базе данных
          ElevatedButton(
            onPressed: _saveUsername,  // Вызов метода сохранения
            child: Text('Save to DataBase'),
          ),
          SizedBox(height: 20),
          // Текст для отображения списка сохранённых пользователей
          Text('Saved Users:'),
          // Отображаем список сохранённых пользователей
          ...usernames.map((name) => Text(name)).toList(),
        ],
      ),
    );
  }
}
