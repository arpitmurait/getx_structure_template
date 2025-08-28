import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bindings/initial_binding.dart';
import 'core/values/theme_data.dart';
import 'data/local/hive/hive_manager.dart';
import 'localization/localization.dart';
import 'routes/app_pages.dart';

ValueNotifier<Locale> selectedLocale = ValueNotifier(Locale('en'));
ValueNotifier<bool> isDarkTheme = ValueNotifier(false);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveManager.appName);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Force rebuild or reinit logic if necessary
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return ValueListenableBuilder(
          valueListenable: selectedLocale,
          builder: (context, value, child) {
            return ValueListenableBuilder(
              valueListenable: isDarkTheme,
              builder: (context, themeValue, child) {
                return GetMaterialApp(
                  title: 'getx_structure_template',
                  initialRoute: AppRoutes.splash,
                  initialBinding: InitialBinding(),
                  getPages: AppPages.routes,
                  localizationsDelegates: [
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    // LocalizationService.delegate(),
                  ],
                  builder: EasyLoading.init(
                    builder: (context, child) => child!,
                  ),
                  locale: value,
                  supportedLocales: supportedLocales,
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: themeValue ? ThemeMode.dark : ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  translations: AppTranslations(),
                );
              }
            );
          },
        );
      },
    );
  }
}
