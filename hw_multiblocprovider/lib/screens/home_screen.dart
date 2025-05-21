import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (_, state) => Text('Counter: ${state.value}',
            style: TextStyle(fontSize: 24)),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'inc',
            child: Icon(Icons.add),
            onPressed: () => counterBloc.add(Increment()),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'dec',
            child: Icon(Icons.remove),
            onPressed: () => counterBloc.add(Decrement()),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'nav',
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => SecondScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}