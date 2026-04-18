import 'package:flutter/material.dart';

class WelcomeStatDivider extends StatelessWidget {
  const WelcomeStatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withValues(alpha: 0.3),
      margin: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
