import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';

class ShimmerLoader extends StatelessWidget {
  final double? height,width,radius;
  const ShimmerLoader({super.key,this.radius,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      width: width ?? 43,
      height: height ?? 250,
      borderRadius: radius ?? 10,
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      backgroundColor: Colors.grey.withValues(alpha: 0.2),
      shimmerColor:Colors.grey.withValues(alpha: 0.4),
    );
  }
}

class ProductItemShimmer extends StatelessWidget {
  final int count,crossCount;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  const ProductItemShimmer({super.key,this.crossCount = 2,this.count = 4, this.padding, this.physics});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.85,
      ),
      physics: physics,
      shrinkWrap: true,
      padding: padding ?? EdgeInsets.only(left: 20.0,right: 20.0,bottom: 50.0,top: 10.0),
      itemCount: count,
      itemBuilder: (context, index) {
        return const ShimmerLoader();
      },
    );
  }
}

class ListItemShimmer extends StatelessWidget {
  final double height,radius,width;
  final EdgeInsets? padding;
  final int itemCount;
  const ListItemShimmer({super.key,this.height = 70,this.itemCount = 8,this.padding,this.radius = 0.0,this.width = 70});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: padding ?? const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,),
      itemBuilder: (context, index) {
        return ShimmerLoader(height: height,radius: radius,width: width,);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class BannerItemShimmer extends StatelessWidget {
  const BannerItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: ShimmerLoader(height: 250.h, width: 320.w,radius: 12,),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}

class AdsBannerShimmer extends StatelessWidget {
  const AdsBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20,right: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 15.w,),
        itemBuilder: (context, index) => ShimmerLoader(width: MediaQuery.of(context).size.width * 0.8,radius: 12,),
      ),
    );
  }
}
