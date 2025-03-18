class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  final List<User> _users = [];

  void initialize() {
    _users.add(User(username: 'admin', password: 'admin123'));
  }

  bool validateUser(String username, String password) {
    return _users.any(
      (user) => user.username == username && user.password == password,
    );
  }

  bool isUsernameTaken(String username) {
    return _users.any((user) => user.username == username);
  }

  void registerUser(String username, String password) {
    _users.add(User(username: username, password: password));
  }
}
