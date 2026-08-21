import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/home/application/home_controller.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSlider extends ConsumerStatefulWidget {
  const HomeSlider({super.key});

  @override
  ConsumerState<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends ConsumerState<HomeSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slidersAsync = ref.watch(slidersProvider);

    return slidersAsync.when(
      data: (sliders) {
        if (sliders.isEmpty) return const SizedBox.shrink();
        return Column(
          children: [
            SizedBox(
              height: 158,
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
                          height: 158,
                          borderRadius: 20,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 158,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withValues(alpha: 0.64),
                                Colors.black.withValues(alpha: 0.14),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
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
                                  color: AppColors.warning,
                                  borderRadius: BorderRadius.circular(999),
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
                                style: AppTextStyles.title(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.subtitle,
                                style: AppTextStyles.label(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.2),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const AppShimmer(
        child: Skeleton(height: 158, borderRadius: 20),
      ),
      error: (err, stack) => Center(
        child: Text(
          'Slider Error: $err',
          style: const TextStyle(color: Colors.red, fontSize: 10),
        ),
      ),
    );
  }
}
