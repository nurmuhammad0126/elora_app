import '../../domain/repository/cart_repository.dart';
import '../datasource/cart_local_datasource.dart';
import '../models/cart_item_model.dart';

class CartRepository implements ICartRepository {
  final CartLocalDatasource datasource;

  CartRepository(this.datasource);

  @override
  Future<List<CartItemModel>> getCartItems() {
    return datasource.getCartItems();
  }

  @override
  Future<void> addToCart(CartItemModel item) {
    return datasource.addToCart(item);
  }

  @override
  Future<void> updateCart(CartItemModel item) {
    return datasource.updateCart(item);
  }

  @override
  Future<void> deleteProductFromCart(int productId) {
    return datasource.deleteProductFromCart(productId);
  }

  @override
  Future<void> clearCart() {
    return datasource.clearCart();
  }
}
