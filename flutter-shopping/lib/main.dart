import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/modules/cart/bloc/cart_bloc.dart';
import 'app/modules/cart/cart_view.dart';
import 'app/modules/products_list/bloc/products_list_bloc.dart';
import 'app/modules/products_list/products_list_view.dart';
import 'app/modules/products_list/view_book_page.dart';
import 'injection_container.dart';
import 'simple_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = const SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await initDI();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ProductListView(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartView(),
        ),
        GoRoute(
          path: '/view/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            final titleString = state.queryParameters['title'] ?? '';
            final priceString = state.queryParameters['price'] ?? '0';
            final thumbnailString = state.queryParameters['thumbnail'] ?? '';
            final pagesString = state.queryParameters['pages'] ?? '0';

            return ViewBookPage(
              id: id,
              title: Uri.decodeComponent(titleString),
              price: double.tryParse(priceString) ?? 0.0,
              thumbnail: Uri.decodeComponent(thumbnailString),
              pages: int.tryParse(pagesString) ?? 0,
            );
          },
        ),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
          create: (_) => ProductsListBloc()..add(ProductsListStarted()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Shopping Cart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 1150, name: TABLET),
              const Breakpoint(start: 1151, end: 1920, name: DESKTOP),
            ],
            child: MaxWidthBox(
              maxWidth: 1920,
              background: Container(color: Colors.white),
              child: Builder(
                builder: (context) {
                  return ResponsiveScaledBox(
                    width: ResponsiveValue<double>(context, conditionalValues: [
                      const Condition.equals(name: MOBILE, value: 350),
                      const Condition.equals(name: TABLET, value: 600),
                      const Condition.equals(name: DESKTOP, value: 1200),
                    ]).value,
                    child: child!,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
