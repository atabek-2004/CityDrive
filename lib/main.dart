import 'dart:async';
import 'package:ikidz/src/core/utils/refined_logger.dart';
import 'package:ikidz/src/feature/app/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    );
