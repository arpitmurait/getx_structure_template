import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends BaseView<ForgotPasswordController> {
  ForgotPasswordView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: "Forgot Password");
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
        SizedBox(height: 15,),
        ElevatedButton(onPressed: () {
          controller.forgotPassword();
        }, child: Text("Send Code")),
      ],
    );
  }

}
