import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((_, emit) => emit(CounterState(state.value + 1)));
    on<Decrement>((_, emit) => emit(CounterState(state.value - 1)));
  }
}