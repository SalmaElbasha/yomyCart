import 'package:dio/dio.dart';

import '../../models/product_search/product_details_search_error_400_model.dart';
import '../../models/product_search/product_details_search_error_model.dart';
import '../../models/product_search/product_details_search_model.dart';
import '../../models/product_search/product_details_search_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class ProductDetailsSearchPageAPI {
  static ProductDetailsSearchPageAPI instance = ProductDetailsSearchPageAPI._();

  ProductDetailsSearchPageAPI._();

  Future<ProductDetailsSearchModel> fetchProductDetailsSearchPage(
      {required int productId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.productDetailsSearchPageApi,
        data: {
          "pageId": 7,
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
        return ProductDetailsSearchSuccessModel.fromJson(response.data);
      } else if (response.statusCode == 400) {
        return ProductDetailsSearchError400Model.fromJson(response.data);
      } else {
        return ProductDetailsSearchErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return ProductDetailsSearchError400Model.fromJson(e.response!.data);
      } else {
        return ProductDetailsSearchErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
