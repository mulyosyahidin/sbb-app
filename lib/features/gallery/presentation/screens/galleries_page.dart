import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleriesPage extends StatelessWidget {
  const GalleriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final galleries = [
      {
        'title': 'Kandang Brahman',
        'location': 'Cariu, Jawa Barat',
        'image': 'assets/images/galleries/kandang-sapi-sbb-2.png',
      },
      {
        'title': 'Blok D7 — Simental',
        'location': 'Cariu, Jawa Barat',
        'image': 'assets/images/galleries/kandang-sapi-sbb-1.png',
      },
      {
        'title': 'Tahap Penimbangan',
        'location': 'Cariu, Jawa Barat',
        'image': 'assets/images/galleries/tahap-penimbangan.png',
      },
      {
        'title': 'Tahap Pengemasan',
        'location': 'Kab. Bogor',
        'image': 'assets/images/galleries/tahap-pengemasan.png',
      },
      {
        'title': 'Kunjungan ke PT. Cianjur Arta Makmur',
        'location': 'Kab. Bogor',
        'image': 'assets/images/galleries/kunjungan-ke-pt.png',
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Galeri',
              subtitle: 'Dokumentasi lapangan SBB',
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: galleries.length,
                itemBuilder: (context, index) {
                  final item = galleries[index];
                  return InkWell(
                    onTap: () => context.push(
                      Routes.galleryDetail.replaceAll(':id', index.toString()),
                    ),
                    child: _buildGalleryCard(context, item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryCard(BuildContext context, Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['title']!,
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.push_pin,
                        size: 10,
                        color: Color(0xFFE91E63), // Pinkish color from image
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item['location']!,
                          style: AppTextStyles.body(
                            fontSize: 10,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
