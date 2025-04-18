Future<int> divide(int a, int b) async {
  await Future.delayed(Duration(seconds: 2));
  if (b == 0) throw Exception("Cannot divide by zero!");
  return a ~/ b;
}

void main() async {
  try {
    int result = await divide(10, 0);
    print("Result: $result");
  } catch (e) {
    print("Error: $e");
  } finally {
    print("Operation completed.");
  }
}
