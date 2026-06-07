import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';

/// Переключение вкладок [BaseSecondPage] при возврате из overlay-маршрутов.
abstract final class ControllerHomeNavigation {
  static const myWorksTabIndex = 1;

  static final ValueNotifier<int?> _pendingTabIndex = ValueNotifier(null);

  static ValueListenable<int?> get pendingTabIndex => _pendingTabIndex;

  static void openMyWorks() {
    _pendingTabIndex.value = myWorksTabIndex;
  }

  static int? takePendingTab() {
    final tab = _pendingTabIndex.value;
    _pendingTabIndex.value = null;
    return tab;
  }

  static void popToHomeAndOpenMyWorks(StackRouter router) {
    openMyWorks();
    router.popUntilRouteWithName(LauncherRoute.name);
  }
}
