import 'package:dio/dio.dart';

import '../../models/product_details/product_details_error_400_model.dart';
import '../../models/product_details/product_details_error_model.dart';
import '../../models/product_details/product_details_model.dart';
import '../../models/product_details/product_details_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class ProductDetailsPageAPI {
  static ProductDetailsPageAPI instance = ProductDetailsPageAPI._();
  ProductDetailsPageAPI._();

  Future<ProductDetailsModel> fetchProductDetailsPage(
      {required int productId}) async {
    try {
      Response response = await DioLogger.getDio().get(
        '${Endpoints.productDetailsPageApi}$productId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return ProductDetailsSuccessModel.fromJson(response.data);
      } else if (response.statusCode == 400) {
        return ProductDetailsError400Model.fromJson(response.data);
      } else {
        return ProductDetailsErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return ProductDetailsError400Model.fromJson(e.response!.data);
      } else {
        return ProductDetailsErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
