import 'package:hive/hive.dart';
import '../models/cart_item_model.dart';

abstract class CartLocalDatasource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> addToCart(CartItemModel item);
  Future<void> updateCart(CartItemModel item);
  Future<void> deleteProductFromCart(int productId);
  Future<void> clearCart();

  factory CartLocalDatasource()=>CartLocalDatasourceImpl();
}

class CartLocalDatasourceImpl implements CartLocalDatasource {
  static const String _boxName = 'cart';

  Future<Box<CartItemModel>> _openBox() async {
    return await Hive.openBox<CartItemModel>(_boxName);
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    final box = await _openBox();
    return box.values.toList();
  }

  @override
  Future<void> addToCart(CartItemModel item) async {
    final box = await _openBox();
    final existingKey = box.keys.firstWhere(
      (key) => box.get(key)?.productId == item.productId,
      orElse: () => null,
    );

    if (existingKey != null) {
      final existing = box.get(existingKey)!;
      final updated = existing.copyWith(
        quantity: existing.quantity + item.quantity,
      );
      await box.put(existingKey, updated);
    } else {
      await box.add(item);
    }
  }

  @override
  Future<void> updateCart(CartItemModel item) async {
    final box = await _openBox();
    final key = box.keys.firstWhere(
      (key) => box.get(key)?.productId == item.productId,
      orElse: () => null,
    );
    if (key != null) {
      await box.put(key, item);
    }
  }

  @override
  Future<void> deleteProductFromCart(int productId) async {
    final box = await _openBox();
    final key = box.keys.firstWhere(
      (key) => box.get(key)?.productId == productId,
      orElse: () => null,
    );
    if (key != null) {
      await box.delete(key);
    }
  }

  @override
  Future<void> clearCart() async {
    final box = await _openBox();
    await box.clear();
  }
}
