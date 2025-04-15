import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/localization/localization.dart';

import '/app/bindings/initial_binding.dart';
import '/app/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'core/values/theme_data.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          title: _envConfig.appName,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.routes,
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            LocalizationService.delegate(),
          ],
          supportedLocales: supportedLocales,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          // themeMode: HiveStoreUtil.getBool(HiveStoreUtil.darkModeKey) ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
