import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';

import '../../models/account_change_password/account_change_password_error400s_model.dart';
import '../../models/account_change_password/account_change_password_error_model.dart';
import '../../models/account_change_password/account_change_password_model.dart';
import '../../models/account_change_password/account_change_password_success_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class AccountChangePasswordApi {
  static AccountChangePasswordApi instance = AccountChangePasswordApi._();

  AccountChangePasswordApi._();

  Future<AccountChangePasswordModel> changePasswordAccount({
    required String password,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      Response response = await DioLogger.getDio().put(
        Endpoints.changePasswordPersonalAccountApi,
        data: {
          "password": password,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return AccountChangePasswordSuccessModel(
          message: 'Changed Successfully',
        );
      } else {
        return AccountChangePasswordErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return AccountChangePasswordError400Model.fromJson(e.response!.data);
      } else {
        return AccountChangePasswordErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
