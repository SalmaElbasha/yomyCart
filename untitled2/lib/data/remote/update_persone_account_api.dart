import 'package:dio/dio.dart';
import 'package:untitled2/data/remote/dio_logger.dart';

import '../../models/update_person_account/update_person_account_error400_model.dart';
import '../../models/update_person_account/update_person_account_error_model.dart';
import '../../models/update_person_account/update_person_account_model.dart';
import '../../models/update_person_account/update_person_account_success_model.dart';
import '../../utilis/consetant.dart';
import 'end_points.dart';

class UpdatePersonalAccountApi {
  static UpdatePersonalAccountApi instance = UpdatePersonalAccountApi._();

  UpdatePersonalAccountApi._();

  Future<UpdatePersonalAccountModel> updatePersonalAccount({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required bool deleteCurrentImage,
  }) async {
    try {
      Response response = await DioLogger.getDio().put(
        Endpoints.updatePersonalAccountApi,
        data: {
          "id": id,
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "email": email,
          /*"image": {
            "name": imageName,
            "extension": imageExtension,
            "data": imageData
          },*/
          "deleteCurrentImage": deleteCurrentImage
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return UpdatePersonalAccountSuccessModel(
          message: 'Updated Successfully',
        );
      } else {
        return UpdatePersonalAccountErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return UpdatePersonalAccountError400Model.fromJson(e.response!.data);
      } else {
        return UpdatePersonalAccountErrorModel.fromJson(e.response!.data);
      }
    }
  }

  Future<UpdatePersonalAccountModel> updatePersonalAccountWithImage({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String imageName,
    required String imageExtension,
    required String imageData,
    required bool deleteCurrentImage,
  }) async {
    try {
      Response response = await DioLogger.getDio().put(
        Endpoints.updatePersonalAccountApi,
        data: {
          "id": id,
          "firstName": firstName,
          "lastName": lastName,
          "phoneNumber": phoneNumber,
          "email": email,
          "image": {
            "name": imageName,
            "extension": imageExtension,
            "data": imageData
          },
          "deleteCurrentImage": deleteCurrentImage
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return UpdatePersonalAccountSuccessModel(
          message: 'Updated Successfully',
        );
      } else {
        return UpdatePersonalAccountErrorModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return UpdatePersonalAccountError400Model.fromJson(e.response!.data);
      } else {
        return UpdatePersonalAccountErrorModel.fromJson(e.response!.data);
      }
    }
  }
}
