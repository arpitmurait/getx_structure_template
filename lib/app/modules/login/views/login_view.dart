import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/app/routes/app_pages.dart';

import '../../../core/base/base.dart';
import '../../../core/widget/widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Login");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.emailController,
          decoration: InputDecoration(
            hintText: "Email",
          ),
        ),
        TextField(
          controller: controller.passwordController,
          decoration: InputDecoration(
            hintText: "Password",
          ),
        ),
        ElevatedButton(onPressed: () {
          controller.login();
        }, child: Text("Login")),
        SizedBox(height: 15,),
        TextButton(onPressed: () {
          Get.toNamed(Routes.REGISTER);
        }, child: Text("Register")),
      ],
    );
  }

}
