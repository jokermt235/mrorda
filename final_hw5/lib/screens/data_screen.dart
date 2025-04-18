import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/data_model.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Data')),
      body: FutureBuilder<List<DataModel>>(
        future: DatabaseHelper.instance.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data saved yet.'));
          }

          final dataList = snapshot.data!;

          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataList[index].data),
              );
            },
          );
        },
      ),
    );
  }
}
