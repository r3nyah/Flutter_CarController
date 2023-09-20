import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  var text_ = "";
  double letterSpace;
  double size = 5.0;
  var fontW = FontWeight.normal;
  var color;

  TextWidget(this.text_,this.size,this.color,this.fontW,{this.letterSpace=3});
  @override
  Widget build(BuildContext context) {
    return Text(
      text_,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontW,
        letterSpacing: letterSpace
      ),
    );
  }
}
