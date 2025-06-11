import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_item_model.dart';
import '../../../data/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<RemoveProduct>(_onRemoveProduct);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await repository.getCartItems();
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to load cart: $e"));
    }
  }

  Future<void> _onAddProduct(AddProduct event, Emitter<CartState> emit) async {
    try {
      await repository.addToCart(event.item);
      add(LoadCart()); // refresh list
    } catch (e) {
      emit(CartError("Failed to add product: $e"));
    }
  }

  Future<void> _onUpdateProduct(UpdateProduct event, Emitter<CartState> emit) async {
    try {
      await repository.updateCart(event.item);
      add(LoadCart());
    } catch (e) {
      emit(CartError("Failed to update product: $e"));
    }
  }

  Future<void> _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit) async {
    try {
      await repository.deleteProductFromCart(event.productId);
      add(LoadCart());
    } catch (e) {
      emit(CartError("Failed to remove product: $e"));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await repository.clearCart();
      add(LoadCart());
    } catch (e) {
      emit(CartError("Failed to clear cart: $e"));
    }
  }
}
