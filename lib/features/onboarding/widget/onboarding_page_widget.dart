import 'package:flutter/material.dart';
import 'package:islami/features/onboarding/model/onboarding_item.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Based on image, it's consistent across pages.
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Image.asset(
            'assets/images/Group 33.png',
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        // 2. Main Middle Image
        Image.asset(
          item.mainImagePath,
          height: 350,
          fit: BoxFit.cover,
        ),
        const Spacer(),
        // 3. Text Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFB7935F),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (item.description != null) ...[
                const SizedBox(height: 16),
                Text(
                  item.description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB7935F), // Gold
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ],
          ),
        ),
         const Spacer(),
      ],
    );
  }
}
