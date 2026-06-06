import 'dart:async';
import 'dart:developer';

import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/app/logic/demo_local_notification_service.dart';
import 'package:city_drive/src/feature/main/data/news_remote_ds.dart';
import 'package:city_drive/src/feature/search/data/road_problem_remote_ds.dart';

const _tag = 'AdminUpdatesPollingService';
const _pollInterval = Duration(seconds: 5);

/// Опрос API: изменения статусов отметок и новые объявления из админ-панели.
final class AdminUpdatesPollingService {
  AdminUpdatesPollingService._();

  static final AdminUpdatesPollingService instance = AdminUpdatesPollingService._();

  RoadProblemRemoteDS? _marksRemote;
  NewsRemoteDS? _newsRemote;

  Timer? _timer;
  bool _running = false;
  bool _marksBaselineSet = false;
  bool _newsBaselineSet = false;
  bool _polling = false;

  /// Вызывается после каждого успешного опроса — обновить UI.
  void Function()? onPollTick;

  final Map<int, String> _lastMarkStatus = {};
  final Set<int> _knownNewsIds = {};

  void configure({
    required RoadProblemRemoteDS marksRemote,
    required NewsRemoteDS newsRemote,
  }) {
    _marksRemote = marksRemote;
    _newsRemote = newsRemote;
  }

  void start() {
    if (_running || _marksRemote == null || _newsRemote == null) return;
    _running = true;
    _timer?.cancel();
    _timer = Timer.periodic(_pollInterval, (_) => unawaited(_poll()));
    unawaited(_poll());
    log('started', name: _tag);
  }

  void stop() {
    _running = false;
    _timer?.cancel();
    _timer = null;
    log('stopped', name: _tag);
  }

  /// Фиксирует начальный статус после отправки (push «отправлено» уже показан).
  void trackSubmittedMark(int markId, {String? status}) {
    if (markId <= 0) return;
    _lastMarkStatus[markId] = status ?? ReportStatus.newReport;
    _marksBaselineSet = true;
  }

  Future<void> _poll() async {
    if (!_running || _polling) return;
    _polling = true;

    try {
      await Future.wait([
        _pollMarks(),
        _pollNews(),
      ]);
      onPollTick?.call();
    } catch (e, st) {
      log('poll error: $e\n$st', name: _tag);
    } finally {
      _polling = false;
    }
  }

  Future<void> _pollMarks() async {
    final remote = _marksRemote;
    if (remote == null) return;

    final mine = await remote.fetchMine();

    if (!_marksBaselineSet) {
      for (final mark in mine) {
        _lastMarkStatus[mark.id] = mark.status ?? ReportStatus.newReport;
      }
      _marksBaselineSet = true;
      return;
    }

    for (final mark in mine) {
      final current = mark.status ?? ReportStatus.newReport;
      final previous = _lastMarkStatus[mark.id];

      if (previous == null) {
        _lastMarkStatus[mark.id] = current;
        continue;
      }

      if (previous == current) continue;

      _lastMarkStatus[mark.id] = current;
      await DemoLocalNotificationService.instance.showMarkStatusChangedNotification(
        markId: mark.id,
        status: current,
        title: mark.title,
      );
      log('mark ${mark.id}: $previous → $current', name: _tag);
    }
  }

  Future<void> _pollNews() async {
    final remote = _newsRemote;
    if (remote == null) return;

    final news = await remote.fetchList(limit: 50);

    if (!_newsBaselineSet) {
      _knownNewsIds.addAll(news.map((n) => n.id));
      _newsBaselineSet = true;
      return;
    }

    for (final item in news) {
      if (!_knownNewsIds.add(item.id)) continue;
      await DemoLocalNotificationService.instance.showNewsPublishedNotification(
        title: item.title,
        newsId: item.id,
      );
    }
  }
}
