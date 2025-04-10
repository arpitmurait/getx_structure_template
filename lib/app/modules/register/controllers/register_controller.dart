import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/base/base.dart';
import 'package:getx_structure_template/app/data/repository/auth/auth_repository.dart';
import 'package:getx_structure_template/app/routes/app_pages.dart';

class RegisterController extends BaseController {
  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void register() {
    var registerService = _repository.register({
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
      'phone_number': phoneNumberController.text.trim(),
      'email': emailController.text.toLowerCase().trim(),
      'password': passwordController.text.trim(),
    });

    callDataService(
      registerService,
      onSuccess: (response) {
        Get.toNamed(Routes.MAIN);
      },
    );
  }
}
