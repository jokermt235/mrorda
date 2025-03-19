// lib/authenticator.dart

class AuthService {
  static final Map<String, String> _users = {};

  // Sign-up method
  bool signUp(String email, String password) {
    if (_users.containsKey(email)) {
      return false;  // Email already in use
    }
    _users[email] = password;  // Save user in memory
    return true;  // Successful sign-up
  }

  // Sign-in method
  bool signIn(String email, String password) {
    if (_users.containsKey(email) && _users[email] == password) {
      return true;  // Successful login
    }
    return false;  // Invalid credentials
  }

  // Log out method (not used in this app yet)
  void signOut() {
    // Placeholder for logout logic
  }
}