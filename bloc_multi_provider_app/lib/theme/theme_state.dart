part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({this.isDark = false});

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDark: isDark ?? this.isDark);
  }

  @override
  List<Object> get props => [isDark];
}