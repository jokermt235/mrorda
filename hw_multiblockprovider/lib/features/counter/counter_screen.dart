import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_multiblockprovider/features/counter/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Счетчик'),
        actions: [
          IconButton(
            icon: const Icon(Icons.color_lens),
            onPressed: () {
              Navigator.pushNamed(context, '/theme');
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              'Значение: ${state.count}',
              style: Theme.of(context).textTheme.displayMedium,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounter());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounter());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}