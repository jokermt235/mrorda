abstract class UsernameEvent {}

class LoadUsername extends UsernameEvent {}

class SaveUsername extends UsernameEvent {
  final String username;
  SaveUsername(this.username);
}
