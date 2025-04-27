import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

// Bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounter>((event, emit) {
      emit(state + 1);
    });

    on<DecrementCounter>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}
