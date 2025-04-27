import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/blocs/counter/counter_bloc.dart';
import 'package:multi_bloc_app/blocs/theme/theme_bloc.dart';
import 'package:multi_bloc_app/database/db_helper.dart';
import 'package:multi_bloc_app/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DBHelper();
  runApp(MyApp(dbHelper: dbHelper));
}

class MyApp extends StatelessWidget {
  final DBHelper dbHelper;

  const MyApp({super.key, required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc(dbHelper)..add(LoadCounter())),
        BlocProvider(create: (_) => ThemeBloc(dbHelper)),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isLight) {
          return MaterialApp.router(
            title: 'MultiBloc App with Storage',
            debugShowCheckedModeBanner: false,
            theme: isLight ? ThemeData.light() : ThemeData.dark(),
            routerConfig: AppRouter().router,
          );
        },
      ),
    );
  }
}