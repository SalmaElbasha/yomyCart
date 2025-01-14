import 'package:dio/dio.dart';

import '../../models/brand_page/brand_page_error_400_model.dart';
import '../../models/brand_page/brand_page_error_model.dart';
import '../../models/brand_page/brand_page_model.dart';
import '../../models/brand_page/brand_page_success_odel.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class BrandPageApi {
  static BrandPageApi instance = BrandPageApi._();
  BrandPageApi._();

  Future<BrandPageModel> fetchBrandPage({required int brandId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.brandPageApi,
        data: {
          "pageId": 5,
          "brandId": brandId,
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
        return BrandPageSuccessModel.fromJson(response.data);
      } else if (response.statusCode == 400) {
        return BrandPageError400Model.fromJson(response.data);
      } else {
        return BrandPageErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return BrandPageError400Model.fromJson(e.response!.data);
      } else {
        return BrandPageErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
