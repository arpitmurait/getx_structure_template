import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../values/app_images.dart';
import 'shimmers.dart';

class CustomImageView extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CustomImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => ShimmerLoader(
          width: width,
          height: height,
        ),
        errorWidget: (context, url, error) => Image.asset(AppImages.noImage,fit: BoxFit.cover,   width: width, height: height,),
      ),
    );
  }
}
