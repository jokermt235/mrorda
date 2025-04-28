import 'package:equatable/equatable.dart';

class UsernameState extends Equatable {
  final String username;

  const UsernameState({this.username = ''});

  @override
  List<Object> get props => [username];
}