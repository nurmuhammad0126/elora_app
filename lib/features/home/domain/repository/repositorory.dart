
import '../../data/models/product_model.dart';
import '../../data/models/products_model.dart';

abstract class HomeRepositorory {
  Future<ProductsModel> fetchProducts();
  Future<ProductsModel> fetchShowProducts();
  Future<ProductsModel> fetchProductsNew();
  Future<ProductsModel> fetchProductsDiscount();
  Future<ProductsModel> fetchProductsHit();
  Future<ProductModel> getProductById(String id);

}
