abstract class UsernameEvent {}

class SetUsername extends UsernameEvent {
  final String username;

  SetUsername(this.username);
}
