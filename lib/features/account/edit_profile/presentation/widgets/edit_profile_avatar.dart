import 'dart:io';

import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/account/edit_profile/application/edit_profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileAvatar extends ConsumerStatefulWidget {
  const EditProfileAvatar({super.key});

  @override
  ConsumerState<EditProfileAvatar> createState() => _EditProfileAvatarState();
}

class _EditProfileAvatarState extends ConsumerState<EditProfileAvatar> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 70, // compress a bit
      );

      if (image == null) return;

      final file = File(image.path);
      final fileSize = await file.length();
      if (fileSize > 2 * 1024 * 1024) {
        if (!mounted) return;
        ToastUtil.showError(
          context,
          title: 'Gagal',
          description: 'Ukuran foto maksimal 2MB',
        );
        return;
      }

      final extension = image.name.split('.').last.toLowerCase();
      if (extension != 'jpg' && extension != 'jpeg' && extension != 'png') {
        if (!mounted) return;
        ToastUtil.showError(
          context,
          title: 'Gagal',
          description: 'Format foto harus JPG atau PNG',
        );
        return;
      }

      ref
          .read(editProfileControllerProvider.notifier)
          .updateProfilePicture(file);
    } catch (e) {
      if (!mounted) return;
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Tidak dapat membuka kamera/galeri: $e',
      );
    }
  }

  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil Foto Kamera'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(authSessionControllerProvider).value;
    final user = session?.user;
    final isLoading = ref.watch(editProfileControllerProvider) is AsyncLoading;

    return Center(
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.5),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: user?.profilePictureUrl != null
                  ? CachedNetworkImage(
                      imageUrl: user!.profilePictureUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: isLoading ? null : () => _showPickerOptions(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.grey
                      : Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
