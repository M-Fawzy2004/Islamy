import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020), // Dark background
      body: Center(
        child: Text(
          'Onboarding Screen\n(Placeholder)',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xFFB7935F), // Gold color
              ),
        ),
      ),
    );
  }
}
