import 'package:alermtask/common_widgets/background_blur_container.dart';
import 'package:alermtask/common_widgets/c_fill_button.dart';
import 'package:alermtask/common_widgets/c_out_buttom.dart';
import 'package:alermtask/constants/c_font_style.dart';
import 'package:alermtask/constants/color_const.dart';
import 'package:alermtask/features/home/screen/home_screen.dart';
import 'package:alermtask/helpers/get_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlurContainer(
        childWidget: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 34,
              ),
              child: Column(
                children: [
                  SizedBox(height: 34),
                  Text(
                    "Welcome! Your Smart Travel Alarm",
                    textAlign: TextAlign.center,
                    style: CFontStyle.poppins28w600,
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Stay on schedule and enjoy every moment of your journey",
                    textAlign: TextAlign.center,
                    style: CFontStyle.poppins16w400.copyWith(
                      color: ColorConst.textGray,
                    ),
                  ),
                  SizedBox(height: 64),
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 36,
                      child: Image.asset(
                        'assets/images/home_1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  COutButtom(
                    ontap: ()async {
                      Position position =await getCurrentLocation();
                      print(position);
                    },
                    buttonText: "Use Current Location",
                    bIcon: Icons.location_on_outlined,
                  ),
                  SizedBox(height: 18),
                  CFillButton(
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    buttonText: "Home",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
