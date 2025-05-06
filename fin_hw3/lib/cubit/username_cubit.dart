import 'package:bloc/bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super('');

  void updateUsername(String username) {
    emit(username);
  }
}
