import 'dart:math';

double calculate(double a, double b, String operator) {
  switch (operator) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      if (b != 0) return a / b;
      throw Exception("Деление на ноль");
    case '%':
      return a % b;
    case '**':
      return pow(a, b).toDouble();
    default:
      throw Exception("Неизвестный оператор");
  }
}
