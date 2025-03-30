import 'package:get/get.dart';
import 'localization.dart';

///  this class contains all app strings definition.
///  it helps to centralize all strings.

extension Localized on String {
  String toLocalized() => LocalizationService.of(Get.context!)!.translate(this);
}

class AppStrings {
  static String bottomNavHome = 'bottomNavHome'.toLocalized();
  static String bottomNavFavorite = 'bottomNavFavorite'.toLocalized();
  static String bottomNavSettings = 'bottomNavSettings'.toLocalized();
  static String titleOtherView = 'titleOtherView'.toLocalized();
  static String settingsTheme = 'settingsTheme'.toLocalized();
  static String settingsLanguage = 'settingsLanguage'.toLocalized();
  static String settingsFontSize = 'settingsFontSize'.toLocalized();
}