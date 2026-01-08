import 'package:alermtask/features/common/location/cubit/location_cubit.dart';
import 'package:alermtask/features/home/cubit/alarm_cubit.dart';
import 'package:alermtask/features/home/screen/home_screen.dart';
import 'package:alermtask/features/onboard/onboarding_screen.dart';
import 'package:alermtask/features/welcome/welcome_screen.dart';
import 'package:alermtask/helpers/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();
  final prefs = await SharedPreferences.getInstance();
  final bool onboardSeen = prefs.getBool("onboardSeen") ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AlarmCubit()),
        BlocProvider(create: (_) => LocationCubit()),
      ],
      child: MyApp(onboardSeen: onboardSeen),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool onboardSeen;
  MyApp({super.key, required this.onboardSeen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: onboardSeen ? WelcomeScreen() : OnboardingScreen(),
    );
  }
}
