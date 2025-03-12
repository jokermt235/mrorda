import 'package:math_expressions/math_expressions.dart';

String evaluateExpression(String expression) {

  String expStr = expression.replaceAll('**', '^');
  expStr = expStr.replaceAllMapped(RegExp(r'cot\(([^)]+)\)'), (match) {
    return '(cos(${match[1]})/sin(${match[1]}))';
  });

  Parser p = Parser();
  Expression exp = p.parse(expStr);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return eval.toString();
}
