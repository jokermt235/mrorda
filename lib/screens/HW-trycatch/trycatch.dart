import 'dart:async';

class User {
  final int id;
  final String name;

  User(this.id, this.name);

  @override
  String toString() => 'User(id: $id, name: $name)';
}

class Database {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [User(1, 'Aibek'), User(2, 'Nursultan'), User(3, 'Altynbek')];
  }

  Future<User?> findUserById(int id) async {
    try {
      final users = await fetchUsers();
      await Future.delayed(Duration(seconds: 1));
      return users.firstWhere((user) => user.id == id);
    } catch (e) {
      print('Error: User with id $id not found.');
      return null;
    }
  }
}

Future<int> performHeavyComputation() async {
  await Future.delayed(Duration(seconds: 3));
  return 99;
}

void main() async {
  final database = Database();

  try {
    final users = await database.fetchUsers();
    print('Users fetched successfully:');
    users.forEach((user) => print(' - $user'));
  } catch (e) {
    print('Failed to retrieve users: $e');
  } finally {
    print('User fetching process completed.');
  }

  final user = await database.findUserById(2);
  if (user != null) {
    print('User found: $user');
  }

  print('Starting complex computation...');
  final result = await performHeavyComputation();
  print('Computation completed. Result: $result');

  print('Main program continues running...');
}
