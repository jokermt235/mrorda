import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart';
import 'blocs/book/book_bloc.dart';
import 'blocs/cart/cart_bloc.dart';
import 'routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookBloc(sl())..add(LoadBooks()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Book Sale App',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}
