import 'package:flutter/material.dart';

class NextButton extends StatelessWidget{
  Function()? onClick;
  NextButton({this.onClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white30,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Text("Next"),
            ),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }

}