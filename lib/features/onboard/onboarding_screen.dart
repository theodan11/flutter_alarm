import 'package:alermtask/common_widgets/background_blur_container.dart';
import 'package:alermtask/common_widgets/c_fill_button.dart';
import 'package:alermtask/constants/color_const.dart';
import 'package:alermtask/features/welcome/welcome_screen.dart';
import 'package:alermtask/features/onboard/widgets/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundBlurContainer(
        childWidget: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: controller,
            children: [
              OnboardPage(
                imagePath: 'assets/images/onboard_1.png',
                title: "Discover the world, one journey at a time.",
                description:
                    "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today.",
              ),
              OnboardPage(
                imagePath: 'assets/images/onboard_2.png',
                title: "Explore new horizons, one step at a time.",
                description:
                    "Every trip holds a story waiting to be lived. Let us guide you to experiences that inspire, connect, and last a lifetime.",
              ),
              OnboardPage(
                imagePath: 'assets/images/onboard_3.png',
                title: "See the beauty, one journey at a time.",
                description:
                    "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
              ),
            ],
          ),

          Positioned(
            top: 50,
            right: 10,
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(2);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: ColorConst.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Oxygen',
                  // height: 20,
                ),
              ),
            ),
          ),
          Positioned(
            // top: 800,
            // left: MediaQuery.of(context).size.width * 0.5 - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                SizedBox(width: double.maxFinite),
                Center(
                  child: SmoothPageIndicator(controller: controller, count: 3),
                ),

                SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CFillButton(
                    buttonText: "Next",
                    ontap: () {
                      if (currentIndex == 2) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
                Flexible(child: SizedBox(height: 70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
