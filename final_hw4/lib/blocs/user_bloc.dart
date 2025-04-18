import 'package:flutter_bloc/flutter_bloc.dart';

// События
abstract class UserEvent {}

class SetUsername extends UserEvent {
  final String username;
  SetUsername(this.username);
}

// Состояния
abstract class UserState {}

class UserInitial extends UserState {}

class UserUpdated extends UserState {
  final String username;
  UserUpdated(this.username);
}

// BLoC для пользователя
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SetUsername) {
      yield UserUpdated(event.username);
    }
  }
}
