import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/color_cubit.dart';

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorCubit = context.read<ColorCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Color Changer')),
      body: Center(
        child: BlocBuilder<ColorCubit, Color>(
          builder: (context, color) {
            return Container(
              width: 150,
              height: 150,
              color: color,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => colorCubit.changeColor(),
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
