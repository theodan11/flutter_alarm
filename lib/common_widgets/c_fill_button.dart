import 'package:alermtask/constants/color_const.dart';
import 'package:flutter/material.dart';

class CFillButton extends StatelessWidget {
    final String buttonText;
  final VoidCallback ontap;
  const CFillButton({super.key, required this.ontap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 56,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ColorConst.primaryColor,
          borderRadius: BorderRadius.circular(69),
        ),

        child: Center(
          child: Text(
         buttonText,
            style: TextStyle(
              color: ColorConst.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
