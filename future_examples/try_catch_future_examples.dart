import 'dart:async';

class User {
  final int id;
  final String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

class Database {
  Future<List<User>> getUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      User(1, 'Alina'), 
      User(2, 'Albina'), 
      User(3, 'Meerim'), 
    ];
  }

  Future<User> getUserById(int id) async {
    final users = await getUsers();
    await Future.delayed(Duration(seconds: 1));
    return users.firstWhere(
      (user) => user.id == id,
      orElse: () => throw Exception('User not found'),
    );
  }
}

Future<int> simulateComputation() async {
  return Future.delayed(Duration(seconds: 3), () => 42);
}

void main() async {
  final database = Database();

  database.getUsers().then((users) {
    print('Users loaded successfully:');
    for (var user in users) {
      print(' - $user');
    }
  }).catchError((e) {
    print('Failed to load users: $e');
  }).whenComplete(() {
    print('Finished loading users.');
  });

  try {
    final user = await database.getUserById(2);
    print('Found user: $user');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('User search completed.');
  }

  print('Starting a delayed computation...');
  simulateComputation().then((result) {
    print('Computation result: $result');
  }).catchError((e) {
    print('Computation error: $e');
  });

  print('Main program continues executing...');
}
