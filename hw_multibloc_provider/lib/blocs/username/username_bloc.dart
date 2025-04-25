import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_event.dart';
import 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  UsernameBloc() : super(UsernameState('')) {
    on<SetUsername>((event, emit) {
      emit(UsernameState(event.username));
    });
  }
}
