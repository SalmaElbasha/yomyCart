import '../data/remote/api_services.dart';
import '../models/account_change_password/account_change_password_model.dart';

class AccountChangePasswordRepository {
  static final instance = AccountChangePasswordRepository._internal();

  AccountChangePasswordRepository._internal();

  factory AccountChangePasswordRepository() => instance;

  Future<AccountChangePasswordModel> changePasswordAccount({
    required String password,
    required String newPassword,
    required String confirmNewPassword,
  }) async =>
      await ApiServices.instance
          .accountChangePasswordApi()
          .changePasswordAccount(
            password: password,
            newPassword: newPassword,
            confirmNewPassword: confirmNewPassword,
          );
}
