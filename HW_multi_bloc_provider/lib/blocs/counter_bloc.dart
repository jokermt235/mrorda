  import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}
class IncrementCounter extends CounterEvent {}

// State
class CounterState {
  final int counter;
  CounterState({this.counter = 0});
}

// Bloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounter) {
      yield CounterState(counter: state.counter + 1);
    }
  }
}
