import 'dart:async';

Future<int> divide(int a, int b) async {
  try {
    if (b == 0) {
      throw Exception('Division by zero isnt allowed');
    }
    return a ~/ b; 
  } catch (e) {
    print('Error: $e');
    return 0;
  }
}

Future<String> fetchData() async {
  try {
    await Future.delayed(Duration(seconds: 2));
        throw Exception('Failed to fetch data');    
    return 'successfully';
  } catch (e) {
    return 'Error: $e';
  }
}

Future<void> exampleFunction() async {
  try {
    print('Starting async task');
    
    await Future.delayed(Duration(seconds: 1));
        bool hasError = true;
    if (hasError) {
      throw Exception('Something was wrong');
    }
    
    print('successfully');
  } catch (e) {
    print('Caught an error: $e');
  }
}

void main() async {
  print('Starting division operation');
  
  int result1 = await divide(10, 2);
  print('Result1: $result1');
  
  int result2 = await divide(10, 0);
  print('Result2: $result2');
  
  print('Fetching data');
  
  String result = await fetchData();
  print(result);
  
  await exampleFunction();
}
