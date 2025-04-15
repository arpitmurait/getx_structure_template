import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/values/app_keys.dart';
import 'package:getx_structure_template/app/data/local/hive/hive_manager.dart';
import 'package:getx_structure_template/localization/localization.dart';
import '/app/core/base/base_controller.dart';

class SettingsController extends BaseController {
  final HiveManager hiveManager = Get.find(tag: (HiveManager).toString());
  ThemeMode themeMode = ThemeMode.system;
  String? currentLocale;

  updateChanges(){
    String mode = hiveManager.getString(HiveManager.themeModeKey);
    themeMode = mode.isEmpty ?ThemeMode.system : ThemeMode.values.firstWhere((element) => element.name == mode,);
    update([AppKeys.themeMode]);

    currentLocale = getLanguageCodeFromName(hiveManager.getString(HiveManager.localeKey));
    update([AppKeys.locale]);
  }

  @override
  void onInit() {
    updateChanges();
    super.onInit();
  }

}
