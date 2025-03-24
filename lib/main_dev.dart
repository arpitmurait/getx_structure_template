import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/data/local/hive/hive_manager.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX Template Dev",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  await Hive.initFlutter();
  await Hive.openBox(HiveManager.appName);

  runApp(const MyApp());
}
