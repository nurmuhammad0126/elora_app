import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/widgets_extension.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/models/products_model.dart';
import 'w_cached_image.dart';
import 'w_rounder_container.dart';

class WProductCart extends StatelessWidget {
  final Datum product;
  const WProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: 15.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WRounderContainer(
            clip: Clip.hardEdge,

            color: context.colors.grey200,
            boxShadow: [
              BoxShadow(
                color: context.colors.grey300.withAlpha(90),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    product.discountType != null
                        ? WRounderContainer(
                          color: context.colors.error,
                          borderRadius: 4.w,
                          padding: EdgeInsets.all(4.w),
                          child: Text(
                            product.discountType ?? "",
                            style: context.styles.s12w500.copyWith(
                              color: context.colors.white,
                            ),
                          ),
                        )
                        : SizedBox.shrink(),
                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: context.colors.white,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: context.colors.grey,
                      ),
                    ).paddingSymmetric(horizontal: 10.o),
                  ],
                ),

                WCachedImage(
                  height: 90.h,

                  imageUrl: product.images?[0].image ?? "",
                ).paddingAll(24.w),
              ],
            ),
          ),
          Text(
            product.descriptionUz ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.styles.s16w400,
          ),
          WRounderContainer(
            padding: EdgeInsets.all(5.w),
            child: Text(
              "${product.discountedPrice} so'm",

              style: context.styles.s12w500,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${product.price} so'm", style: context.styles.s16w500),
              6.width,
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.primary, width: 2.o),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: context.colors.textPrimary,
                  size: 20.w,
                ).paddingAll(4.w),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
