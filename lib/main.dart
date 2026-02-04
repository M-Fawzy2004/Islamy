import 'package:flutter/material.dart';
import 'features/splash/screen/splash_screen.dart';
import 'features/onboarding/screen/onboarding_screen.dart';
import 'features/home/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      // Fallback to avoid errors if initialRoute fails (though it shouldn't)
      // home: const SplashScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'FontFamily',
      ),
    );
  }
}
