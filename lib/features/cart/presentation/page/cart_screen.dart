import 'package:eloro_app_for_home_work/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Savatcha')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final items = state.items;

            if (items.isEmpty) {
              return const Center(child: Text('Savatcha bo‘sh'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final item = items[index];

                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(item.image, fit: BoxFit.cover),
                          ),
                        ),
                        6.height,
                        Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.height,
                        Text('${item.discountedPrice ?? item.price} so\'m'),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (item.quantity > 1) {
                                  final updatedItem = item.copyWith(
                                    quantity: item.quantity - 1,
                                  );
                                  context.read<CartBloc>().add(
                                    UpdateProduct(updatedItem),
                                  );
                                } else {
                                  context.read<CartBloc>().add(
                                    RemoveProduct(item.productId),
                                  );
                                }
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                final updatedItem = item.copyWith(
                                  quantity: item.quantity + 1,
                                );
                                context.read<CartBloc>().add(
                                  UpdateProduct(updatedItem),
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text('Xatolik: ${state.message}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
