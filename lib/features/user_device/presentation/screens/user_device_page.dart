import 'package:app/core/services/device_id_service.dart';
import 'package:app/core/services/fcm_service.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/features/user_device/application/user_device_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDevicePage extends ConsumerWidget {
  const UserDevicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceId = ref.watch(fetchDeviceIdProvider);
    final deviceDetails = ref.watch(fetchDeviceDetailsProvider);
    final fcmToken = ref.watch(fetchFcmTokenProvider);
    final registrationState = ref.watch(userDeviceControllerProvider);
    final isRegistered = registrationState.value != null;
    final isLoading = registrationState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Information'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Hardware Information'),
          const SizedBox(height: 12),
          _buildInfoCard(
            context,
            children: [
              _buildInfoRow(
                context,
                label: 'Device ID',
                value: deviceId.when(
                  data: (id) => id ?? 'Unknown',
                  loading: () => 'Loading...',
                  error: (_, __) => 'Error',
                ),
                icon: Icons.fingerprint,
                isCopyable: true,
              ),
              const Divider(height: 24, thickness: 0.5),
              _buildInfoRow(
                context,
                label: 'Brand',
                value: deviceDetails.when(
                  data: (data) => data['brand'] ?? 'Unknown',
                  loading: () => 'Loading...',
                  error: (_, __) => 'Error',
                ),
                icon: Icons.smartphone,
              ),
              const Divider(height: 24, thickness: 0.5),
              _buildInfoRow(
                context,
                label: 'Model / Device Name',
                value: deviceDetails.when(
                  data: (data) => '${data['model']} (${data['device']})',
                  loading: () => 'Loading...',
                  error: (_, __) => 'Error',
                ),
                icon: Icons.devices,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('System Software'),
          const SizedBox(height: 12),
          _buildInfoCard(
            context,
            children: [
              _buildInfoRow(
                context,
                label: 'OS Version',
                value: deviceDetails.when(
                  data: (data) => data['os_version'] ?? 'Unknown',
                  loading: () => 'Loading...',
                  error: (_, __) => 'Error',
                ),
                icon: Icons.android,
              ),
              const Divider(height: 24, thickness: 0.5),
              _buildInfoRow(
                context,
                label: 'Build ID',
                value: deviceDetails.when(
                  data: (data) => data['os_build_id'] ?? 'Unknown',
                  loading: () => 'Loading...',
                  error: (_, __) => 'Error',
                ),
                icon: Icons.build_circle_outlined,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Cloud Messaging'),
          const SizedBox(height: 12),
          _buildInfoCard(
            context,
            children: [
              _buildInfoRow(
                context,
                label: 'FCM Token',
                value: fcmToken.when(
                  data: (token) => token ?? 'Not available',
                  loading: () => 'Fetching token...',
                  error: (_, __) => 'Error fetching token',
                ),
                icon: Icons.notifications_active_outlined,
                isCopyable: true,
                isLongValue: true,
              ),
            ],
          ),
          const SizedBox(height: 40),
          if (isRegistered)
            Column(
              children: [
                OutlinedButton.icon(
                  onPressed: isLoading
                      ? null
                      : () => ref
                          .read(userDeviceControllerProvider.notifier)
                          .unregisterDevice(context),
                  icon: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.no_cell, color: AppColors.error),
                  label: const Text(
                    'Remove Device',
                    style: TextStyle(color: AppColors.error),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    side: const BorderSide(color: AppColors.error),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Registered ID: ${registrationState.value?.id}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondaryLight,
                      ),
                ),
              ],
            )
          else
            ElevatedButton.icon(
              onPressed: isLoading
                  ? null
                  : () => ref
                      .read(userDeviceControllerProvider.notifier)
                      .registerDevice(context),
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.app_registration),
              label: const Text('Register Device'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Last Updated: ${DateTime.now().toString().split('.')[0]}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool isCopyable = false,
    bool isLongValue = false,
  }) {
    return Row(
      crossAxisAlignment:
          isLongValue ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
              ),
              const SizedBox(height: 4),
              isLongValue
                  ? Text(
                      value,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Courier',
                            fontSize: 13,
                          ),
                    )
                  : Text(
                      value,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
            ],
          ),
        ),
        if (isCopyable &&
            value != 'Loading...' &&
            value != 'Error' &&
            value != 'Not available')
          IconButton(
            icon: const Icon(Icons.copy, size: 18),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$label copied to clipboard'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            color: AppColors.primary,
            visualDensity: VisualDensity.compact,
          ),
      ],
    );
  }
}
