import 'package:brandie_sample/widgets/local_image.dart';
import 'package:brandie_sample/widgets/text_view.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  String label;
  dynamic icon;
  Color? labelColor;
  Color? iconColor;
  Color? iconBgColor;
  double? iconSize;
  double? labelSize;
  Function? onTap;
  CustomIconButton(
      {super.key,
      required this.label,
      required this.icon,
      this.labelColor = Colors.black,
      this.iconColor = Colors.white,
      this.iconBgColor = Colors.black,
      this.labelSize = 10,
      this.iconSize = 22,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!.call();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: icon is IconData
                  ? Icon(
                      icon,
                      color: Colors.white,
                      size: iconSize,
                    )
                  : LocalImage(path: icon),
            ),
            const SizedBox(height: 4),
            TextView(
              text: label,
              textColor: labelColor ?? const Color(0xff7B7676),
            ),
          ],
        ),
      ),
    );
  }
}
