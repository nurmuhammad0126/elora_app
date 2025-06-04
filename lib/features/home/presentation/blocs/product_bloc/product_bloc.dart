import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repository/home_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final HomeRepositoryImpl homeRepositoryImpl;
  ProductBloc(this.homeRepositoryImpl) : super(ProductLoading()) {
    on<GetProductById>(_getProductById);
  }

  _getProductById(GetProductById event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());

      final model = await homeRepositoryImpl.getProductById(event.id);
      emit(ProductSucces(productsModel: model));
    } catch (e) {
      emit(ProductErorr(message: e.toString()));
    }
  }
}
