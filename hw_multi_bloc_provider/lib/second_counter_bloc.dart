import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCounterState {
  final int counter;
  SecondCounterState(this.counter);
}

abstract class SecondCounterEvent {}

class IncrementSecondCounter extends SecondCounterEvent {}

class DecrementSecondCounter extends SecondCounterEvent {}

// Блок для управления состоянием
class SecondCounterBloc extends Bloc<SecondCounterEvent, SecondCounterState> {
  SecondCounterBloc() : super(SecondCounterState(0));

  @override
  Stream<SecondCounterState> mapEventToState(SecondCounterEvent event) async* {
    if (event is IncrementSecondCounter) {
      yield SecondCounterState(state.counter + 1);
    } else if (event is DecrementSecondCounter) {
      yield SecondCounterState(state.counter - 1);
    }
  }
}
