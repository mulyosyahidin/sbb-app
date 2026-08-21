import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/gallery/application/gallery_controller.dart';
import 'package:app/features/gallery/domain/entities/gallery.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:string_to_icon/string_to_icon.dart';

class GalleryPage extends ConsumerWidget {
  final int id;
  const GalleryPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryAsync = ref.watch(galleryDetailProvider(id));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: galleryAsync.when(
        data: (gallery) => _buildContent(context, gallery),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Terjadi kesalahan: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(galleryDetailProvider(id)),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        loading: () => _buildLoading(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Gallery gallery) {
    final displayImage = _firstAvailableImage(gallery);

    return CustomScrollView(
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
                if (displayImage != null)
                  InkWell(
                    onTap: () => _showFullScreenImage(
                        context, displayImage, 'header_$displayImage'),
                    child: Hero(
                      tag: 'header_$displayImage',
                      child: AppNetworkImage(
                        imageUrl: displayImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  Container(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest),
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
                          gallery.tag,
                          style: AppTextStyles.label(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        gallery.title,
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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Row (Metas)
                  if (gallery.metas != null && gallery.metas!.isNotEmpty) ...[
                    _buildMetasGrid(context, gallery.metas!),
                    const SizedBox(height: 32),
                  ],

                  // Description Section
                  if (gallery.content != null &&
                      gallery.content!.isNotEmpty) ...[
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
                      gallery.content!,
                      style: AppTextStyles.body(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 15,
                      ).copyWith(height: 1.6),
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Photo Gallery Section
                  if (gallery.items != null && gallery.items!.isNotEmpty) ...[
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
                          '${gallery.items!.length} Foto',
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
                      itemCount: gallery.items!.length,
                      itemBuilder: (context, index) {
                        final item = gallery.items![index];
                        final imageUrl = item.imageUrl;
                        final heroTag = 'photo_${item.id}_$index';
                        return InkWell(
                          onTap: imageUrl == null || imageUrl.isEmpty
                              ? null
                              : () => _showFullScreenImage(
                                  context,
                                  imageUrl,
                                  heroTag,
                                ),
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: heroTag,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AppNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? _firstAvailableImage(Gallery gallery) {
    final featuredImageUrl = gallery.featuredImageUrl;
    if (featuredImageUrl != null && featuredImageUrl.isNotEmpty) {
      return featuredImageUrl;
    }

    for (final item in gallery.items ?? const []) {
      final imageUrl = item.imageUrl;
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return imageUrl;
      }
    }

    return null;
  }

  Widget _buildLoading(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          expandedHeight: 350,
          flexibleSpace: AppShimmer(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(
                  child: Container(
                    height: 20,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AppShimmer(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetasGrid(BuildContext context, List metas) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 60,
      ),
      itemCount: metas.length,
      itemBuilder: (context, index) {
        final meta = metas[index];
        return _buildInfoItem(
          context,
          icon: _getIconData(meta.icon),
          label: meta.title,
          value: meta.content,
        );
      },
    );
  }

  IconData _getIconData(String iconName) {
    return IconMapper.getIconData(iconName);
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
            mainAxisSize: MainAxisSize.min,
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
