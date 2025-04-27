import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/details_page.dart';
import 'pages/settings_page.dart';
import 'pages/result_page.dart';
import 'pages/username_page.dart';
import 'cubit/username_cubit.dart'; // ✅ Import Cubit

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/profile/:name',
      builder: (context, state) =>
          ProfilePage(name: state.pathParameters['name']!),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) =>
          DetailsPage(id: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/settings/:section/:mode',
      builder: (context, state) => SettingsPage(
        section: state.pathParameters['section']!,
        mode: state.pathParameters['mode']!,
      ),
    ),
    GoRoute(
      path: '/result/:subject/:score',
      builder: (context, state) => ResultPage(
        subject: state.pathParameters['subject']!,
        score: state.pathParameters['score']!,
      ),
    ),
    GoRoute(
      path: '/username',
      builder: (context, state) => BlocProvider(
        create: (_) => UsernameCubit(),
        child: const UsernamePage(),
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter + Cubit Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routerConfig: _router,
    );
  }
}
