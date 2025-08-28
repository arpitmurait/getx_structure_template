import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/model/model.dart';
import '../../network/error_handlers.dart';
import '../../routes/app_pages.dart';
import '/data/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login()async{
    try{
      UserModel user = await _repository.login({
        "login": emailController.text.trim(),
        "password": passwordController.text.trim()
      });
      if(user.email.isNotEmpty){
        Get.toNamed(AppRoutes.home);
      }
    } catch (e) {
      logger.e(e);
    }
  }

}
