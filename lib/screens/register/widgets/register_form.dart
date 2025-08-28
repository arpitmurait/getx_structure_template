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
            hint: AppStrings.fullName.tr,
            trailingSvg: AppImages.icLoginUser,
            controller: controller.nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            hint: AppStrings.email.tr,
            keyboardType: TextInputType.emailAddress,
            trailingSvg: AppImages.icLogiMail,
            controller: controller.emailController,
            validator: (value) {
              final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            hint: AppStrings.password.tr,
            controller: controller.passwordController,
            obscure: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
