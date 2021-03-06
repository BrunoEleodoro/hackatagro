import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackatagro/services/safety/base_stateless.dart';
import 'package:hackatagro/utils/app_config.dart';
import 'package:hackatagro/widgets/w_text_rounded.dart';

// ignore: must_be_immutable
class WEnv extends BaseStateless {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Env env = AppConfig.I.env;
    return env.envType != EnvType.prod
        ? WTextRounded(text: describeEnum(env.envType), color: Colors.red)
        : Container();
  }
}
