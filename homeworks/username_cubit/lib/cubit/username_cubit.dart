import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameState(username: ''));

  void updateUsername(String username) {
    emit(UsernameState(username: username));
  }
}
