import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ConsultantPanel extends StatelessWidget {
  const ConsultantPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B4D3E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mitra yang kamu rekrut',
                  style: AppTextStyles.body(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '5 aktif',
                    style: AppTextStyles.label(color: Colors.white.withValues(alpha: 0.9), letterSpacing: 0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildMitraCard('Budi Santoso', '2 ekor sapi', 'Rp 8,4jt'),
                _buildMitraCard('Siti Rahma', '1 ekor sapi', 'Rp 3,8jt'),
                _buildMitraCard('Hendra K.', '1 ekor sapi', 'Rp 4,2jt'),
                _buildMitraCard('Dewi Ayu', '3 ekor sapi', 'Rp 12jt'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMitraCard(String name, String status, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7F4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.body(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            status,
            style: AppTextStyles.label(color: AppColors.textSecondaryLight, fontSize: 10, letterSpacing: 0, fontWeight: FontWeight.normal),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.body(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B4D3E),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
