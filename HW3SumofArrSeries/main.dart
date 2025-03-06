import 'dart:async';
import 'dart:math';

Future <int> sumArr(List <int> array) async{
  int randSec = Random().nextInt(5) + 1;
  print("Wait $randSec sec");

  await Future.delayed(Duration(seconds: randSec));

  int sum = array.reduce((a, b) => a + b);
  return sum;

}

void main() async {
  List <int> numbers = [1, 2, 3, 4, 5];
  int res = await sumArr(numbers);
  print("Our results: $res");
}