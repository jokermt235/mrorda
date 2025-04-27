import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  final int counter;
  CounterState(this.counter);
}

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounter) {
      yield CounterState(state.counter + 1);
    } else if (event is DecrementCounter) {
      yield CounterState(state.counter - 1);
    }
  }
}
