import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';

class BankAccountSkeleton extends StatelessWidget {
  const BankAccountSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mimic the accent bar gap if needed, but usually not necessary for skeleton
            const SizedBox(height: 3),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: Row(
                children: [
                  // Bank icon placeholder
                  const Skeleton(
                    width: 42,
                    height: 42,
                    borderRadius: 12,
                  ),
                  const SizedBox(width: 12),

                  // Bank info placeholder
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(width: 100, height: 16),
                        SizedBox(height: 6),
                        Skeleton(width: 140, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Divider placeholder
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),

            // Bottom section placeholder
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(width: 80, height: 10),
                      SizedBox(height: 6),
                      Skeleton(width: 120, height: 14),
                    ],
                  ),
                  Skeleton(width: 100, height: 28, borderRadius: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
