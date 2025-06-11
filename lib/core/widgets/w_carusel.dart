import 'dart:async';

import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/widgets_extension.dart';
import 'package:eloro_app_for_home_work/core/widgets/w_cached_image.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CaruselW extends StatefulWidget {
  final List<String>? images;
  const CaruselW({super.key, this.images});

  @override
  State<CaruselW> createState() => CaruselWState();
}

class CaruselWState extends State<CaruselW> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % (widget.images?.length ?? 4);
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.images?.length ?? 4,
          itemBuilder: (context, index) {
            return widget.images == null
                ? Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.grey300,
                    borderRadius: BorderRadius.circular(16.w),
                  ),
                  child: Center(
                    child: Text(
                      'Reklama ${index + 1}',
                      style: context.styles.s24w600,
                    ),
                  ),
                )
                : WCachedImage(
                  imageUrl: widget.images![index],
                  borderRadius: BorderRadius.circular(16.w),
                ).paddingSymmetric(horizontal: 16.w, vertical: 12.h);
          },
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.images?.length ?? 4,
          effect: WormEffect(
            dotWidth: 10.o,
            dotHeight: 10.h,
            dotColor: context.colors.primary.withAlpha(120),
            activeDotColor: context.colors.primary,
          ),
        ).paddingOnly(bottom: 20.h),
      ],
    );
  }
}
