import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubitproject/blocks/profile_cubit.dart';
import '../models/profile.dart';

class ProfileListPage extends StatelessWidget {
  const ProfileListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список профилей'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Переход на страницу создания профиля
              Navigator.pushNamed(context, '/create');
            },
          )
        ],
      ),
      // Здесь мы используем BlocBuilder, чтобы строить список профилей
      body: BlocBuilder<ProfilesCubit, List<Profile>>(
        builder: (context, profiles) {
          if (profiles.isEmpty) {
            return const Center(child: Text("Профилей пока нет"));
          }
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              final profile = profiles[index];
              return ListTile(
                title: Text(profile.name),
                subtitle: Text('Возраст: ${profile.age}'),
              );
            },
          );
        },
      ),
    );
  }
}
