// Класс для представления пользователя
class User {
  final int id;
  final String name;
  
  User(this.id, this.name);
  
  @override
  String toString() => 'User(id: $id, name: $name)';
}

// Класс для имитации базы данных
class Database {
  // Имитируем задержку в получении данных
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    
    return [
      User(1, 'Анна'),
      User(2, 'Иван'),
      User(3, 'Мария'),
    ];
  }
  
  // Получение пользователя по ID
  Future<User> getUserById(int id) async {
    final users = await getUsers();
    
    // Имитация задержки обработки
    await Future.delayed(Duration(seconds: 1));
    
    final user = users.firstWhere(
      (user) => user.id == id,
      orElse: () => User(-1, 'Не найден'),
    );
    
    return user;
  }
}

// Сервис для работы с пользователями
class UserService {
  final Database _database;
  
  UserService(this._database);
  
  // Получение всех пользователей
  void getAllUsers() {
    print('Загрузка пользователей...');
    
    _database.getUsers().then((users) {
      print('Список пользователей:');
      users.forEach((user) => print(' - $user'));
    }).catchError((error) {
      print('Ошибка при загрузке пользователей: $error');
    }).whenComplete(() {
      print('Загрузка пользователей завершена.');
    });
  }
  
  // Получение пользователя по ID 
  Future<void> findUserById(int id) async {
    try {
      print('Поиск пользователя с ID: $id');
      
      final user = await _database.getUserById(id);
      
      print('Найден пользователь: $user');
    } catch (e) {
      print('Ошибка при поиске пользователя: $e');
    } finally {
      print('Поиск пользователя завершен.');
    }
  }
}

void main() async {
  final database = Database();
  final userService = UserService(database);
  
  userService.getAllUsers();
  await userService.findUserById(2);
  
  Stream<int> countStream = Stream.fromFuture(
    Future.delayed(Duration(seconds: 3)).then((_) => 42)
  );
  
  countStream.listen(
    (data) => print('Получены данные из Stream: $data'),
    onError: (error) => print('Ошибка в Stream: $error'),
    onDone: () => print('Stream завершен'),
  );
  
  print('Программа продолжает выполнение, не блокируясь.');
}