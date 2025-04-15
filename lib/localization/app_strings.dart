import 'package:get/get.dart';
import 'localization.dart';

///  this class contains all app strings definition.
///  it helps to centralize all strings.

extension Localized on String {
  String toLocalized() => LocalizationService.of(Get.context!)!.translate(this);
}

class AppStrings {
  static String bottomNavHome = 'bottomNavHome';
  static String bottomNavFavorite = 'bottomNavFavorite';
  static String bottomNavSettings = 'bottomNavSettings';
  static String titleOtherView = 'titleOtherView';
  static String settingsTheme = 'settingsTheme';
  static String settingsLanguage = 'settingsLanguage';
  static String settingsFontSize = 'settingsFontSize';
}