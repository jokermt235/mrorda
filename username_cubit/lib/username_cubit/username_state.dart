import 'package:equatable/equatable.dart';

class UsernameState extends Equatable {
  final String username;

  const UsernameState({this.username = ''});

  UsernameState copyWith({String? username}) {
    return UsernameState(username: username ?? this.username);
  }

  @override
  List<Object> get props => [username];
}
