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
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 28,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
  }
}
