import 'package:flutter/material.dart';

class CatalogEmpty extends StatelessWidget{
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: 200,
      child: Center(
        child: Text("No product here"),
      )
    );
  }
}