import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Pagi,',
              style: AppTextStyles.body(color: colorScheme.onSurfaceVariant)
                  .copyWith(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              'Peternak Sukses',
              style: AppTextStyles.heading(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ).copyWith(letterSpacing: 0, fontSize: 20),
            ),
          ],
        ),
        Stack(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 28),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: theme.scaffoldBackgroundColor, width: 2.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
