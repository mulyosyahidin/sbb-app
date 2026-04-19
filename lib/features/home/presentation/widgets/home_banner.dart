import 'package:flutter/material.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryDark,
        image: DecorationImage(
          image: const CachedNetworkImageProvider(
              'https://images.unsplash.com/photo-1620811004671-40b81b6f6978?auto=format&fit=crop&q=80'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.4), BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orangeAccent.shade400,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text('PROGRAM QURBAN 2026',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          Text('Daftar Sekarang,\nStok Terbatas!',
              style: AppTextStyles.heading(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Sapi berkualitas dari kandang Cariu, Jawa Barat',
              style: AppTextStyles.label(
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0)),
        ],
      ),
    );
  }
}
