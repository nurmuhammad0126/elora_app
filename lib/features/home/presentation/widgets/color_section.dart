
import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../data/models/products_model.dart';

class ColorSection extends StatelessWidget {
  final Datum product;
  const ColorSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Rang: ",
          style: context.styles.s14w600,
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: _getColorFromString(product.color!),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        8.width,
        Text(
          product.color!,
          style: context.styles.s14w400,
        ),
      ],
    );
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'qora':
      case 'black':
        return Colors.black;
      case 'oq':
      case 'white':
        return Colors.white;
      case 'qizil':
      case 'red':
        return Colors.red;
      case 'ko\'k':
      case 'blue':
        return Colors.blue;
      case 'yashil':
      case 'green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
