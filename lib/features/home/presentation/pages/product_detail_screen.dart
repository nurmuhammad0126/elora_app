import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:eloro_app_for_home_work/core/widgets/w_button.dart';
import 'package:eloro_app_for_home_work/core/widgets/w_carusel.dart';
import 'package:eloro_app_for_home_work/features/home/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../widgets/attributes_section.dart';
import '../widgets/color_section.dart';
import '../widgets/price_section.dart';
import '../widgets/stock_status.dart';

class ProductDetailScreen extends StatelessWidget {
  final Datum product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.nameUz ?? "Mahsulot",
          style: context.styles.s14w600,
        ),
        backgroundColor: context.colors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.w)),
        ),
      ),
      backgroundColor: context.colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: CaruselW(
                      images:
                          product.images?.map((e) => e.image ?? "").toList(),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.nameUz ?? "Nomi yo'q",
                          style: context.styles.s20w600,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        8.height,

                        PriceSection(product: product),

                        if (product.qty != null) ...[
                          8.height,
                          StockStatus(product: product),
                        ],

                        if (product.color != null) ...[
                          16.height,
                          ColorSection(product: product),
                        ],

                        if (product.attributes?.isNotEmpty == true) ...[
                          16.height,
                          AttributesSection(product: product),
                        ],

                        if (product.descriptionUz?.isNotEmpty == true) ...[
                          16.height,
                          Text("Tavsif", style: context.styles.s16w600),
                          8.height,
                          Text(
                            product.descriptionUz!,
                            style: context.styles.s14w400,
                            textAlign: TextAlign.justify,
                          ),
                        ],

                        20.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: context.colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(90),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: WButton(
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(message: "SAVATGA QOSHILDI"),
                );
              },
              child: Text(
                "Savatga qo'shish",
                style: context.styles.s16w600.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
