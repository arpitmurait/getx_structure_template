import 'package:flutter/material.dart';
import 'package:getx_structure_template/app/core/base/base.dart';
import 'package:getx_structure_template/app/core/widget/custom_app_bar.dart';

import '../controllers/register_controller.dart';

class RegisterView extends BaseView<RegisterController> {
  RegisterView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Register");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.firstNameController,
          decoration: InputDecoration(hintText: "First Name"),
        ),
        TextField(
          controller: controller.lastNameController,
          decoration: InputDecoration(hintText: "Last Name"),
        ),
        TextField(
          controller: controller.phoneNumberController,
          decoration: InputDecoration(hintText: "Phone Number"),
        ),
        TextField(
          controller: controller.emailController,
          decoration: InputDecoration(hintText: "Email"),
        ),
        TextField(
          controller: controller.passwordController,
          decoration: InputDecoration(hintText: "Password"),
        ),
        ElevatedButton(
          onPressed: () {
            controller.register();
          },
          child: Text("Register"),
        ),
      ],
    );
  }
}
