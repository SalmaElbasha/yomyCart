import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';

import '../../models/store_page_search/store_page_search_error400_model.dart';
import '../../models/store_page_search/store_page_search_error_model.dart';
import '../../models/store_page_search/store_page_search_model.dart';
import '../../models/store_page_search/store_page_search_success_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class StorePageSearchApi {
  static StorePageSearchApi instance = StorePageSearchApi._();
  StorePageSearchApi._();

  ///todo
  Future<StorePageSearchModel> searchStore({required int storeId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.storePageSearchApi,
        data: {
          "pageId": 1,
          "storeId": storeId,
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
        return StorePageSearchSuccessModel.fromJson(response.data);
      } else {
        return StorePageSearchErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return StorePageSearchError400Model.fromJson(e.response!.data);
      } else {
        return StorePageSearchErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
