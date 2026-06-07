import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

const _tag = 'DemoLocalNotificationService';
const _demoNotificationId = 1001;
const _approvalNotificationId = 1002;
const _markSubmittedNotificationId = 1003;
const _markStatusNotificationBase = 3000;
const _newsPublishedNotificationId = 1005;
const _navigateHomePayload = 'navigate_home';
const _approvalGrantedPayload = 'approval_granted';
const _markSubmittedPayload = 'mark_submitted';
const _markStatusChangedPayload = 'mark_status_changed';
const _newsPublishedPayload = 'news_published';
const _demoDelay = Duration(seconds: 3);

const _demoTitle = 'Новое сообщение';
const _demoBody = 'Вам пришло новое сообщение от администратора';

const _approvalTitle = 'City Drive';
const _approvalBody = 'Вы успешно зарегистрировались!';

const _markSubmittedTitle = 'Заявка отправлена';
const _markSubmittedBody =
    'Ваша отметка принята на рассмотрение в админ-панели. Ожидайте push после проверки.';

const _markStatusChangedTitle = 'Статус отметки изменён';

const _newsPublishedTitle = 'Новое объявление';

const _channelId = 'demo_push_channel';
const _channelName = 'Сообщения';
const _channelDescription = 'Уведомления о новых сообщениях';

const AndroidNotificationChannel _demoChannel = AndroidNotificationChannel(
  _channelId,
  _channelName,
  description: _channelDescription,
  importance: Importance.max,
  playSound: true,
  enableVibration: true,
);

const NotificationDetails _demoNotificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    _channelId,
    _channelName,
    channelDescription: _channelDescription,
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher',
    category: AndroidNotificationCategory.message,
    styleInformation: BigTextStyleInformation(_demoBody),
    visibility: NotificationVisibility.public,
  ),
  iOS: DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
    interruptionLevel: InterruptionLevel.active,
    threadIdentifier: 'admin_messages',
  ),
);

NotificationDetails _notificationDetails(String body) => NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        category: AndroidNotificationCategory.message,
        styleInformation: BigTextStyleInformation(body),
        visibility: NotificationVisibility.public,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        interruptionLevel: InterruptionLevel.active,
        threadIdentifier: 'admin_messages',
      ),
    );

/// Локальное push-уведомление для демонстрации дипломного проекта (без Firebase).
final class DemoLocalNotificationService {
  DemoLocalNotificationService._();

  static final DemoLocalNotificationService instance = DemoLocalNotificationService._();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  RootStackRouter? _router;
  Timer? _foregroundTimer;
  DateTime? _scheduleStartedAt;
  bool _initialized = false;
  bool _demoNotificationShown = false;
  _DemoNotificationLifecycleObserver? _lifecycleObserver;

  void bindRouter(RootStackRouter router) {
    _router = router;
    unawaited(_handleLaunchFromNotification());
    unawaited(_startDemoNotificationSchedule());
  }

  Future<void> init() async {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationTap,
    );

    if (Platform.isAndroid) {
      final androidPlugin = _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.createNotificationChannel(_demoChannel);
      await androidPlugin?.requestNotificationsPermission();
    }

    if (Platform.isIOS) {
      final iosPlugin = _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      await iosPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    _lifecycleObserver ??= _DemoNotificationLifecycleObserver(this);
    WidgetsBinding.instance.addObserver(_lifecycleObserver!);

    _initialized = true;
    log('initialized', name: _tag);
  }

  Future<void> _startDemoNotificationSchedule() async {
    if (!_initialized) {
      log('not initialized, skipping schedule', name: _tag);
      return;
    }

    _demoNotificationShown = false;
    _scheduleStartedAt = DateTime.now();
    await _applySchedule();
  }

  Duration get _remainingDelay {
    if (_scheduleStartedAt == null) return _demoDelay;
    final remaining = _demoDelay - DateTime.now().difference(_scheduleStartedAt!);
    return remaining.isNegative ? Duration.zero : remaining;
  }

  bool get _isForeground {
    final state = WidgetsBinding.instance.lifecycleState;
    return state == null ||
        state == AppLifecycleState.resumed ||
        state == AppLifecycleState.inactive;
  }

  Future<void> _applySchedule() async {
    _cancelForegroundTimer();
    await _plugin.cancel(_demoNotificationId);

    if (_demoNotificationShown || !_initialized || _scheduleStartedAt == null) return;

    final remaining = _remainingDelay;
    if (remaining == Duration.zero) {
      await _showDemoNotification();
      return;
    }

    if (_isForeground) {
      _foregroundTimer = Timer(remaining, () => unawaited(_showDemoNotification()));
      log('foreground timer: $remaining', name: _tag);
      return;
    }

    final scheduledTime = tz.TZDateTime.now(tz.local).add(remaining);
    try {
      await _plugin.zonedSchedule(
        _demoNotificationId,
        _demoTitle,
        _demoBody,
        scheduledTime,
        _demoNotificationDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        payload: _navigateHomePayload,
      );
      log('OS schedule: $remaining ($scheduledTime)', name: _tag);
    } catch (e, stackTrace) {
      log('OS schedule failed: $e\n$stackTrace', name: _tag);
    }
  }

  void _onAppLifecycleChanged() {
    if (_demoNotificationShown || _scheduleStartedAt == null) return;
    unawaited(_applySchedule());
  }

  void _cancelForegroundTimer() {
    _foregroundTimer?.cancel();
    _foregroundTimer = null;
  }

  Future<void> _showDemoNotification() async {
    if (_demoNotificationShown) return;
    _demoNotificationShown = true;
    _cancelForegroundTimer();
    await _plugin.cancel(_demoNotificationId);

    await _plugin.show(
      _demoNotificationId,
      _demoTitle,
      _demoBody,
      _demoNotificationDetails,
      payload: _navigateHomePayload,
    );

    log('demo notification shown', name: _tag);
  }

  /// Push после одобрения регистрации администратором.
  Future<void> showRegistrationApprovedNotification() async {
    await _showCustomNotification(
      id: _approvalNotificationId,
      title: _approvalTitle,
      body: _approvalBody,
      payload: _approvalGrantedPayload,
    );
  }

  /// Push сразу после публикации отметки на карте.
  Future<void> showMarkSubmittedNotification() async {
    await _showCustomNotification(
      id: _markSubmittedNotificationId,
      title: _markSubmittedTitle,
      body: _markSubmittedBody,
      payload: _markSubmittedPayload,
    );
  }

  /// Push при любом изменении статуса отметки администратором.
  Future<void> showMarkStatusChangedNotification({
    required int markId,
    required String status,
    String? title,
  }) async {
    await _showCustomNotification(
      id: _markStatusNotificationId(markId, status),
      title: _markStatusChangedTitle,
      body: _markStatusMessage(title: title, status: status),
      payload: _markStatusChangedPayload,
    );
  }

  /// Push при публикации объявления в админ-pанели.
  Future<void> showNewsPublishedNotification({
    required String title,
    int? newsId,
  }) async {
    final body = title.isNotEmpty
        ? 'Опубликовано новое объявление: $title'
        : 'Администратор опубликовал новое объявление.';

    await _showCustomNotification(
      id: _newsPublishedNotificationId + (newsId ?? title.hashCode.abs() % 1000),
      title: _newsPublishedTitle,
      body: body,
      payload: _newsPublishedPayload,
    );
  }

  Future<void> _showCustomNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    if (!_initialized) return;

    await _plugin.show(
      id,
      title,
      body,
      _notificationDetails(body),
      payload: payload,
    );

    log('notification shown: $title', name: _tag);
  }

  Future<void> _handleLaunchFromNotification() async {
    final launchDetails = await _plugin.getNotificationAppLaunchDetails();
    if (launchDetails?.didNotificationLaunchApp ?? false) {
      if (launchDetails!.notificationResponse?.payload == _navigateHomePayload) {
        _demoNotificationShown = true;
      }
      _onNotificationTap(launchDetails.notificationResponse!);
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    switch (response.payload) {
      case _navigateHomePayload:
      case _approvalGrantedPayload:
      case _markSubmittedPayload:
      case _markStatusChangedPayload:
      case _newsPublishedPayload:
        _navigateToHome();
      default:
        break;
    }
  }

  void _navigateToHome() {
    final router = _router;
    if (router == null) {
      log('router not bound yet', name: _tag);
      return;
    }

    router.replace(const LauncherRoute());
    log('navigated to home (LauncherRoute)', name: _tag);
  }
}

int _markStatusNotificationId(int markId, String status) {
  return _markStatusNotificationBase + markId * 10 + _statusOrdinal(status);
}

int _statusOrdinal(String status) => switch (status) {
      'new' => 1,
      'pending' => 2,
      'confirmed' => 3,
      'controller_assigned' => 4,
      'rejected' => 5,
      'in_progress' => 6,
      'report_submitted' => 7,
      'fixed' => 8,
      _ => 9,
    };

String _markStatusMessage({String? title, required String status}) {
  final name =
      title != null && title.isNotEmpty ? '«$title»' : 'Ваша отметка';

  return switch (status) {
    'confirmed' => '$name принята администратором и опубликована на карте.',
    'controller_assigned' =>
      '$name принята вами. Ожидает подтверждения администратором.',
    'rejected' => '$name отклонена администратором.',
    'in_progress' => '$name принята в работу. Можно отправить отчёт.',
    'report_submitted' => '$name: отчёт отправлен, ожидает проверки администратором.',
    'fixed' => '$name: работа принята администратором.',
    'pending' || 'new' => '$name: на проверке администратором.',
    _ => '$name: новый статус — ${_statusLabelRu(status)}.',
  };
}

String _statusLabelRu(String status) => switch (status) {
      'new' || 'pending' => 'На проверке',
      'confirmed' => 'Принята',
      'controller_assigned' => 'Проверка админом',
      'rejected' => 'Отклонена',
      'in_progress' => 'В работе',
      'report_submitted' => 'На проверке',
      'fixed' => 'Исправлено',
      _ => status,
    };

@pragma('vm:entry-point')
void _onBackgroundNotificationTap(NotificationResponse response) {
  // Навигация выполняется при возврате приложения на передний план.
}

final class _DemoNotificationLifecycleObserver with WidgetsBindingObserver {
  _DemoNotificationLifecycleObserver(this._service);

  final DemoLocalNotificationService _service;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _service._onAppLifecycleChanged();
  }
}
