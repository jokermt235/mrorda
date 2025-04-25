part of 'username_cubit.dart';

@immutable
abstract class UsernameState {}

class UsernameInitial extends UsernameState {}

class UsernameUpdated extends UsernameState {
  final String username;

  UsernameUpdated(this.username);
}
