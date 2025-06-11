
import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../data/models/products_model.dart';

class AttributesSection extends StatelessWidget {
  final Datum product;
  const AttributesSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Xususiyatlari",
          style: context.styles.s16w600,
        ),
        8.height,
        ...product.attributes!.map((attr) => Padding(
          padding: EdgeInsets.only(bottom: 4.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "${attr.nameUz ?? attr.nameRu ?? ''}:",
                  style: context.styles.s14w500,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  attr.valueUz ?? attr.valueRu ?? '',
                  style: context.styles.s14w400,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}