class AuthService {
  String username;
  String password;

  AuthService({required this.username, required this.password});

  Future<bool> authenticate() async {
    await Future.delayed(Duration(seconds: 1));
    
    
    if ((username == 'user' || username == 'admin') && password == '1234') {
      return true;
    }
    return false; 
  }
}
