import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class AnotherEvent {}
class ChangeColorEvent extends AnotherEvent {}

// State
class AnotherState {
  final String color;
  AnotherState({this.color = "red"});
}

// Bloc
class AnotherBloc extends Bloc<AnotherEvent, AnotherState> {
  AnotherBloc() : super(AnotherState());

  @override
  Stream<AnotherState> mapEventToState(AnotherEvent event) async* {
    if (event is ChangeColorEvent) {
      yield AnotherState(color: state.color == "red" ? "blue" : "red");
    }
  }
}
