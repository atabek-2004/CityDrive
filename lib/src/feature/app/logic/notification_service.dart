import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:city_drive/src/feature/app/logic/push_data_dto.dart';
import 'package:city_drive/src/feature/app/logic/reactivex_service.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/database/auth_dao.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:city_drive/src/feature/app/logic/firebase_bootstrap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const _tag = 'NotificationService';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
);

class NotificationService {
  NotificationService();

  bool get _isFirebaseReady => FirebaseBootstrap.isReady;

  late FirebaseMessaging _messaging;

  // Future<void> saveDeviceToken({
  //   required IAuthDao authDao,
  // }) async {
  //   try {
  //     final deviceToken = await getDeviceToken(authDao: authDao);
  //     if (deviceToken != null) {
  //       await authDao.deviceToken.setValue(deviceToken);
  //     }
  //     log('$deviceToken', name: _tag);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> init() async {
    if (!_isFirebaseReady) {
      log('Firebase not configured, notifications disabled', name: _tag);
      return;
    }
    _messaging = FirebaseMessaging.instance;
    _messaging.getInitialMessage().then((value) => log('Message is $value', name: _tag));

    if (Platform.isIOS) {
      await _requestPermissionToNotifications(_messaging);
    }

    _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_notification');
    const initializationSettingsIOs = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOs,
    );
    // ignore: avoid-ignoring-return-values
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      final RemoteNotification? notification = event.notification;
      log('event˝ data --- ${event.data}', name: _tag);

      ///
      /// parse zone
      ///
      try {
        final data = PushDataDTO.fromJson(event.data);
        ReactiveXService().pushRepeater.sink.add(data);
      } catch (e) {
        log('catch - $e', name: _tag);
        rethrow;
      }

      final AndroidNotification? android = Platform.isAndroid ? event.notification?.android : null;

      if (notification != null) {
        if (Platform.isAndroid && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
        }
      }
    });
  }

  Future<void> onMessageOpenedApp(BuildContext context) async {
    if (!_isFirebaseReady) return;
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        if (!context.mounted) return;
        _handleOnTap(message, context);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      if (!context.mounted) return;
      _handleOnTap(event, context);
    });
  }

  /// Handle firebase notification tap
  void _handleOnTap(RemoteMessage event, BuildContext context) {
    log('"ONTAP:::" data --- ${event.data}', name: _tag);
    log('"ONTAP:" data --- ${event.data['type']}', name: _tag);

    try {
      final data = PushDataDTO.fromJson(event.data);
      log('${data.feedbackId}', name: 'feedback id from push');
      // context.router.replaceAll([LauncherRoute(), const DiagnosticsRoute()]);
    } catch (e, stackTrace) {
      log('Error navigating to detail screen: $e\n$stackTrace', name: _tag);
    }
  }

  Future<String?> getDeviceToken({
    required IAuthDao authDao,
  }) async {
    if (!_isFirebaseReady) return null;
    if (Platform.isIOS) {
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken == null) {
        log('APNs token not available, retrying after 5 seconds');
        await Future<void>.delayed(const Duration(seconds: 5));
        apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        if (apnsToken == null) {
          log('Failed to retrieve APNs token after retry');
          return null; // Exit if APNs token is still null
        }
      }
      log('APNs token: $apnsToken');
    }
    final String? deviceToken = await FirebaseMessaging.instance.getToken();
    log('device token - $deviceToken');
    if (deviceToken != null) {
      await authDao.deviceToken.setValue(deviceToken);
    }
    return deviceToken;
  }

  Future<void> _requestPermissionToNotifications(
    FirebaseMessaging messaging,
  ) async {
    final NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  Future<void> subscribeToTopic({
    required String topic,
  }) async {
    if (!_isFirebaseReady) return;
    try {
      await FirebaseMessaging.instance.subscribeToTopic('push_$topic');
    } catch (e) {
      log('$e', name: _tag);
    }
  }

  Future<void> unsubscribeFromTopic({
    required String topic,
  }) async {
    if (!_isFirebaseReady) return;
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic('push_$topic');
    } catch (e) {
      log('$e', name: _tag);
    }
  }
}
