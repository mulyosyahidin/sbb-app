import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String dummyImage =
        'https://images.unsplash.com/photo-1546445317-29f4545e9d53?q=80&w=1600&auto=format&fit=crop';
    const String dummyTitle = 'Cariu Brahman Batch #4';
    const String dummyDate = '20 April 2024';
    const String dummyLocation = 'Cariu, Jawa Barat';
    const String dummyDescription =
        'Dokumentasi rutin untuk Batch #4 Sapi Brahman di peternakan Cariu. '
        'Kondisi kesehatan sapi terpantau sangat baik dengan rata-rata kenaikan berat badan yang signifikan. '
        'Pemberian pakan konsentrat dan hijauan dilakukan secara terjadwal untuk memastikan nutrisi optimal.';

    final List<String> dummyPhotos = [
      'https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1596733430284-f7437764b1a9?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1570042225831-d98fa7577f1e?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1589303204158-c33028c33117?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1625109567648-84e1332f5d3f?q=80&w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1773171033482-053653857f78?q=80&w=800&auto=format&fit=crop',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Hero Image Header
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            leadingWidth: 70,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: InkWell(
                  onTap: () => context.pop(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.chevron_left,
                        color: Color(0xFF1A1C19)),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  InkWell(
                    onTap: () => _showFullScreenImage(context, dummyImage),
                    child: Hero(
                      tag: dummyImage,
                      child: AppNetworkImage(
                        imageUrl: dummyImage,
                        fit: BoxFit.cover,
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
              decoration: const BoxDecoration(
                color: Colors.white,
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
                            icon: Icons.calendar_today_outlined,
                            label: 'Tanggal',
                            value: dummyDate,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildInfoItem(
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
                        color: const Color(0xFF1A1C19),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      dummyDescription,
                      style: AppTextStyles.body(
                        color: const Color(0xFF444941),
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
                            color: const Color(0xFF1A1C19),
                          ),
                        ),
                        Text(
                          '${dummyPhotos.length} Foto',
                          style: AppTextStyles.body(
                            color: const Color(0xFF747972),
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
                          onTap: () => _showFullScreenImage(context, imageUrl),
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: imageUrl,
                            child: AppNetworkImage(
                              imageUrl: imageUrl,
                              borderRadius: 16,
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

  void _showFullScreenImage(BuildContext context, String imageUrl) {
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
                    tag: imageUrl,
                    child: AppNetworkImage(
                      imageUrl: imageUrl,
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

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF4CAF50), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.body(
                  color: const Color(0xFF747972),
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
                  color: const Color(0xFF1A1C19),
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
