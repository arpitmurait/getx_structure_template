import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/base/base.dart';
import 'package:getx_structure_template/app/data/repository/auth/auth_repository.dart';
import 'package:getx_structure_template/app/routes/app_pages.dart';

class RegisterController extends BaseController {
  final AuthRepository _repository =
  Get.find(tag: (AuthRepository).toString());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register(){
    var registerService = _repository.register({
      'name' : nameController.text.trim(),
      'email' : emailController.text.toLowerCase().trim(),
      'password' : passwordController.text.trim()
    });

    callDataService(
      registerService,
      onSuccess: (response) {
        Get.toNamed(Routes.MAIN);
      },
    );
  }

}
