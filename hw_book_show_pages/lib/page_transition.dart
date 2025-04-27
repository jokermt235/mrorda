import 'package:flutter/material.dart';

SlideTransition createPageTransition(
  Animation<double> animation,
  Widget child,
  Offset begin,
  Offset end,
) {
  const curve = Curves.easeInOut;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(position: offsetAnimation, child: child);
}
