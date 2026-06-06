import 'dart:async';

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
      emit(ControllerDashboardState.loaded(dashboard: dashboard));
    } catch (_) {}
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
