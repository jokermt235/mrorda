import 'dart:async';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 500)});

  void run(void Function() callback) {
    _timer?.cancel(); // Cancel previous timer
    _timer = Timer(delay, callback); // Start new timer
  }

  void dispose() {
    _timer?.cancel();
  }
}