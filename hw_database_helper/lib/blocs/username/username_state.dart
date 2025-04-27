part of 'username_cubit.dart';

abstract class UsernameState with EquatableMixin {
  const UsernameState();

  @override
  List<Object?> get props => [];
}

class UsernameInitial extends UsernameState {
  const UsernameInitial();
}

class UsernameUpdated extends UsernameState {
  final String username;

  const UsernameUpdated(this.username);

  @override
  List<Object?> get props => [username];
}