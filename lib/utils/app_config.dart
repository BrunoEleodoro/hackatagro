import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hackatagro/utils/app_theme.dart';

enum EnvType {
  dev,
  prod,
}

/// Environment declare here
class Env {
  Env._(
      {required this.envType,
      required this.apiBaseUrl,
      required this.firebaseTag});

  /// Dev mode
  factory Env.dev() {
    return Env._(
        envType: EnvType.dev,
        apiBaseUrl: 'https://us-central1-hackatagro-759a7.cloudfunctions.net',
        firebaseTag: 'hackatagro');
  }

  /// Prod mode
  factory Env.prod() {
    return Env._(
        envType: EnvType.prod,
        apiBaseUrl: 'https://us-central1-hackatagro-759a7.cloudfunctions.net',
        firebaseTag: 'hackatagro');
  }

  final EnvType envType;
  final String apiBaseUrl;

  final String firebaseTag;
}

/// Config env
class AppConfig {
  factory AppConfig({Env? env, AppTheme? theme}) {
    if (env != null) {
      I.env = env;
    }
    if (theme != null) {
      I.theme = theme;
    }
    return I;
  }

  AppConfig._private();

  static final AppConfig I = AppConfig._private();

  Env env = Env.dev();
  AppTheme theme = AppTheme.origin();
}
