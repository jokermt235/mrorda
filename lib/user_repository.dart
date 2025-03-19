class UserRepository {
  static final UserRepository _instance = UserRepository._internal();

  factory UserRepository() => _instance;

  UserRepository._internal();


  final Map<String, String> _users = {'user': 'password'};

  bool authenticate(String username, String password) {
    return _users.containsKey(username) && _users[username] == password;
  }

  bool register(String username, String password) {
    if (_users.containsKey(username)) {
      return false; // Username already exists
    }
    _users[username] = password;
    return true;
  }
}