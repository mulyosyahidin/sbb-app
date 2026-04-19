import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class BannerItem {
  final String imagePath;
  final String badgeText;
  final String title;
  final String subtitle;

  BannerItem({
    required this.imagePath,
    required this.badgeText,
    required this.title,
    required this.subtitle,
  });
}

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<BannerItem> _bannerItems = [
    BannerItem(
      imagePath: 'assets/banners/banner_1.jpg',
      badgeText: 'PROGRAM QURBAN 2026',
      title: 'Daftar Sekarang,\nStok Terbatas!',
      subtitle: 'Sapi berkualitas dari kandang Cariu, Jawa Barat',
    ),
    BannerItem(
      imagePath: 'assets/banners/banner_2.jpg',
      badgeText: 'KEMITRAAN BARU',
      title: 'Mulai Ternak,\nBagi Hasil Adil',
      subtitle: 'Paket investasi aman dengan asuransi ternak',
    ),
    BannerItem(
      imagePath: 'assets/banners/banner_3.jpg',
      badgeText: 'TEKNOLOGI DIGITAL',
      title: 'Pantau Sapi,\ndari Mana Saja',
      subtitle: 'Laporan kesehatan dan pertumbuhan harian real-time',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _bannerItems.length,
            itemBuilder: (context, index) {
              final item = _bannerItems[index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryDark,
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent.shade400,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(item.badgeText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    Text(item.title,
                        style: AppTextStyles.heading(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(item.subtitle,
                        style: AppTextStyles.label(
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0)),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerItems.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == index ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentIndex == index
                    ? colorScheme.primary
                    : colorScheme.primary.withValues(alpha: 0.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
