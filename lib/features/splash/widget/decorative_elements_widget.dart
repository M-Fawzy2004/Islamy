import 'package:flutter/material.dart';

class DecorativeElementsWidget extends StatefulWidget {
  const DecorativeElementsWidget({super.key});

  @override
  State<DecorativeElementsWidget> createState() =>
      _DecorativeElementsWidgetState();
}

class _DecorativeElementsWidgetState extends State<DecorativeElementsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<Offset> _glowSlideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize controller for the looping glow animation
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat back and forth

    // Slide from slightly left (-0.1) to right (0.1)
    _glowSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.1, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Star effect covering the screen
        Positioned(
          left: 70,
          right: 70,
          top: 90,
          child: Image.asset(
            'assets/images/Mosque-01 1.png',
            fit: BoxFit.cover,
          ),
        ),
        // Glow effect top right with animation
        Positioned(
          right: 0,
          top: 0,
          child: SlideTransition(
            position: _glowSlideAnimation,
            child: Image.asset(
              'assets/images/Glow.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Top Mosque shapes
        Positioned(
          bottom: 110,
          right: 0,
          child: Image.asset(
            'assets/images/Shape-04 1.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        // Lantern
        Positioned(
          top: 214,
          left: 0,
          child: Image.asset(
            'assets/images/Shape-07 1.png',
          ),
        ),
      ],
    );
  }
}
