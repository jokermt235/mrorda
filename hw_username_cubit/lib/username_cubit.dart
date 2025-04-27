import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameState.initial());

  void updateUsername(String username) {
    final duplicated = username.isEmpty ? '' : '$username $username';
    emit(UsernameState.updated(username, duplicated));
  }
}