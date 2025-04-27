import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameInitial());

  void updateUsername(String username) {
    emit(UsernameUpdated(username));
  }
}