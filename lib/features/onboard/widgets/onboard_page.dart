import 'package:alermtask/constants/c_font_style.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Flexible(
            
            child: SizedBox(
              width: double.maxFinite,
              child: Image.asset(imagePath, fit: BoxFit.cover))),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style:CFontStyle.poppins28w500,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: CFontStyle.oxygen14w400,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
  }
}
