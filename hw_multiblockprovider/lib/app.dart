import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_multiblockprovider/features/counter/counter_bloc.dart';
import 'package:hw_multiblockprovider/features/theme/theme_bloc.dart';
import 'navigation/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Пример MultiBlocProvider',
            theme: state.themeData,
            initialRoute: '/counter',
            routes: AppRouter.routes,
          );
        },
      ),
    );
  }
}