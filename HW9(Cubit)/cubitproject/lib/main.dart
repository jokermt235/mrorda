import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubitproject/blocks/profile_cubit.dart';
import 'pages/create_profile_page.dart';
import 'pages/profile_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilesCubit>(
      create: (_) => ProfilesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profiles App',
        initialRoute: '/',
        routes: {
          '/': (context) => const ProfileListPage(),
          '/create': (context) => const CreateProfilePage(),
        },
      ),
    );
  }
}
