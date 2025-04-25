import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';
import '../blocs/counter/counter_state.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Counter: ${state.count}', style: const TextStyle(fontSize: 24));
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()),
                );
              },
              child: const Text('Go to Username Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
