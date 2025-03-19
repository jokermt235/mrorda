class AuthService {
  // Имитация аутентификации
  static Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Имитация задержки сети
    return email == 'test@example.com' && password == 'password123';
  }
}