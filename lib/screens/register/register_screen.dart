import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/core/core.dart';
import 'register_controller.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          SizedBox(height: 40.h),
          Center(
            child: Text(
              AppStrings.register.tr.toUpperCase(),
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  TextSpan(text: AppStrings.alreadyHaveAccount.tr),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: AppStrings.logIn.tr,
                    style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.back();
                      },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          RegisterFormWidget(formKey: formKey,),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? true) {
                controller.register();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pinkButton,
              fixedSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
            child: Text(AppStrings.register.tr, style: TextStyle( color: Colors.white)),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
