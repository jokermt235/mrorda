abstract class UsernameState {}

class UsernameInitial extends UsernameState {}

class UsernameLoaded extends UsernameState {
  final String username;
  UsernameLoaded(this.username);
}
