import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import '/core/values/app_colors.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
        body: Container(
          color: AppColors.kPrimaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://dummyimage.com/100x100',
                  height: 100.w,
                  width: 100.w,
                ),
                const SizedBox(height: 8),
                Text(
                  'Demo',
                  style: TextStyle(
                    fontSize: 45.sp,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }

}
