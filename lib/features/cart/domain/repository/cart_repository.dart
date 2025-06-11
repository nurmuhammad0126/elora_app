import '../../data/models/cart_item_model.dart';

abstract class ICartRepository {
  Future<List<CartItemModel>> getCartItems();
  Future<void> addToCart(CartItemModel item);
  Future<void> updateCart(CartItemModel item);
  Future<void> deleteProductFromCart(int productId);
  Future<void> clearCart();

  
}
