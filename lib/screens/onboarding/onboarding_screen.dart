import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';
import 'widgets/onboarding_content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller using Get.put()
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: TextButton(
                  onPressed: controller.completeOnboarding,
                  child: const Text('Skip', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  final item = controller.onboardingPages[index];
                  return OnboardingPageContent(
                    imageAsset: item.imageAsset,
                    title: item.title,
                    description: item.description,
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dots Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.onboardingPages.length,
                          (index) => Obx(() {
                        return AnimatedContainer(
                          duration: 200.milliseconds,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentPageIndex.value == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPageIndex.value == index
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }),
                    ),
                  ),

                  // Next / Get Started Button
                  Obx(() {
                    return ElevatedButton(
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(16.w),
                      ),
                      child: controller.isLastPage
                          ? const Icon(Icons.check)
                          : const Icon(Icons.arrow_forward),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
