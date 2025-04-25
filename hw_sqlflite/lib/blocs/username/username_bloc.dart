import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_event.dart';
import 'username_state.dart';
import '../../data/database_helper.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  final db = DatabaseHelper();

  UsernameBloc() : super(UsernameInitial()) {
    on<LoadUsername>((event, emit) async {
      final username = await db.getUsername();
      emit(UsernameLoaded(username ?? ''));
    });

    on<SaveUsername>((event, emit) async {
      await db.saveUsername(event.username);
      emit(UsernameLoaded(event.username));
    });
  }
}
