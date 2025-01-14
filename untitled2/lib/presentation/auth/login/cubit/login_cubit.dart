// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/local/shared_prefrences.dart';
import '../../../../models/tokens/tokens_error400_model.dart';
import '../../../../models/tokens/tokens_error_model.dart';
import '../../../../models/tokens/tokens_model.dart';
import '../../../../models/tokens/tokens_success_model.dart';
import '../../../../repository/repo.dart';
import '../../../../utilis/consetant.dart';
import '../../../../utilis/error_handler.dart';
import '/presentation/resources/routes_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void skipOnPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
  }

  loginOnPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginGetTokensLoadingState());
      TokensModel tokensModel =
          await Repository.instance.authRepository().getToken(
                email: emailController.text,
                password: passwordController.text,
              );
      if (tokensModel is TokensSuccessModel) {
        log('Token: ${tokensModel.token!}');
        token = tokensModel.token!;
        SharedPref.setData(key: tokenKey, value: tokensModel.token);
        refreshToken = tokensModel.refreshToken!;
        SharedPref.setData(
            key: refreshTokenKey, value: tokensModel.refreshToken);
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        emit(LoginGetTokensSuccessState());
      } else if (tokensModel is TokensError400Model) {
        log(tokensModel.detail!);
        ErrorHandler.showErrorSnackBar(
          context: context,
          message: tokensModel.detail!,
        );
        emit(LoginGetTokensErrorState());
      } else if (tokensModel is TokensErrorModel) {
        for (var element in tokensModel.messages!) {
          ErrorHandler.showErrorSnackBar(
            context: context,
            message: element,
          );
          log(element);
        }
        emit(LoginGetTokensErrorState());
      }
    }
  }

  void forgotPasswordOnPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.forgetPasswordRoute);
  }

  void facebookOnPressed() {}

  void googleOnPressed() {}

  void registerOnPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.registerRoute);
  }
}
