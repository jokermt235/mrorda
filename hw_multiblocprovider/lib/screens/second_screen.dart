import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_state.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (_, state) => Text(
            'Still: ${state.value}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}