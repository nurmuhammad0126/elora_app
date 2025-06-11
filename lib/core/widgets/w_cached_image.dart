import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const WCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          (context, url) => Center(
            child: CupertinoActivityIndicator(color: context.colors.primary),
          ),
      errorWidget: (context, url, error) {
        log("Image Error: $error");
        return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: context.colors.grey300,
            ),
            child: Icon(Icons.error, color: Colors.white),
          ),
        );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(24.o),
        child: image,
      );
    } else {
      return image;
    }
  }
}
