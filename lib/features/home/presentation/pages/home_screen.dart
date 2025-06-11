import 'package:eloro_app_for_home_work/core/di/di.dart';
import 'package:eloro_app_for_home_work/core/extensions/context_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:eloro_app_for_home_work/core/extensions/widgets_extension.dart';
import 'package:eloro_app_for_home_work/core/widgets/w_product_cart.dart';
import 'package:eloro_app_for_home_work/core/widgets/w_carusel.dart';
import 'package:eloro_app_for_home_work/features/home/presentation/pages/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/products_bloc/products_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Texnomart", style: context.styles.s24w600),
        backgroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.w)),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: CaruselW(
                images: [
                  "https://api.elaro.uz/storage/01JWDMYRCD09ZJS8FPSNK51CTZ.png",
                  "https://api.elaro.uz/storage/01JWBCMTH47HWHGVKYMYBC79PY.jpg",
                  "https://api.elaro.uz/storage/01JWBCMTH655FND5BWYJVJ2A65.jpg",
                ],
              ),
            ),
            _buildProductSection(
              context,
              title: "Xit mahsulotlar",
              event: ProductProductsHitEvent(),
            ),
            20.height,
            _buildProductSection(
              context,
              title: "Yangi mahsulotlar",
              event: ProductProductsNewEvent(),
            ),
            20.height,
            _buildProductSection(
              context,
              title: "Chegirmadagi mahsulotlar",
              event: ProductProductsDiscountEvent(),
            ),
            20.height,
            // _buildProductSection(
            //   context,
            //   title: "Show mahsulotlar",
            //   event: ProductShowProductsEvent(),
            // ),
            _buildProductSection(
              context,
              title: "Mahsulotlar",
              event: ProductsFetchEvent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection(
    BuildContext context, {
    required String title,
    required ProductsEvent event,
  }) {
    return BlocProvider(
      create: (_) => getIt<ProductsBloc>()..add(event),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.styles.s24w600).paddingOnly(left: 16.w),
          10.height,
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsSucces) {
                  if (state.productsModel.data?.isEmpty ?? false) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 48,
                            color: Colors.grey,
                          ),
                          8.height,
                          Text(
                            "Hozircha mahsulotlar yo'q",
                            style: context.styles.s14w400.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.productsModel.data?.length ?? 0,
                    separatorBuilder: (_, __) => 14.width,
                    itemBuilder: (context, index) {
                      final product = state.productsModel.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ProductDetailScreen(
                                    product: state.productsModel.data![index],
                                  ),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: WProductCart(product: product),
                        ).paddingOnly(left: 16.w),
                      );
                    },
                  );
                } else if (state is ProductsErorr) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 48, color: Colors.red),
                        8.height,
                        Text(
                          "Xatolik yuz berdi",
                          style: context.styles.s16w600.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        4.height,
                        Text(
                          state.message,
                          style: context.styles.s12w400.copyWith(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        8.height,
                        ElevatedButton.icon(
                          onPressed: () {
                            // Qayta urinish
                            context.read<ProductsBloc>().add(event);
                          },
                          icon: Icon(Icons.refresh),
                          label: Text("Qayta urinish"),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
