import 'package:flutter/cupertino.dart';

class TextView extends StatelessWidget {
  String text;
  Color textColor;
  double? fontSize;
  FontWeight? fontWeight;
  String? fontFamily;
  FontStyle? fontStyle;
  TextView(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontWeight = FontWeight.w400,
      this.fontSize = 12,
      this.fontFamily = 'OpenSans',
      this.fontStyle = FontStyle.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
      ),
    );
  }
}
