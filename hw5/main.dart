import 'dart:async';

Future<String> getUserDataFromServer() {
  return Future.delayed(const Duration(seconds: 3), () => 'User data from server');
}

Stream<int> generateNumbers() async* {
  yield 1;
  await Future.delayed(const Duration(seconds: 2));
  yield 2;
  await Future.delayed(const Duration(seconds: 1));
  yield 3;
}

void main() async {
  try {
    print('Fetching user data from the server...');
    String userData = await getUserDataFromServer();
    print('User data fetched: $userData\n');
  } catch (e) {
    print('Error while fetching user data: $e\n');
  }

  print('Generating numbers...');
  await for (var number in generateNumbers()) {
    print('Received number: $number');
  }
  print('Stream is done.\n');
}