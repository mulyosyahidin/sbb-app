import 'package:app/core/services/notification_service.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_service.g.dart';

@Riverpod(keepAlive: true)
FcmService fcmService(Ref ref) {
  return FcmService();
}

@riverpod
Future<String?> fetchFcmToken(Ref ref) {
  return ref.watch(fcmServiceProvider).getToken();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  LoggerUtil.info('Handling a background message: ${message.messageId}');
}

class FcmService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  NotificationService? _notificationService;

  Future<void> init([NotificationService? notificationService]) async {
    _notificationService = notificationService;

    // Request permissions for iOS/Android
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      LoggerUtil.success('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      LoggerUtil.warning('User granted provisional permission');
    } else {
      LoggerUtil.error('User declined or has not accepted permission');
    }

    // Register Background Handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LoggerUtil.info('Got a message whilst in the foreground!');
      _showLocalNotification(message);
    });

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      LoggerUtil.info('Notification tapped! Opened from background.');
      // Handle navigation or logic here
    });

    // Handle notification tap when app is terminated
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      LoggerUtil.info('App opened from terminated state via notification.');
      // Handle initial notification
    }
  }

  void _showLocalNotification(RemoteMessage message) {
    if (_notificationService == null) return;

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _notificationService!.showNotification(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        payload: message.data.toString(),
      );
    }
  }

  Future<String?> getToken() async {
    try {
      return await _messaging.getToken();
    } catch (e) {
      LoggerUtil.error('Error fetching FCM token: $e');
      return null;
    }
  }

  Stream<String> onTokenRefresh() {
    return _messaging.onTokenRefresh;
  }
}
