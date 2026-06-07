import 'dart:async';

import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/app/logic/demo_local_notification_service.dart';
import 'package:city_drive/src/feature/controller/data/controller_repository.dart';
import 'package:city_drive/src/feature/controller/models/controller_dashboard_dto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'controller_dashboard_cubit.freezed.dart';

const _pollInterval = Duration(seconds: 5);

class ControllerDashboardCubit extends Cubit<ControllerDashboardState> {
  ControllerDashboardCubit({required IControllerRepository repository})
      : _repository = repository,
        super(const ControllerDashboardState.initial());

  final IControllerRepository _repository;
  Timer? _pollTimer;
  String? _q;
  String? _severity;
  String? _type;
  final Map<int, String> _markStatusById = {};

  void startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(_pollInterval, (_) {
      unawaited(refreshSilently());
    });
  }

  void stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  Future<void> load({
    String? q,
    String? severity,
    String? type,
  }) async {
    _q = q;
    _severity = severity;
    _type = type;

    emit(const ControllerDashboardState.loading());
    try {
      final dashboard = await _repository.getDashboard(
        q: q,
        severity: severity,
        type: type,
      );
      _syncMarkStatuses(dashboard, notifyTransitions: false);
      emit(ControllerDashboardState.loaded(dashboard: dashboard));
    } catch (e) {
      emit(ControllerDashboardState.error(message: e.toString()));
    }
  }

  Future<void> refreshSilently() async {
    final shouldRefresh = state.maybeWhen(
      loaded: (_) => true,
      loading: () => true,
      orElse: () => false,
    );
    if (!shouldRefresh) return;
    try {
      final dashboard = await _repository.getDashboard(
        q: _q,
        severity: _severity,
        type: _type,
      );
      await _syncMarkStatuses(dashboard, notifyTransitions: true);
      emit(ControllerDashboardState.loaded(dashboard: dashboard));
    } catch (_) {}
  }

  Future<void> _syncMarkStatuses(
    ControllerDashboardDTO dashboard, {
    required bool notifyTransitions,
  }) async {
    for (final mark in dashboard.myMarks) {
      final id = mark.id;
      final current = mark.status ?? '';
      final previous = _markStatusById[id];

      if (notifyTransitions &&
          previous == ReportStatus.inProgress &&
          current == ReportStatus.reportSubmitted) {
        await DemoLocalNotificationService.instance
            .showMarkStatusChangedNotification(
          markId: id,
          status: current,
          title: mark.title,
        );
      }

      if (notifyTransitions &&
          previous == ReportStatus.controllerAssigned &&
          current == ReportStatus.inProgress) {
        await DemoLocalNotificationService.instance
            .showMarkStatusChangedNotification(
          markId: id,
          status: current,
          title: mark.title,
        );
      }

      if (notifyTransitions &&
          previous == ReportStatus.reportSubmitted &&
          current == ReportStatus.fixed) {
        await DemoLocalNotificationService.instance
            .showMarkStatusChangedNotification(
          markId: id,
          status: current,
          title: mark.title,
        );
      }

      _markStatusById[id] = current;
    }
  }

  @override
  Future<void> close() {
    stopPolling();
    return super.close();
  }
}

@freezed
class ControllerDashboardState with _$ControllerDashboardState {
  const factory ControllerDashboardState.initial() = _InitialState;

  const factory ControllerDashboardState.loading() = _LoadingState;

  const factory ControllerDashboardState.loaded({
    required ControllerDashboardDTO dashboard,
  }) = _LoadedState;

  const factory ControllerDashboardState.error({required String message}) =
      _ErrorState;
}
