
import 'package:get/get.dart';

///  this class contains all app strings definition.
///  it helps to centralize all strings.

isArabicLanguage() => Get.locale?.countryCode == 'ar';

class AppStrings {
  static String forgotPassword = 'forgotPassword';
  static String dontHaveAccount = 'dontHaveAccount';
  static String alreadyHaveAccount = 'alreadyHaveAccount';
  static String fullName = 'fullName';
  static String logIn = 'logIn';
  static String email = 'email';
  static String register = 'register';
  static String password = 'password';
  static String yes = 'yes';
  static String no = 'no';

}