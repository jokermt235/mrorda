import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'bloc/book_bloc.dart';
import 'bloc/cart_bloc.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<BookBloc>()..add(LoadBooks())),
        BlocProvider(create: (_) => getIt<CartBloc>()..add(LoadCart())),
      ],
      child: MaterialApp.router(routerConfig: router, theme: ThemeData.light()),
    );
  }
}
