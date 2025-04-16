import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  String path;
  double? width;
  double? height;
  BoxFit? boxFit;
  SocialIcon(
      {super.key,
      required this.path,
      this.width,
      this.height,
      this.boxFit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image(
          image: AssetImage(path),
          width: width,
          height: height,
          fit: boxFit,
        ),
      ),
    );
  }
}
