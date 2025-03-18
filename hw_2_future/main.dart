void main() async {
  int counter = 0;
  print('Начальное значение: $counter');
  
  counter = await incrementCounter(counter);
  
  print('Значение после инкремента: $counter');
}

Future<int> incrementCounter(int counter) {
  return Future.delayed(Duration(seconds: 1), () => counter + 1);
}
