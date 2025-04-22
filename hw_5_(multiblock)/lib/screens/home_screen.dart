import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';
import '../blocs/counter/counter_state.dart';
import 'theme_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Счётчик')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Счётчик: ${state.counter}', style: const TextStyle(fontSize: 32));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => context.read<CounterBloc>().add(CounterIncrement()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: () => context.read<CounterBloc>().add(CounterDecrement()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'navigate',
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ThemeScreen())),
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}