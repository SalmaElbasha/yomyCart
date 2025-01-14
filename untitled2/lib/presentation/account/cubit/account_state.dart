import 'package:untitled2/models/update_person_account/update_person_account_error400_model.dart';

import '../../../models/account_change_password/account_change_password_error400s_model.dart';
import '../../../models/account_change_password/account_change_password_error_model.dart';
import '../../../models/update_person_account/update_person_account_error_model.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class ChangeBannerButtonState extends AccountState {}

class LogOutState extends AccountState {}

class UpdatePersonalAccountLoadingState extends AccountState {}

class UpdatePersonalAccountSuccessState extends AccountState {
  final String message;

  UpdatePersonalAccountSuccessState(this.message);
}

class UpdatePersonalAccountErrorState extends AccountState {
  final UpdatePersonalAccountErrorModel updatePersonalAccountErrorModel;

  UpdatePersonalAccountErrorState(this.updatePersonalAccountErrorModel);
}

class UpdatePersonalAccountError400State extends AccountState {
  final UpdatePersonalAccountError400Model updatePersonalAccountError400Model;

  UpdatePersonalAccountError400State(this.updatePersonalAccountError400Model);
}

class UpdatePersonalAccountWithImageLoadingState extends AccountState {}

class UpdatePersonalAccountWithImageSuccessState extends AccountState {
  final String message;

  UpdatePersonalAccountWithImageSuccessState(this.message);
}

class UpdatePersonalAccountWithImageErrorState extends AccountState {
  final UpdatePersonalAccountErrorModel updatePersonalAccountErrorModel;

  UpdatePersonalAccountWithImageErrorState(
      this.updatePersonalAccountErrorModel);
}

class UpdatePersonalAccountWithImageError400State extends AccountState {
  final UpdatePersonalAccountError400Model updatePersonalAccountError400Model;

  UpdatePersonalAccountWithImageError400State(
      this.updatePersonalAccountError400Model);
}

class AccountChangePasswordLoadingState extends AccountState {}

class AccountChangePasswordSuccessState extends AccountState {
  final String message;

  AccountChangePasswordSuccessState(this.message);
}

class AccountChangePasswordErrorState extends AccountState {
  final AccountChangePasswordErrorModel accountChangePasswordErrorModel;

  AccountChangePasswordErrorState(this.accountChangePasswordErrorModel);
}

class AccountChangePasswordError400State extends AccountState {
  final AccountChangePasswordError400Model accountChangePasswordError400Model;

  AccountChangePasswordError400State(this.accountChangePasswordError400Model);
}

class AccountImagePickedSuccessState extends AccountState {}

class AccountImagePickedErrorState extends AccountState {}

class DeleteAccountImageSuccessState extends AccountState {}
