import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AppAnimations on Widget {

  /// List animation from left
  Widget listSlideLeftAnimation(int index) {
    return animate()
        .fadeIn(duration: 300.ms)
        .slideX(begin: -0.3, duration: 400.ms)
        .then(delay: (index * 50).ms);
  }

  /// List animation from right
  Widget listSlideRightAnimation({int? index}) {
    return animate()
        .fadeIn(duration: 300.ms)
        .slideX(begin: 0.3, duration: 400.ms)
        .then(delay: (index! * 50).ms);
  }
  Widget gridViewAnimation(int index) {
    return animate()
        .fadeIn(duration: 400.ms)
        .scale(begin: const Offset(0.8, 0.8), duration: 400.ms)
        .moveY(begin: 30, duration: 400.ms)
        .then(delay: (index * 50).ms);
  }

  Widget buttonTapAnimation({VoidCallback? onTap}) {
    return GestureDetector(
      onTapDown: (_) => Animate().scaleXY(end: 0.95, duration: 100.ms),
      onTapUp: (_) => Animate().scaleXY(end: 1.0, duration: 100.ms),
      onTapCancel: () => Animate().scaleXY(end: 1.0, duration: 100.ms),
      onTap: onTap,
      child: this,
    );
  }

  // Button Bounce
  Widget bounceButton() {
    return animate(onPlay: (c) => c.repeat(reverse: true)).scaleXY(end: 1.05, duration: 600.ms);
  }

  // Button Shimmer
  Widget shimmerButton() {
    return animate(onPlay: (c) => c.repeat()).shimmer(duration: 2.seconds);
  }

  // Text Fade In
  Widget fadeInText({int delayMs = 0}) {
    return animate().fadeIn(duration: 600.ms, delay: delayMs.ms);
  }

  //  Typewriter Text Animation
  Widget typewriterText() {
    return animate().shimmer(duration: 2.seconds).fadeIn(duration: 300.ms);
  }

  // TextField Shake (use on error)
  Widget shakeTextField() {
    return animate().shake(hz: 4, curve: Curves.easeInOut, duration: 500.ms);
  }

  // TextField Fade In
  Widget fadeInTextField({int delayMs = 0}) {
    return animate().fadeIn(duration: 500.ms, delay: delayMs.ms);
  }

  //  Bottom Bar Slide Up
  Widget slideUpBottomBar({int delayMs = 0}) {
    return animate().moveY(begin: 100, end: 0, duration: 500.ms, delay: delayMs.ms).fadeIn();
  }

  // Bottom Bar Scale In
  Widget scaleInBottomBar({int delayMs = 0}) {
    return animate().scale(begin: const Offset(0.7, 0.7), duration: 500.ms, delay: delayMs.ms).fadeIn();
  }
  /// Scale In page animation
  Widget scaleInPage({int delayMs = 0}) {
    return animate()
        .scale(begin: const Offset(0.85, 0.85), duration: 500.ms, delay: delayMs.ms)
        .fadeIn();
  }

  /// Slide from Bottom
  Widget slideFromBottomPage({int delayMs = 0}) {
    return animate()
        .moveY(begin: 100, duration: 1000.ms, delay: delayMs.ms)
        .fadeIn();
  }

  ///  Slide from Right
  Widget slideFromRightPage({int delayMs = 0}) {
    return animate()
        .moveX(begin: 100, duration: 500.ms, delay: delayMs.ms)
        .fadeIn();
  }
  /// Slide from Left
  Widget slideFromLeftPage({int delayMs = 0}) {
    return animate()
        .moveX(begin: -100, duration: 500.ms, delay: delayMs.ms)
        .fadeIn();
  }

  /// Fade In Only
  Widget fadeInPage({int delayMs = 0}) {
    return animate().fadeIn(duration: 500.ms, delay: delayMs.ms);
  }

}
