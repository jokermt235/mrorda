part of 'theme_bloc.dart';

class ThemeState {
  final ThemeData themeData;

  const ThemeState({required this.themeData});
}

class LightThemeState extends ThemeState {
  LightThemeState()
      : super(
    themeData: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
    ),
  );
}

class DarkThemeState extends ThemeState {
  DarkThemeState()
      : super(
    themeData: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
    ),
  );
}