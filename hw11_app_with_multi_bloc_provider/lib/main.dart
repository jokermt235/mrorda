import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_color_cubit.dart';
import 'city_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TextColorCubit()),
        BlocProvider(create: (_) => CityCubit()),
      ],
      child: MaterialApp(home: const FirstScreen()),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorCubit = context.read<TextColorCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<TextColorCubit, Color>(
                builder: (context, color) {
                  return Text(
                    'Click the button!',
                    style: TextStyle(fontSize: 24, color: color),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  colorCubit.changeColor();
                },
                icon: const Icon(Icons.color_lens),
                label: const Text('Change Color'),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SecondScreen()),
                  );
                },
                icon: const Icon(Icons.navigate_next),
                label: const Text('Go to Second Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cityCubit = context.read<CityCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter your favorite city',
              ),
              onChanged: (value) {
                cityCubit.updateCity(value);
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<CityCubit, String>(
              builder: (context, city) {
                return Text(
                  city.isEmpty ? 'Your city will appear here' : city,
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
