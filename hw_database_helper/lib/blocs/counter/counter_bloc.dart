import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/database/db_helper.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}
class DecrementCounter extends CounterEvent {}
class LoadCounter extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  final DBHelper dbHelper;

  CounterBloc(this.dbHelper) : super(0) {
    on<IncrementCounter>((event, emit) async {
      final newValue = state + 1;
      emit(newValue);
      await dbHelper.updateCounter(newValue);
    });
    
    on<DecrementCounter>((event, emit) async {
      final newValue = state - 1;
      emit(newValue);
      await dbHelper.updateCounter(newValue);
    });
    
    on<LoadCounter>((event, emit) async {
      final savedValue = await dbHelper.getCounterValue();
      emit(savedValue);
    });
  }
}