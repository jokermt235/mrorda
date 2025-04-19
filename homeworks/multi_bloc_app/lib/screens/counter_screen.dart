import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (_, count) => Text('Counter value: $count', style: const TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () => counterCubit.decrement(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () => counterCubit.increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
