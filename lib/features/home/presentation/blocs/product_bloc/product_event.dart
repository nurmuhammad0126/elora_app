part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductById extends ProductEvent {
  final String id;

  GetProductById({required this.id});
}
