import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';
import 'theme_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, count) => Text(
            'Counter: $count',
            style: const TextStyle(fontSize: 28),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterCubit.increment,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: TextButton(
        child: const Text('Go to Theme Screen'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ThemeScreen()),
          );
        },
      ),
    );
  }
}
