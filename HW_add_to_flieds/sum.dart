import 'dart:io';

void main() {
  // Step 1: Ask user for the first number
  print("Enter first number:");
  String? input1 = stdin.readLineSync(); // Read input as a string
  int num1 = int.parse(input1!); // Convert to integer

  // Step 2: Ask user for the second number
  print("Enter second number:");
  String? input2 = stdin.readLineSync();
  int num2 = int.parse(input2!);

  // Step 3: Calculate sum
  int sum = num1 + num2;

  // Step 4: Print the result
  print("The sum is: $sum");
}
