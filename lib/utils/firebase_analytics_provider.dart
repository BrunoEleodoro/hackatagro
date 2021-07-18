import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hackatagro/services/safety/change_notifier_safety.dart';
import 'package:hackatagro/utils/app_config.dart';

class FirebaseAnalyticsProvider extends ChangeNotifierSafety {
  void logEvent(String action, Map<String, String> event) async {
    await FirebaseAnalytics().logEvent(
        name: Platform.isIOS
            ? action + "_" + AppConfig.I.env.firebaseTag.toString() + "_ios"
            : action +
                "_" +
                AppConfig.I.env.firebaseTag.toString() +
                "_android",
        parameters: event);
    print('event sent');
  }

  @override
  void resetState() {}
}
