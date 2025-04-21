import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'another_bloc.dart';

class ColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Screen")),
      body: Center(
        child: BlocBuilder<AnotherBloc, AnotherState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Current Color: ${state.color}', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AnotherBloc>(context).add(ChangeColorEvent());
                  },
                  child: Text("Change Color"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
