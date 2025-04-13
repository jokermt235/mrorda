import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubitproject/blocks/profile_cubit.dart';
import '../models/profile.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание профиля'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Введите имя',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Введите возраст',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
    final name = nameController.text;
    final age = int.tryParse(ageController.text) ?? 0;

    if (name.isNotEmpty && age > 0) {
      final newProfile = Profile(name: name, age: age);
      context.read<ProfilesCubit>().addProfile(newProfile);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите корректные данные')),
      );
    }
  },
  child: const Text('Сохранить'),
),
          ],
        ),
      ),
    );
  }
}
