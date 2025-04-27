part of 'username_cubit.dart';

class UsernameState extends Equatable {
  final String username;
  final String duplicated;

  const UsernameState._(this.username, this.duplicated);

  const UsernameState.initial()
      : this._('', '');

  const UsernameState.updated(String username, String duplicated)
      : this._(username, duplicated);

  @override
  List<Object> get props => [username, duplicated];
}