import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_cubit.freezed.dart';
part 'username_cubit.g.dart';

@freezed
class UsernameState with _$UsernameState {
  const factory UsernameState({
    required String username,
    required String duplicatedUsername,
  }) = _UsernameState;

  factory UsernameState.initial() => const UsernameState(
        username: '',
        duplicatedUsername: '',
      );
}

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameState.initial());

  void updateUsername(String newUsername) {
    emit(UsernameState(
      username: newUsername,
      duplicatedUsername: newUsername * 2,
    ));
  }
}