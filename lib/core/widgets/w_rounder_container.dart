import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class WRounderContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final Clip clip;

  const WRounderContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.borderRadius = 24.0,

    this.padding,
    this.boxShadow,
    this.clip = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clip,
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color ?? context.colors.grey200,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
