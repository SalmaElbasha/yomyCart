import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/register/register_error400_model.dart';
import '../../models/register/register_error_model.dart';
import '../../models/register/register_model.dart';
import '../../models/register/register_success_model.dart';
import '../../models/tokens/tokens_error400_model.dart';
import '../../models/tokens/tokens_error_model.dart';
import '../../models/tokens/tokens_model.dart';
import '../../models/tokens/tokens_success_model.dart';
import '../../utilis/consetant.dart';
import 'dio_logger.dart';
import 'end_points.dart';

class AuthApiServices {
  AuthApiServices._instance();
  static final AuthApiServices instance = AuthApiServices._instance();
  Dio dio = DioLogger.getDio();

  Future<TokensModel> getToken({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        Endpoints.tokens,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return TokensSuccessModel.fromJson(response.data);
      } else {
        return TokensErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      // TODO Handle Get Tokens Error
      if (e.response!.statusCode == 400) {
        return TokensError400Model.fromJson(e.response!.data);
      } else {
        return TokensErrorModel.fromJson(e.response!.data);
      }
    }
  }

  Future<RegisterModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String mobile,
    required String password,
    required String confirmPassword,
    required String adminToken,
  }) async {
    try {
      dio.options.headers['Authorization'] = 'Bearer $adminToken';
      log(token);
      Response response = await dio.post(
        Endpoints.register,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "userName": userName,
          "phoneNumber": mobile,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      if (response.statusCode == 200) {
        log(response.data);

        return RegisterSuccessModel(message: response.data);
      } else {
        return RegisterErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      // TODO Handle Register Error
      if (e.response!.statusCode == 400) {
        return RegisterError400Model.fromJson(e.response!.data);
      } else {
        return RegisterErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
