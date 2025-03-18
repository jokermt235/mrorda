mixin Printer {
  void printMessage() {
    print('Printing a message!');
  }
}

mixin Calculator {
  int add(int a, int b) {
    return a + b;
  }
}

class Worker with Printer, Calculator {
  static void doNothing() {}
}

void main() {
  var worker = Worker();
  worker.printMessage();
  var sum = worker.add(5, 7);
  print('The sum is: $sum');
  Worker.doNothing();
}

