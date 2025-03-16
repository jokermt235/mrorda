import 'package:math_expressions/math_expressions.dart';

String evaluate(String exp) {
  String expModified = exp.replaceAll('x', '*');

  Parser p = Parser();
  Expression calc = p.parse(expModified);

  ContextModel cm = ContextModel();
  num eval = calc.evaluate(EvaluationType.REAL, cm);
  String result = eval.toString();

  return '= $result';
}
