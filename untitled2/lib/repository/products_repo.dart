import '../data/remote/api_services.dart';
import '../models/products/products_model.dart';

class ProductsRepository {
  static final instance = ProductsRepository._internal();

  ProductsRepository._internal();

  factory ProductsRepository() => instance;

  Future<ProductsModel> getProducts(int productId) async =>
      await ApiServices.instance
          .productsApi()
          .fetchProducts(productId: productId);
}
