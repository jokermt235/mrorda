import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Состояние
class UsernameState extends Equatable {
  final String username;

  const UsernameState(this.username);

  @override
  List<Object?> get props => [username];
}

// Cubit
class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(const UsernameState(''));

  void updateUsername(String username) {
    emit(UsernameState(username));
  }
}
