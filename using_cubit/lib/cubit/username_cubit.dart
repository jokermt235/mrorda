import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameCubit extends Cubit<String> {
  UsernameCubit() : super(''); //начальное значение пустое

  void updateUsername(String username) {
    emit(username);
  }
}
