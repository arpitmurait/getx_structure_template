import 'package:get/get.dart';
import '/data/local/hive/hive_manager.dart';
import '/routes/app_pages.dart';

class SplashController extends GetxController {
  HiveManager hiveManager = Get.find(tag: (HiveManager).toString());
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2),() {
      if(hiveManager.getBool(HiveManager.onboardingDoneKey)){
        if(hiveManager.getString(HiveManager.tokenKey).isEmpty){
          Get.offNamed(AppRoutes.login);
        } else {
          Get.offNamed(AppRoutes.home);
        }
      } else {
        Get.offNamed(AppRoutes.onboarding);
      }
    },);
    super.onInit();
  }
}
