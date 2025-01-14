import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/models/update_person_account/update_person_account_success_model.dart';
import '../../../data/local/shared_prefrences.dart';
import '../../../models/account_change_password/account_change_password_error400s_model.dart';
import '../../../models/account_change_password/account_change_password_error_model.dart';
import '../../../models/account_change_password/account_change_password_success_model.dart';
import '../../../models/update_person_account/update_person_account_error400_model.dart';
import '../../../models/update_person_account/update_person_account_error_model.dart';
import '../../../repository/repo.dart';
import '../../../utilis/consetant.dart';
import '../../../utilis/error_handler.dart';
import '../../resources/routes_manager.dart';
import '/presentation/account/cubit/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  static AccountCubit get(BuildContext context) => BlocProvider.of(context);

  bool isMyAccount = true;
  bool isSettings = true;
  bool isAlnassya = true;

  void changeRadioButton(String type) {
    if (type == 'settings') {
      isSettings = !isSettings;
    }
    if (type == 'account') {
      isMyAccount = !isMyAccount;
    }
    if (type == '3alnassya') {
      isAlnassya = !isAlnassya;
    }
    emit(ChangeBannerButtonState());
  }

  logout({required BuildContext context}) {
    SharedPref.deleteData(key: tokenKey);
    SharedPref.deleteData(key: refreshTokenKey);
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.loginRoute,
      (route) => false,
    );
    emit(LogOutState());
  }

  UpdatePersonalAccountSuccessModel? updatePersonalAccountSuccessModel;
  UpdatePersonalAccountErrorModel? updatePersonalAccountErrorModel;
  UpdatePersonalAccountError400Model? updatePersonalAccountError400Model;

  Future<void> updatePersonalAccountFunction(
    context, {
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required bool deleteCurrentImage,
  }) async {
    emit(UpdatePersonalAccountLoadingState());
    final response = await Repository.instance
        .updatePersonalAccountRepository()
        .updatePersonalAccount(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            email: email,
            deleteCurrentImage: deleteCurrentImage);

    if (response is UpdatePersonalAccountSuccessModel) {
      log(response.toString());
      updatePersonalAccountSuccessModel = response;
      ErrorHandler.showSuccessSnackBar(
        context: context,
        message: response.message,
      );

      emit(UpdatePersonalAccountSuccessState(response.message));
    } else if (response is UpdatePersonalAccountErrorModel) {
      log('Error: ${response.messages}');
      for (var element in response.messages!) {
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: element,
        );
        log(element);
      }

      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        updatePersonalAccountErrorModel = response;
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
        emit(UpdatePersonalAccountErrorState(response));
      }
    } else if (response is UpdatePersonalAccountError400Model) {
      log(response.detail.toString());
      updatePersonalAccountError400Model = response;
      ErrorHandler.showErrorSnackBar(
        context: context,
        message: response.detail!,
      );
      emit(UpdatePersonalAccountError400State(response));
    }
  }

  Future<void> updatePersonalAccountWithImageFunction(
    context, {
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
    emit(UpdatePersonalAccountWithImageLoadingState());
    final response = await Repository.instance
        .updatePersonalAccountRepository()
        .updatePersonalAccountWithImage(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            email: email,
            imageName: imageName,
            imageExtension: imageExtension,
            imageData: imageData,
            deleteCurrentImage: deleteCurrentImage);

    if (response is UpdatePersonalAccountSuccessModel) {
      log(response.toString());
      updatePersonalAccountSuccessModel = response;
      ErrorHandler.showSuccessSnackBar(
        context: context,
        message: response.message,
      );

      emit(UpdatePersonalAccountSuccessState(response.message));
    } else if (response is UpdatePersonalAccountErrorModel) {
      log('Error: ${response.messages}');
      for (var element in response.messages!) {
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: element,
        );
        log(element);
      }

      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        updatePersonalAccountErrorModel = response;
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
        emit(UpdatePersonalAccountWithImageErrorState(response));
      }
    } else if (response is UpdatePersonalAccountError400Model) {
      log(response.detail.toString());
      updatePersonalAccountError400Model = response;
      ErrorHandler.showErrorSnackBar(
        context: context,
        message: response.detail!,
      );
      emit(UpdatePersonalAccountWithImageError400State(response));
    }
  }

  AccountChangePasswordSuccessModel? accountChangePasswordSuccessModel;
  AccountChangePasswordErrorModel? accountChangePasswordErrorModel;
  AccountChangePasswordError400Model? accountChangePasswordError400Model;

  Future<void> changePasswordAccountFunction(
    context, {
    required String password,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(AccountChangePasswordLoadingState());
    final response = await Repository.instance
        .accountChangePasswordRepository()
        .changePasswordAccount(
          password: password,
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword,
        );

    if (response is AccountChangePasswordSuccessModel) {
      log(response.toString());
      accountChangePasswordSuccessModel = response;
      ErrorHandler.showSuccessSnackBar(
        context: context,
        message: response.message,
      );

      emit(AccountChangePasswordSuccessState(response.message));
    } else if (response is AccountChangePasswordErrorModel) {
      log('Error: ${response.messages}');
      for (var element in response.messages!) {
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: element,
        );
        log(element);
      }

      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        accountChangePasswordErrorModel = response;
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
        emit(AccountChangePasswordErrorState(response));
      }
    } else if (response is AccountChangePasswordError400Model) {
      log(response.detail.toString());
      accountChangePasswordError400Model = response;
      ErrorHandler.showErrorSnackBar(
        context: context,
        message: response.detail!,
      );
      emit(AccountChangePasswordError400State(response));
    }
  }

  var picker = ImagePicker();
  bool accountImageSelected = false;
  File? accountImage;

  Future<void> getAccountImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      accountImage = File(pickedFile.path);
      debugPrint(accountImage!.path);
      accountImageSelected = true;
      emit(AccountImagePickedSuccessState());
    } else {
      debugPrint('No image selected.');
      emit(AccountImagePickedErrorState());
    }
  }

  void removeAccountImage() {
    accountImage = null;
    accountImageSelected = false;
    emit(DeleteAccountImageSuccessState());
  }
}
