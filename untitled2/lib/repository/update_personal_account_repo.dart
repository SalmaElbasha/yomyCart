import '../data/remote/api_services.dart';
import '../models/update_person_account/update_person_account_model.dart';

class UpdatePersonalAccountRepository {
  static final instance = UpdatePersonalAccountRepository._internal();

  UpdatePersonalAccountRepository._internal();

  factory UpdatePersonalAccountRepository() => instance;

  Future<UpdatePersonalAccountModel> updatePersonalAccount({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required bool deleteCurrentImage,
  }) async =>
      await ApiServices.instance
          .updatePersonalAccountApi()
          .updatePersonalAccount(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            email: email,
            deleteCurrentImage: deleteCurrentImage,
          );

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
  }) async =>
      await ApiServices.instance
          .updatePersonalAccountApi()
          .updatePersonalAccountWithImage(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            email: email,
            imageName: imageName,
            imageExtension: imageExtension,
            imageData: imageData,
            deleteCurrentImage: deleteCurrentImage,
          );
}
