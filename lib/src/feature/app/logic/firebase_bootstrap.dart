import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Initializes Firebase when native config files are added to the project.
class FirebaseBootstrap {
  static bool _ready = false;
  static bool _attempted = false;

  static bool get isReady => _ready || Firebase.apps.isNotEmpty;

  static Future<bool> initialize() async {
    if (isReady) {
      _ready = true;
      return true;
    }
    if (_attempted) return false;
    _attempted = true;

    try {
      await Firebase.initializeApp();
      _ready = true;
      if (kDebugMode) {
        debugPrint('[CityDrive] Firebase initialized — push notifications enabled');
      }
      return true;
    } on FirebaseException catch (e) {
      _logSkipped(e.message ?? e.code);
      return false;
    } catch (e) {
      _logSkipped(e.toString());
      return false;
    }
  }

  static void _logSkipped(String reason) {
    if (!kDebugMode) return;
    debugPrint(
      '[CityDrive] Push notifications off: Firebase not configured. '
      'Add ios/Runner/GoogleService-Info.plist and android/app/google-services.json, '
      'then run: flutterfire configure',
    );
  }
}
