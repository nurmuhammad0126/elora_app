

import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../data/models/products_model.dart';

class StockStatus extends StatelessWidget {
  final Datum product;
  const StockStatus({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isInStock = (product.qty ?? 0) > 0;
    return Row(
      children: [
        Icon(
          isInStock ? Icons.check_circle : Icons.cancel,
          size: 16,
          color: isInStock ? Colors.green : Colors.red,
        ),
        4.width,
        Text(
          isInStock ? "Mavjud (${product.qty} dona)" : "Mavjud emas",
          style: context.styles.s14w400.copyWith(
            color: isInStock ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
