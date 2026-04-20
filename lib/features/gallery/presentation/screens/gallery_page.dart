import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String dummyImage = 'assets/images/galleries/kandang-sapi-sbb-1.png';
    const String dummyTitle = 'Cariu Brahman Batch #4';
    const String dummyDate = '20 April 2024';
    const String dummyLocation = 'Cariu, Jawa Barat';
    const String dummyDescription =
        'Dokumentasi rutin untuk Batch #4 Sapi Brahman di peternakan Cariu. '
        'Kondisi kesehatan sapi terpantau sangat baik dengan rata-rata kenaikan berat badan yang signifikan. '
        'Pemberian pakan konsentrat dan hijauan dilakukan secara terjadwal untuk memastikan nutrisi optimal.';

    final List<String> dummyPhotos = [
      'assets/images/galleries/kandang-sapi-sbb-1.png',
      'assets/images/galleries/kandang-sapi-sbb-2.png',
      'assets/images/galleries/kunjungan-ke-pt.png',
      'assets/images/galleries/kunjungan-ke-pt-2.png',
      'assets/images/galleries/tahap-pengemasan.png',
      'assets/images/galleries/tahap-penimbangan.png',
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Hero Image Header
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            leadingWidth: 70,
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: InkWell(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(Icons.chevron_left,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  InkWell(
                    onTap: () => _showFullScreenImage(
                        context, dummyImage, 'header_$dummyImage'),
                    child: Hero(
                      tag: 'header_$dummyImage',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          dummyImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black26,
                          Colors.black54,
                        ],
                        stops: [0.6, 0.8, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Kesehatan Sapi',
                            style: AppTextStyles.label(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dummyTitle,
                          style: AppTextStyles.hero(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ).copyWith(fontSize: 24, letterSpacing: 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            icon: Icons.calendar_today_outlined,
                            label: 'Tanggal',
                            value: dummyDate,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            icon: Icons.location_on_outlined,
                            label: 'Lokasi',
                            value: dummyLocation,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Description Section
                    Text(
                      'Deskripsi',
                      style: AppTextStyles.title(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      dummyDescription,
                      style: AppTextStyles.body(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                      ).copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 32),

                    // Photo Gallery Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dokumentasi Foto',
                          style: AppTextStyles.title(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '${dummyPhotos.length} Foto',
                          style: AppTextStyles.body(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Grid of photos
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: dummyPhotos.length,
                      itemBuilder: (context, index) {
                        final imageUrl = dummyPhotos[index];
                        return InkWell(
                          onTap: () => _showFullScreenImage(
                              context, imageUrl, 'photo_${imageUrl}_$index'),
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: 'photo_${imageUrl}_$index',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFullScreenImage(
      BuildContext context, String imageUrl, String heroTag) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black.withValues(alpha: 0.9),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Hero(
                    tag: heroTag,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon,
              color: Theme.of(context).colorScheme.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.body(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: AppTextStyles.body(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
