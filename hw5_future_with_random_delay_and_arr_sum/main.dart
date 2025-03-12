import 'dart:async'; // For Future
import 'dart:math'; // For random numbers

// Future that returns sum after random delay
Future<int> sumAfterRandomDelay(List<int> numbers) async {
  // create a random delay between 1 and 5 seconds
  Random random = Random();
  int randomSeconds = random.nextInt(5) + 1; //Random seconds (1-5)

  print("Waiting for $randomSeconds seconds...");

  // wait for the random delay
  await Future.delayed(Duration(seconds: randomSeconds));

  // sum array
  int sum = numbers.reduce((value, element) => value + element);

  return sum;
}

void main() async {
  List<int> numbers = [1, 2, 3, 4, 5];

  // Get sum after delay
  int result = await sumAfterRandomDelay(numbers);

  print("The sum of the array is: $result");
}
