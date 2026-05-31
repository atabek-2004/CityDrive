import 'dart:async';
import 'package:city_drive/src/core/utils/refined_logger.dart';
import 'package:city_drive/src/feature/app/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    );
