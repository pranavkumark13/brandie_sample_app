import 'package:brandie_sample/widgets/text_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function? onTap;
  bool isDisabled;

  CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              onTap?.call();
            },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: isDisabled ? const Color(0xffD3D3D3) : const Color(0xff7EC086),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextView(
          text: title,
          textColor: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
