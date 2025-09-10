import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';
import '../register_controller.dart';

class RegisterFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const RegisterFormWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find();
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.emailController,
            hintText: AppStrings.fullName.tr,
            prefixIcon: const Icon(Icons.person),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            controller: controller.emailController,
            hintText: AppStrings.email.tr,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            controller: controller.passwordController,
            hintText: AppStrings.password.tr,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              }
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
