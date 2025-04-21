import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameState {
  final String username;
  UsernameState(this.username);
}

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameState(''));

  void updateUsername(String newUsername) {
    emit(UsernameState(newUsername));
  }
}