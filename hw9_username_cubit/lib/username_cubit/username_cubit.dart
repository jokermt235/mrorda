import 'package:bloc/bloc.dart';
import 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameState());

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }
}
