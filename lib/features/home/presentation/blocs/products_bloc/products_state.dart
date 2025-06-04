part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsErorr extends ProductsState {
  final String message;

  ProductsErorr({required this.message});
}

final class ProductsSucces extends ProductsState {
  final ProductsModel productsModel;

  ProductsSucces({required this.productsModel});
}
