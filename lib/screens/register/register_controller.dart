import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/model/model.dart';
import '../../network/error_handlers.dart';
import '../../routes/app_pages.dart';
import '/data/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register()async{
    try{
      UserModel user = await _repository.register({
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
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
