import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Rectangle 1.png',
      fit: BoxFit.fitHeight,
    );
  }
}
