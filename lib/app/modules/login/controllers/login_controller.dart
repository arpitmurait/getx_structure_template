import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/base/base_controller.dart';
import 'package:getx_structure_template/app/data/repository/auth/auth_repository.dart';
import 'package:getx_structure_template/app/routes/app_pages.dart';

class LoginController extends BaseController {
  final AuthRepository _repository =
  Get.find(tag: (AuthRepository).toString());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(){
    var loginService = _repository.login({
      'email' : emailController.text.toLowerCase().trim(),
      'password' : passwordController.text.trim()
    });

    callDataService(
      loginService,
      onSuccess: (response) {
        Get.toNamed(Routes.MAIN);
      },
    );
  }

}
