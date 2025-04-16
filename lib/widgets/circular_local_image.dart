import 'package:flutter/material.dart';

class CircularLocalImage extends StatelessWidget {
  dynamic path;
  double? width;
  double? height;
  BoxFit? boxFit;
  CircularLocalImage(
      {super.key,
      required this.path,
      this.width,
      this.height,
      this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: path is String
          ? Image(
              image: AssetImage(path),
              width: width,
              height: height,
              fit: boxFit,
            )
          : Icon(
              path,
              size: 50,
            ),
    );
  }
}
