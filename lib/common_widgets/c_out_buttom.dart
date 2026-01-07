import 'package:alermtask/constants/c_font_style.dart';
import 'package:alermtask/constants/color_const.dart';
import 'package:flutter/material.dart';

class COutButtom extends StatelessWidget {
  final String buttonText;
  final IconData? bIcon;
  final VoidCallback ontap;
  const COutButtom({
    super.key,
    required this.ontap,
    required this.buttonText,
    this.bIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 56,
        width: double.maxFinite,
        decoration: BoxDecoration(
          // color: ColorConst.primaryColor,
          border: BoxBorder.all(color: ColorConst.whiteColor),
          borderRadius: BorderRadius.circular(69),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText, style: CFontStyle.poppins16w400),
            SizedBox(width: 8),
            Icon(bIcon, size: 24, color: ColorConst.whiteColor),
          ],
        ),
      ),
    );
  }
}
