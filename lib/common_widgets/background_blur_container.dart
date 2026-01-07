import 'package:flutter/material.dart';
import 'dart:ui';
class BackgroundBlurContainer extends StatelessWidget {
  final List<Widget> childWidget;
  const BackgroundBlurContainer({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: [Color(0xFF0B0024), Color(0xFF082257)],
        ),
      ),

      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.directional(1, -0.5),
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Color(0xFF5200FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
      
          Align(
            alignment: AlignmentGeometry.directional(-1, 0.2),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFF5200FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
      
          Align(
            alignment: AlignmentGeometry.directional(1, 0.8),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFF5200FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          ),
      
         ...childWidget,
          
       
        
        ],
      ),
    );
  }
}
