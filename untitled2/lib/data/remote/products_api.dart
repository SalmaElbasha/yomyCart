import 'package:dio/dio.dart';

import '../../models/products/products_error400_model.dart';
import '../../models/products/products_error_model.dart';
import '../../models/products/products_model.dart';
import '../../models/products/products_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class ProductsApi {
  static ProductsApi instance = ProductsApi._();

  ProductsApi._();

  Future<ProductsModel> fetchProducts({required int productId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.productsApi,
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
        return ProductsSuccessModel.fromJson(response.data);
      } else {
        return ProductsErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return ProductsError400Model.fromJson(e.response!.data);
      } else {
        return ProductsErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
