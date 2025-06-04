import 'dart:developer';

import 'package:eloro_app_for_home_work/features/home/data/models/products_model.dart';
import 'package:eloro_app_for_home_work/features/home/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final HomeRepositoryImpl homeRepositoryImpl;

  ProductsBloc(this.homeRepositoryImpl) : super(ProductsLoading()) {
    on<ProductsFetchEvent>(_fetchProducts);
    on<ProductShowProductsEvent>(_fetchShowProducts);
    on<ProductProductsNewEvent>(_fetchProductsNew);
    on<ProductProductsDiscountEvent>(_fetchProductsDiscount);
    on<ProductProductsHitEvent>(_fetchProductsHit);
  }

  _fetchProducts(ProductsFetchEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(ProductsLoading());
      final model = await homeRepositoryImpl.fetchProducts();
      emit(ProductsSucces(productsModel: model));
    } catch (e) {
      log("ERORR: ProductBloc._fetchProducts() $e");
      emit(ProductsErorr(message: e.toString()));
    }
  }

  _fetchShowProducts(
    ProductShowProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final model = await homeRepositoryImpl.fetchShowProducts();
      emit(ProductsSucces(productsModel: model));
    } catch (e) {
      log("ERORR: ProductBloc._fetchShowProducts() $e");
      emit(ProductsErorr(message: e.toString()));
    }
  }

  _fetchProductsNew(
    ProductProductsNewEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final model = await homeRepositoryImpl.fetchProductsNew();
      emit(ProductsSucces(productsModel: model));
    } catch (e) {
      log("ERORR: ProductBloc._fetchProductsNew() $e");
      emit(ProductsErorr(message: e.toString()));
    }
  }

  _fetchProductsDiscount(
    ProductProductsDiscountEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final model = await homeRepositoryImpl.fetchProductsDiscount();
      emit(ProductsSucces(productsModel: model));
    } catch (e) {
      log("ERORR: ProductBloc._fetchProductsDiscount() $e");
      emit(ProductsErorr(message: e.toString()));
    }
  }

  _fetchProductsHit(
    ProductProductsHitEvent event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());
      final model = await homeRepositoryImpl.fetchProductsHit();
      emit(ProductsSucces(productsModel: model));
    } catch (e) {
      log("ERORR: ProductBloc._fetchProductsHit() $e");
      emit(ProductsErorr(message: e.toString()));
    }
  }
}
