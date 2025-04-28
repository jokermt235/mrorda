import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_mobile_dev_cubit/cubit/username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameState());

  void updateUsername(String newUsername) {
    emit(UsernameState(username: newUsername));
  }
}