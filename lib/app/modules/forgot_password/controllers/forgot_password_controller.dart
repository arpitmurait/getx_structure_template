import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/base/base.dart';
import '../../../data/repository/auth/auth_repository.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends BaseController {
  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());
  TextEditingController emailController = TextEditingController();

  void forgotPassword(){
    var forgotPasswordService = _repository.forgotPassword({
      'email' : emailController.text.toLowerCase().trim()
    });

    callDataService(
      forgotPasswordService,
      onSuccess: (response) {
        Get.toNamed(Routes.VERIFY_OTP);
      },
    );
  }

}
