import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<CounterIncrement>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
