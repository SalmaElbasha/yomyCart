import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';

import '../../models/home_page/home_page_api_error400_model.dart';
import '../../models/home_page/home_page_api_error_model.dart';
import '../../models/home_page/home_page_api_model.dart';
import '../../models/home_page/home_page_api_success_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class HomePageApi {
  static HomePageApi instance = HomePageApi._();
  HomePageApi._();

  Future<HomePageApiModel> getHomePageData() async {
    try {
      Response response = await DioLogger.getDio().post(
        Endpoints.homePageApi,
        data: {
          "keyword": "",
          "pageNumber": 0,
          "pageSize": 10,
          "orderBy": ["id"],
          "pageId": 1,
          "langId": 1
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return HomePageApiSuccessModel.fromJson(response.data);
      } else {
        return HomePageApiErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return HomePageApiError400Model.fromJson(e.response!.data);
      } else {
        return HomePageApiErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
