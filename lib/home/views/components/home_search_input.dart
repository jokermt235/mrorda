import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeSearchInput extends StatelessWidget{
  Function()? onClick;
  Function(String value)? onChange;
  HomeSearchInput({this.onClick, this.onChange});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search_outlined
        ),
        suffixIcon: GestureDetector(
          onTap: onClick,
          child: Icon(
            Icons.near_me
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24)
        )
      ),
      style: TextStyle(
        color: Colors.black54
      ),
      onChanged: onChange,
    );
  }

}