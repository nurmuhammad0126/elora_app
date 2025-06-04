part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductLoading extends ProductState {}

final class ProductErorr extends ProductState {
  final String message;

  ProductErorr({required this.message});
}

final class ProductSucces extends ProductState {
  final ProductModel productsModel;

  ProductSucces({required this.productsModel});
}
