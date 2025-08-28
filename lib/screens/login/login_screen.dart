import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/routes/app_pages.dart';
import '/core/core.dart';
import 'login_controller.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            SizedBox(height: 40.h),
            Center(
              child: Text(
                AppStrings.logIn.tr.toUpperCase(),
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(text: AppStrings.dontHaveAccount.tr),
                    TextSpan(text: ' '),
                    TextSpan(
                      text: AppStrings.register.tr,
                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.register);
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            LoginFormWidget(formKey: formKey,),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {

              },
              child: Text(
                AppStrings.forgotPassword.tr,
                style: TextStyle(fontSize: 14.sp, decoration: TextDecoration.underline, fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? true) {
                  controller.login();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pinkButton,
                fixedSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
              ),
              child: Text(AppStrings.logIn.tr, style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

}
