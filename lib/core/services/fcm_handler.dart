import 'package:app/app/navigation_keys.dart';
import 'package:app/core/providers/firebase_messaging_provider.dart';
import 'package:app/core/providers/pending_notification_provider.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_handler.g.dart';

class FcmHandler {
  final Ref ref;
  final FirebaseMessaging fcm;

  FcmHandler(this.ref, this.fcm);

  Future<void> init() async {
    LoggerUtil.info("Initializing FcmHandler...");

    // 1. Permisi Notifikasi (Android 13+)
    await fcm.requestPermission(alert: true, badge: true, sound: true);

    // 2. Handle click saat app di background (bukan terminated)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // 3. Handle click saat app terminated
    final initialMessage = await fcm.getInitialMessage();
    if (initialMessage != null) {
      LoggerUtil.info("App opened from terminated state via notification");
      _handleMessage(initialMessage);
    }

    // 4. Handle foreground message
    FirebaseMessaging.onMessage.listen((message) {
      LoggerUtil.info(
        "Foreground message received: ${message.notification?.title}",
      );

      final context = rootNavigatorKey.currentContext;
      if (context != null && context.mounted && message.notification != null) {
        ToastUtil.showSuccess(
          context,
          title: message.notification?.title ?? "Notifikasi",
          description: message.notification?.body ?? "",
          action: const Text(
            "LIHAT",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          actionHandler: () {
            _handleMessage(message);
          },
          toastDuration: const Duration(seconds: 5),
        );
      }
    });

    LoggerUtil.info("FcmHandler initialized.");
  }

  void _handleMessage(RemoteMessage message) {
    LoggerUtil.info("Notification clicked! Data: ${message.data}");

    final reminderHookId = message.data['data'];
    if (reminderHookId != null) {
      LoggerUtil.info("Registering pending notification: $reminderHookId");
      ref
          .read(pendingNotificationProvider.notifier)
          .setNotification(reminderHookId);
    } else {
      LoggerUtil.warning("reminder_hook_id not found in notification data");
    }
  }
}

@Riverpod(keepAlive: true)
FcmHandler fcmHandler(Ref ref) {
  final fcm = ref.watch(firebaseMessagingProvider);
  return FcmHandler(ref, fcm);
}
