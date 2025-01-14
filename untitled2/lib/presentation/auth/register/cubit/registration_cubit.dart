import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/tokens/tokens_error_model.dart';
import '../../../../models/tokens/tokens_model.dart';
import '../../../../models/tokens/tokens_success_model.dart';
import '../../../../utilis/error_handler.dart';
import '/models/register/register_error400_model.dart';
import '/models/register/register_error_model.dart';
import '/models/register/register_model.dart';
import '/models/register/register_success_model.dart';
import '/presentation/resources/routes_manager.dart';
import '../../../../repository/repo.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool agree = false;
  String adminToken = '';

  void onAgreeChanged(bool? value) {
    emit(RegistrationInitial());
    log(value.toString());
    agree = value!;
    emit(OnAgreeChanged());
  }

  void termsOfServicePressed() {}

  void skipButtonPressed() {}

  getAdminToken() async {
    TokensModel tokenModel =
        await Repository.instance.authRepository().getToken(
              email: "admin@root.com",
              password: "123Pa\$\$word!",
            );
    if (tokenModel is TokensSuccessModel) {
      log('Token: ${tokenModel.token!}');
      adminToken = tokenModel.token!;
    } else if (tokenModel is TokensErrorModel) {
      log(tokenModel.messages!.toString());
    }
  }

  Future<void> registerButtonPressed(BuildContext context) async {
    await getAdminToken();
    if (formKey.currentState!.validate() && agree) {
      emit(RegistrationLoading());

      RegisterModel registerModel =
          await Repository.instance.authRepository().register(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                userName: userNameController.text,
                mobile: mobileController.text,
                password: passwordController.text,
                confirmPassword: confirmPasswordController.text,
                adminToken: adminToken,
              );
      if (registerModel is RegisterSuccessModel) {
        log(registerModel.message!);
        ErrorHandler.showSuccessSnackBar(
          message: registerModel.message!,
          context: context,
        );
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
        emit(RegistrationSuccess());
      } else if (registerModel is RegisterErrorModel) {
        log(registerModel.messages!.toString());
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: registerModel.messages![0],
        );
        emit(RegistrationError(registerModel.messages![0]));
      } else if (registerModel is RegisterError400Model) {
        log(registerModel.errors![0].toString());
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: registerModel.errors!.toString(),
        );

        emit(RegistrationError(registerModel.errors![0].toString()));
      }
    }
  }
}
