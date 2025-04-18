part of 'username_cubit.dart';

class UsernameState extends Equatable {
  final String username;

  const UsernameState({required this.username});

  @override
  List<Object> get props => [username];
}
