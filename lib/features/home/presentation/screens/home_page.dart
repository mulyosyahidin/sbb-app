import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/features/home/application/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeDataAsync = ref.watch(fetchHomeDataProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(fetchHomeDataProvider),
            icon: const Icon(Icons.refresh, color: Colors.blueAccent),
          ),
          IconButton(
            onPressed: () {
              ref.read(authSessionControllerProvider.notifier).logout();
            },
            icon: const Icon(Icons.logout, color: Colors.redAccent),
          ),
        ],
      ),
      body: homeDataAsync.when(
        data: (data) => SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader("User Profile"),
              _buildUserCard(data),
              const SizedBox(height: 24),
              _buildHeader("Device Information"),
              _buildDeviceCard(data),
              const SizedBox(height: 24),
              _buildHeader("Access Token"),
              _buildTokenCard(data),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildUserCard(HomeState data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            data.user?.name ?? 'No Name',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            data.user?.email ?? 'No Email',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[200]),
          _buildInfoRow(Icons.phone_android, "Phone Number",
              data.user?.phoneNumber ?? '-'),
          _buildInfoRow(Icons.calendar_today, "Joined",
              data.user?.createdAt.toLocal().toString().split('.')[0] ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _buildDeviceCard(HomeState data) {
    if (data.device == null) {
      return const Card(child: ListTile(title: Text("No device info found")));
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey[800]!, Colors.blueGrey[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.devices, color: Colors.white70, size: 28),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.device!.deviceBrand,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.device!.deviceModel,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: data.device!.status == 'active'
                      ? Colors.greenAccent.withValues(alpha: 0.2)
                      : Colors.orangeAccent.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  data.device!.status.toUpperCase(),
                  style: TextStyle(
                    color: data.device!.status == 'active'
                        ? Colors.greenAccent
                        : Colors.orangeAccent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.white.withValues(alpha: 0.1)),
          _buildInfoRow(
              Icons.system_update_alt, "OS Version", data.device!.osVersion,
              isDark: true),
          _buildInfoRow(Icons.fingerprint, "Device ID", data.device!.deviceId,
              isDark: true),
        ],
      ),
    );
  }

  Widget _buildTokenCard(HomeState data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.vpn_key_outlined, color: Colors.blueAccent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              data.accessToken ?? 'No token found',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Colors.grey[700]),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: Add copy to clipboard
            },
            icon: const Icon(Icons.copy_all, size: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value,
      {bool isDark = false}) {
    final textColor = isDark ? Colors.white70 : Colors.black54;
    final valueColor = isDark ? Colors.white : Colors.black87;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: textColor),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: textColor, fontSize: 14)),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
                color: valueColor, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
