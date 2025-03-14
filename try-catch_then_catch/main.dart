import 'dart:async';
import 'dart:math';

Future<int> calculateSum (List<int> array) async {
  int delay = Random().nextInt(5) + 1;
  print("Delay: $delay seconds...");
  await Future.delayed(Duration(seconds: delay)); // Wait for the specified number of seconds

  if (array.isEmpty){
    throw Exception("Erray is empty!");
  }

  int sum = array.fold(0, (prev, element) => prev + element); //fold is like a way to go through all the items in a list and combine them into one value (like sum).
  return sum;
}

void main() async {
  List<int> values = [22, 14, 31, 9, 15, 25];

  try {
    print("Calculating...");
    int result = await calculateSum(values);
    print("The sum is: $result");
  } catch (e) {
    print("An error occurred: $e");
  }
  //If there's any error in the try block (like if the array is empty or some other issue), 
  //Dart jumps to the catch block and prints the error (e).

  calculateSum(values)
    .then((result){
      print("Then sum using THEN is: $result");
    })
    .catchError((e){
      print("An error ocurred through THEN: $e");
    });
  
  
}