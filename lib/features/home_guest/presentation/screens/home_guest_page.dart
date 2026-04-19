import 'package:app/features/home_guest/presentation/widgets/home_banner.dart';
import 'package:app/features/home_guest/presentation/widgets/home_guest_cta.dart';
import 'package:app/features/home_guest/presentation/widgets/home_guest_header.dart';
import 'package:app/features/home_guest/presentation/widgets/home_menu_grid.dart';
import 'package:flutter/material.dart';

class HomeGuestPage extends StatelessWidget {
  const HomeGuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeGuestHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const HomeBanner(),
                  const SizedBox(height: 24),
                  Text('Menu Utama',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface)),
                  const SizedBox(height: 16),
                  const HomeMenuGrid(),
                  const SizedBox(height: 32),
                  const HomeGuestCTA(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
