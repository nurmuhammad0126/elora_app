
import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../data/models/products_model.dart';

class PriceSection extends StatelessWidget {
  final Datum product;
  const PriceSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.discountedPrice != null && product.discountedPrice! > 0) {
      return Row(
        children: [
          Text(
            "${product.discountedPrice} so'm",
            style: context.styles.s18w600.copyWith(
              color: context.colors.primary,
            ),
          ),
          8.width,
          Text(
            "${product.price} so'm",
            style: context.styles.s14w400.copyWith(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          8.width,
          if (product.discount != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "-${product.discount}%",
                style: context.styles.s12w600.copyWith(color: Colors.white),
              ),
            ),
        ],
      );
    }
    
    return Text(
      "${product.price} so'm",
      style: context.styles.s18w600.copyWith(
        color: context.colors.primary,
      ),
    );
  }
}
