import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';

import '../../models/personal_account/personal_account_error400_model.dart';
import '../../models/personal_account/personal_account_error_model.dart';
import '../../models/personal_account/personal_account_model.dart';
import '../../models/personal_account/personal_account_success_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class PersonalAccountApi {
  static PersonalAccountApi instance = PersonalAccountApi._();
  PersonalAccountApi._();

  Future<PersonalAccountModel> getPersonalAccount() async {
    try {
      Response response = await DioLogger.getDio().get(
        Endpoints.personalAccountApi,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return PersonalAccountSuccessModel.fromJson(response.data);
      } else {
        return PersonalAccountErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return PersonalAccountError400Model.fromJson(e.response!.data);
      } else {
        return PersonalAccountErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
