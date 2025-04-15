import 'package:flutter/material.dart';
import 'package:getx_structure_template/app/core/values/app_colors.dart';
import 'package:getx_structure_template/app/core/values/app_values.dart';

class Ripple extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color rippleColor;
  final double rippleRadius;

  const Ripple({
    super.key,
    this.child,
    required this.onTap,
    this.rippleColor = AppColors.kPrimaryColor,
    this.rippleRadius = AppValues.smallRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
