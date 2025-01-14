import '../data/remote/api_services.dart';
import '../models/product_page_search/product_search_page_model.dart';

class ProductPageSearchRepository {
  static final instance = ProductPageSearchRepository._internal();

  ProductPageSearchRepository._internal();

  factory ProductPageSearchRepository() => instance;

  Future<ProductPageSearchModel> getProductPageSearch(int productId) async =>
      await ApiServices.instance
          .productPageSearchApi()
          .fetchProductPageSearch(productId: productId);
}
