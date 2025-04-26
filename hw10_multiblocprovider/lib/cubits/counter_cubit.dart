import 'package:bloc/bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(count: 0));

  void increment() => emit(CounterState(count: state.count + 1));
  void decrement() => emit(CounterState(count: state.count - 1));
}
