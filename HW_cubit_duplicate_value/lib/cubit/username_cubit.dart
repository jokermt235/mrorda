import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameState(username: ''));

  void updateUsername(String username) {
    emit(UsernameState(username: username));
  }
}
