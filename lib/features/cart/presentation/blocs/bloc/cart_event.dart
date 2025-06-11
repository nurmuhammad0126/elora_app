part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

class LoadCart extends CartEvent {
  
}

class AddProduct extends CartEvent {
  final CartItemModel item;

  const AddProduct(this.item);

}

class UpdateProduct extends CartEvent {
  final CartItemModel item;

  const UpdateProduct(this.item);

}

class RemoveProduct extends CartEvent {
  final int productId;

  const RemoveProduct(this.productId);
}

class ClearCart extends CartEvent {

}
