import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const ElevatedContainer({
    super.key,
    required this.child,
    this.bgColor = AppColors.kPrimaryColor,
    this.padding,
    this.borderRadius = AppValues.smallRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.kNeutral20Color,
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: AppColors.kPrimaryColor),
      child: child,
    );
  }
}
