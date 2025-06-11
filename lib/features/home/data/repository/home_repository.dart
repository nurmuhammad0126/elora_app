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

      if (data == null) {
        throw Exception("Ma'lumotlar null");
      }

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
        "/products-discount",
      );

      if (data == null) {
        throw Exception("Chegirmali mahsulotlar ma'lumotlari null");
      }

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

      if (data == null) {
        throw Exception("Hit mahsulotlar ma'lumotlari null");
      }

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

      if (data == null) {
        throw Exception("Yangi mahsulotlar ma'lumotlari null");
      }
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
      final data = await _homeDatasourceImpl.fetchProducts("/products-show");

      if (data == null) {
        throw Exception("Show mahsulotlar ma'lumotlari null");
      }

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

      if (data == null) {
        throw Exception("Mahsulot ma'lumotlari null");
      }

      final ProductModel productsModel = ProductModel.fromMap(data);
      return productsModel;
    } catch (e) {
      log("ERORR: HomeRepositoryImp.getProductById() $e");
      throw Exception(e);
    }
  }
}
