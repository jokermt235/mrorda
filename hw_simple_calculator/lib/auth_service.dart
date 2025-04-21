class AuthService {
  final String username;
  final String password;

  AuthService({required this.username, required this.password});

  Future<bool> authenticate() async {
    await Future.delayed(Duration(seconds: 1));

    if ((username == 'tim' || username == 'timur') && password == '1234') {
      return true;
    }
    return false;
  }
}