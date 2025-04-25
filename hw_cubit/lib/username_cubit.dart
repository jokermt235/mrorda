import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameInitial());

  void updateUsername(String username) {
    emit(UsernameUpdated(username));
  }
}
