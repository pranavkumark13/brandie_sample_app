import 'package:flutter/material.dart';

class LocalImage extends StatelessWidget {
  String path;
  double? width;
  double? height;
  BoxFit? boxFit;
  LocalImage(
      {super.key,
      required this.path,
      this.width,
      this.height,
      this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(path),
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
