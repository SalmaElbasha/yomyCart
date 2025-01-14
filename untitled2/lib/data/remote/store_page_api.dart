import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';
import 'package:untitled2/models/Store_page/store_page_error_model.dart';
import 'package:untitled2/models/Store_page/store_page_model.dart';
import 'package:untitled2/models/Store_page/store_page_success_model.dart';

import '../../models/Store_page/store_page_error400_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class StorePageApi {
  static StorePageApi instance = StorePageApi._();
  StorePageApi._();

  Future<StorePageModel> getStoreDetails({required int storeId}) async {
    try {
      Response response = await DioLogger.getDio().get(
        '${Endpoints.storePageApi}$storeId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return StorePageSuccessModel.fromJson(response.data);
      } else {
        return StorePageErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return StorePageError400Model.fromJson(e.response!.data);
      } else {
        return StorePageErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
