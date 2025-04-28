import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameCubit extends Cubit<List<String>> {
  UsernameCubit() : super([]);

  void addUsername(String username) {
    if (username.trim().isEmpty) return;
    emit([...state, username]);
  }
}
