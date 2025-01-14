import 'package:dio/dio.dart';

import '../../models/product_page_search/product_page_search_error400_model.dart';
import '../../models/product_page_search/product_page_search_error_model.dart';
import '../../models/product_page_search/product_page_search_success_model.dart';
import '../../models/product_page_search/product_search_page_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class ProductPageSearchApi {
  static ProductPageSearchApi instance = ProductPageSearchApi._();

  ProductPageSearchApi._();

  Future<ProductPageSearchModel> fetchProductPageSearch(
      {required int productId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.productPageSearchApi,
        data: {
          "pageId": 1,
          "productId": productId,
          "langId": 1,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ProductPageSearchSuccessModel.fromJson(response.data);
      } else {
        return ProductPageSearchErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return ProductPageSearchError400Model.fromJson(e.response!.data);
      } else {
        return ProductPageSearchErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
