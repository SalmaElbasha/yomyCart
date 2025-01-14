import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';
import 'package:untitled2/data/remote/end_points.dart';

import '../../models/product_category_page/product_category_page_error_400_model.dart';
import '../../models/product_category_page/product_category_page_error_model.dart';
import '../../models/product_category_page/product_category_page_model.dart';
import '../../models/product_category_page/product_category_page_success_model.dart';
import '../../utilis/consetant.dart';

class ProductCategoryPageApi {
  static ProductCategoryPageApi instance = ProductCategoryPageApi._();
  ProductCategoryPageApi._();

  Future<ProductCategoryPageModel> fetchProductCategory() async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.productCategoryPageApi,
        data: {
          "keyword": "",
          "pageNumber": 0,
          "pageSize": 10,
          "filters": [
            "id",
          ],
          "pageId": 4,
          "categoryId": 1,
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
        return ProductCategoryPageSuccessModel.fromJson(response.data);
      } else if (response.statusCode == 400) {
        return ProductCategoryPageError400Model.fromJson(response.data);
      } else {
        return ProductCategoryPageErrorModel.fromJson(response.data);
      }
    } on DioError catch (error) {
      log('Errors: ${error.message}');
      return ProductCategoryPageErrorModel.fromJson(error.response!.data);
    }
  }
}
