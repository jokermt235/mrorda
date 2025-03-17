import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _username;
  String? _token;

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;
  String? get token => _token;

  AuthService() {
    _loadSavedAuth();
  }

  Future<void> _loadSavedAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('user_data');

      if (userData != null) {
        final decoded = jsonDecode(userData);
        _isAuthenticated = true;
        _username = decoded['username'];
        _token = decoded['token'];
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Ошибка при загрузке данных аутентификации: $e');
      }
    }
  }

  Future<bool> login(String username, String password) async {
    if (kDebugMode) {
      print('Попытка входа: $username');
    }

    if (username.isNotEmpty && password.length >= 6) {
      _isAuthenticated = true;
      _username = username;
      _token = 'sample-auth-token-${DateTime.now().millisecondsSinceEpoch}';

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
          'user_data',
          jsonEncode({'username': _username, 'token': _token}),
        );

        if (kDebugMode) {
          print('Успешный вход: $_username с токеном: $_token');
        }

        notifyListeners();
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('Ошибка при сохранении данных: $e');
        }
        return false;
      }
    }

    if (kDebugMode) {
      print('Неудачный вход: $username');
    }

    return false;
  }

  Future<bool> register(String username, String email, String password) async {
    if (kDebugMode) {
      print('Попытка регистрации: $username, $email');
    }

    if (username.isNotEmpty && email.contains('@') && password.length >= 6) {
      _isAuthenticated = true;
      _username = username;
      _token = 'sample-auth-token-${DateTime.now().millisecondsSinceEpoch}';

      // Сохраняем данные в SharedPreferences
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
          'user_data',
          jsonEncode({'username': _username, 'token': _token}),
        );

        if (kDebugMode) {
          print('Успешная регистрация: $_username с токеном: $_token');
        }

        notifyListeners();
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('Ошибка при сохранении данных: $e');
        }
        return false;
      }
    }

    if (kDebugMode) {
      print('Неудачная регистрация: $username, $email');
    }

    return false;
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _username = null;
    _token = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');

    notifyListeners();
  }
}
