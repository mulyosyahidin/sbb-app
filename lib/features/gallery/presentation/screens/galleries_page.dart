import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/features/gallery/application/gallery_controller.dart';
import 'package:app/features/gallery/domain/entities/gallery.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_network_image.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GalleriesPage extends ConsumerStatefulWidget {
  const GalleriesPage({super.key});

  @override
  ConsumerState<GalleriesPage> createState() => _GalleriesPageState();
}

class _GalleriesPageState extends ConsumerState<GalleriesPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(galleryControllerProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(galleryControllerProvider);

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
              child: state.when(
                data: (data) => _buildContent(context, data),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Terjadi kesalahan: $error'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(galleryControllerProvider.notifier)
                            .refresh(),
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                ),
                loading: () => _buildLoading(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, GalleryState state) {
    if (state.galleries.isEmpty) {
      return const Center(
        child: Text('Belum ada data galeri'),
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(galleryControllerProvider.notifier).refresh(),
      child: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: state.galleries.length + (state.isLoadingMore ? 2 : 0),
        itemBuilder: (context, index) {
          if (index >= state.galleries.length) {
            return const AppShimmer(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            );
          }

          final gallery = state.galleries[index];
          return InkWell(
            onTap: () => context.push(
              Routes.galleryDetail.replaceAll(
                ':id',
                gallery.id.toString(),
              ),
            ),
            child: _buildGalleryCard(context, gallery),
          );
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const AppShimmer(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryCard(BuildContext context, Gallery gallery) {
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
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: AppNetworkImage(
                imageUrl: gallery.featuredImageUrl,
                fit: BoxFit.cover,
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
                    gallery.title,
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
                        color: Color(0xFFE91E63),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          gallery.tag,
                          style: AppTextStyles.body(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
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
