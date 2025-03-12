class Profile {
  final String username;
  final String password;
  
  Profile({required this.username, required this.password});
  
  Future<bool> login() async {
    await Future.delayed(Duration(seconds: 1));
    if ((username.toLowerCase() == 'dinaiym' || username.toLowerCase() == 'mutalip') && password == '1234') {
      return true;
    }
    return false;
  }
}

