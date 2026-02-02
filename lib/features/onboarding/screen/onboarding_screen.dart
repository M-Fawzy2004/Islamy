import 'package:flutter/material.dart';
import 'package:islami/features/onboarding/model/onboarding_item.dart';
import 'package:islami/features/onboarding/widget/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Home or Auth
      // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  final List<OnboardingItem> _pages = [
    OnboardingItem(
      title: 'Welcome To Islami App',
      mainImagePath: 'assets/images/Frame 3.png',
    ),
    OnboardingItem(
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
      mainImagePath: 'assets/images/Frame 3 (1).png',
    ),
    OnboardingItem(
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
      mainImagePath: 'assets/images/Frame 3 (2).png',
    ),
    OnboardingItem(
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
      mainImagePath: 'assets/images/Frame 3 (3).png',
    ),
    OnboardingItem(
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
      mainImagePath: 'assets/images/Frame 3 (4).png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Dark background as per design
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(item: _pages[index]);
                },
              ),
            ),
            // Bottom Navigation Area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button or Invisible Spacer
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: _previousPage,
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Color(0xFFB7935F), // Gold
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 60), // Placeholder to keep spacing

                  // Indicators
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == _currentPage ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? const Color(0xFFB7935F) // Gold
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next or Finish Button
                  TextButton(
                    onPressed: _nextPage,
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(
                        color: Color(0xFFB7935F), // Gold
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
