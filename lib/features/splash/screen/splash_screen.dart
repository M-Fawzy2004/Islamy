import 'package:flutter/material.dart';
import 'package:islami/features/onboarding/screen/onboarding_screen.dart';
import 'package:islami/features/splash/widget/decorative_elements_widget.dart';
import 'package:islami/features/splash/widget/footer_widget.dart';
import 'package:islami/features/splash/widget/main_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DecorativeElementsWidget(), // Contains the animated glow
          MainLogoWidget(), // Contains the animated logo
          FooterWidget(),
        ],
      ),
    );
  }
}
