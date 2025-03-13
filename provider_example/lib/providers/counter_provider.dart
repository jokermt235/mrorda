import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {

  int _countVal = 0;

  int get countVal => _countVal;

  void add() {
    _countVal++;
    notifyListeners();
  }

  void subtract() {
    _countVal--;
    notifyListeners();
  }

}
