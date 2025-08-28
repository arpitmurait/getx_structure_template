import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/values/app_images.dart';
import '../../data/local/hive/hive_manager.dart';
import '../../data/model/model.dart';
import '../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  // PageController to control the PageView.
  PageController pageController = PageController();
  // Reactive variable to track the current page index.
  final RxInt currentPageIndex = 0.obs;
  // A boolean to check if we are on the last page.
  bool get isLastPage => currentPageIndex.value == onboardingPages.length - 1;
  HiveManager hiveManager = Get.find(tag: (HiveManager).toString());

  /// Called when the page view is scrolled.
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  /// Jumps to the next page or navigates to the home screen if it's the last page.
  void nextPage() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      );
    }
  }

  /// Marks onboarding as complete and navigates to the home screen.
  void completeOnboarding() {
    hiveManager.setBool(HiveManager.onboardingDoneKey,true);
    Get.offAllNamed(AppRoutes.login);
  }

  /// The content for each onboarding page.
  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      imageAsset: AppImages.imgOnboarding1,
      title: 'Welcome to the App!',
      description: 'Discover amazing features and seamless user experiences designed just for you.',
    ),
    OnboardingModel(
      imageAsset: AppImages.imgOnboarding2,
      title: 'Stay Organized',
      description: 'Manage your tasks, notes, and schedules all in one place. Boost your productivity.',
    ),
    OnboardingModel(
      imageAsset: AppImages.imgOnboarding3,
      title: "Let's Get Started!",
      description: 'Create an account or log in to start your journey with us. We are excited to have you.',
    ),
  ];
}