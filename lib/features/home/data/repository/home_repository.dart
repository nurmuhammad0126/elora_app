import 'dart:developer';

import '../../domain/repository/repositorory.dart';
import '../datasource/home_datasource.dart';
import '../models/product_model.dart';
import '../models/products_model.dart';

class HomeRepositoryImpl implements HomeRepositorory {
  final HomeDatasourceImpl _homeDatasourceImpl;

  HomeRepositoryImpl({required HomeDatasourceImpl homeDatasourceImpl})
    : _homeDatasourceImpl = homeDatasourceImpl;

  @override
  Future<ProductsModel> fetchProducts() async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts("/products");

      final ProductsModel productsModel = ProductsModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchProducts() $e");
      throw Exception(e);
    }
  }

  @override
  Future<ProductsModel> fetchProductsDiscount() async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts(
        "/products-diccount",
      );

      final ProductsModel productsModel = ProductsModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchProductsDiscount() $e");
      throw Exception(e);
    }
  }

  @override
  Future<ProductsModel> fetchProductsHit() async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts("/products-hit");

      final ProductsModel productsModel = ProductsModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchProductsHit() $e");
      throw Exception(e);
    }
  }

  @override
  Future<ProductsModel> fetchProductsNew() async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts("/products-new");

      final ProductsModel productsModel = ProductsModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchProductsNew() $e");
      throw Exception(e);
    }
  }

  @override
  Future<ProductsModel> fetchShowProducts() async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts("/show-products");

      final ProductsModel productsModel = ProductsModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchShowProducts() $e");
      throw Exception(e);
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final data = await _homeDatasourceImpl.fetchProducts("/products/$id");

      final ProductModel productsModel = ProductModel.fromMap(data);

      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.fetchShowProducts() $e");
      throw Exception(e);
    }
  }
}
