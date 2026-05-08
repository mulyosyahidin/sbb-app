import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/home/application/home_providers.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBanner extends ConsumerStatefulWidget {
  const HomeBanner({super.key});

  @override
  ConsumerState<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends ConsumerState<HomeBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final slidersAsync = ref.watch(slidersProvider);

    return slidersAsync.when(
      data: (sliders) {
        if (sliders.isEmpty) return const SizedBox.shrink();
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
                itemCount: sliders.length,
                itemBuilder: (context, index) {
                  final item = sliders[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Stack(
                      children: [
                        AppNetworkImage(
                          imageUrl: item.imageUrl,
                          width: double.infinity,
                          height: 140,
                          borderRadius: 16,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withValues(alpha: 0.4),
                          ),
                        ),
                        Padding(
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
                                child: Text(
                                  item.tag.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                item.title,
                                style: AppTextStyles.heading(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.subtitle,
                                style: AppTextStyles.label(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0),
                              ),
                            ],
                          ),
                        ),
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
                sliders.length,
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
      },
      loading: () => Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }
}
