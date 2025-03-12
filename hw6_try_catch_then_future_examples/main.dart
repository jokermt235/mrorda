import 'dart:async';

// Simulates pizza ordering
Future<String> orderPizza(String pizzaName) async {
  // List of valid pizzas
  List<String> validPizzas = [
    "Margherita Pizza",
    "Pepperoni Pizza",
    "Meat Pizza",
    "Veggie Pizza",
    "BBQ Chicken Pizza"
  ];

  // Check if pizza is valid
  if (!validPizzas.contains(pizzaName)) {
    throw Exception("Sorry, we don't serve that pizza.");
  }

  // Simulate a 3-second delay
  await Future.delayed(Duration(seconds: 3));
  return "Your $pizzaName is ready!"; // Return confirmation
}

// Main function
void main() {
  // Default pizza choice
  String pizzaChoice = "Pepperoni Pizza";

  // Available pizzas
  print("Available pizzas:");
  print("1. Margherita Pizza");
  print("2. Pepperoni Pizza");
  print("3. Meat Pizza");
  print("4. Veggie Pizza");
  print("5. BBQ Chicken Pizza");

  print("\nYou have chosen: $pizzaChoice");

  // Try-catch for error handling
  try {
    // Use 'then' to handle success
    orderPizza(pizzaChoice).then((orderResult) {
      print(orderResult); // Print confirmation
    }).catchError((e) {
      print("Error: $e"); // Handle error
    });
  } catch (e) {
    print("Caught error: $e"); // Handle unexpected error
  }

  // Example of Future.delayed
  Future.delayed(Duration(seconds: 1), () {
    print("Delayed message from Future"); // After delay, print message
  }).then((value) {
    print("The delayed message has been shown!"); // After delay
  }).catchError((e) {
    print("Error in delayed future: $e"); // Handle delayed errors
  });
}
