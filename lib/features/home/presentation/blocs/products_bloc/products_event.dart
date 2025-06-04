part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductsFetchEvent extends ProductsEvent {}
class ProductShowProductsEvent extends ProductsEvent {}
class ProductProductsNewEvent extends ProductsEvent {}
class ProductProductsDiscountEvent extends ProductsEvent {}
class ProductProductsHitEvent extends ProductsEvent {}
