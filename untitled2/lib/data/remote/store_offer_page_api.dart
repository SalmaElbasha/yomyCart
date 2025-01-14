import 'package:dio/dio.dart';

import '../../models/store_page_search/store_page_search_error400_model.dart';
import '../../models/store_page_search/store_page_search_error_model.dart';
import '../../models/store_page_search/store_page_search_model.dart';
import '../../models/store_page_search/store_page_search_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class StoreOfferPageApi {
  static StoreOfferPageApi instance = StoreOfferPageApi._();

  StoreOfferPageApi._();

  Future<StorePageSearchModel> fetchStoreOfferPage(
      {required int storeOfferId}) async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.storeOfferPageApi,
        data: {
          "pageId": 1,
          "offerId": storeOfferId,
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
