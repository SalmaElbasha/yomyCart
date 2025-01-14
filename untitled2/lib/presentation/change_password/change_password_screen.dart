import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/presentation/account/cubit/account_cubit.dart';
import 'package:untitled2/presentation/account/cubit/account_state.dart';
import '../../utilis/error_handler.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/default_button_widget.dart';
import '/presentation/widgets/login_text_field_widget.dart';
import '/presentation/widgets/sliver_app_bar_widget.dart';

var oldPasswordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmPasswordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          if (state is AccountChangePasswordSuccessState) {
            ///todo
            Navigator.pop(context);
          }
          if (state is AccountChangePasswordError400State) {
            ErrorHandler.showErrorSnackBar(
              context: context,
              message: state.accountChangePasswordError400Model.detail!,
            );
          }
          if (state is AccountChangePasswordErrorState) {
            for (var element
                in state.accountChangePasswordErrorModel.messages!) {
              ErrorHandler.showErrorSnackBar(
                context: context,
                message: element,
              );
              log(element);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBarWidget(
                    onSkipButtonPressed: () {},
                    isSkipButtonVisible: false,
                    isBackButtonVisible: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p31),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.editPassword,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: ColorManager.primary,
                                      ),
                                ),
                                const SizedBox(height: AppSize.s18),

                                //old password
                                LoginTextFieldWidget(
                                  controller: oldPasswordController,
                                  label: StringsManager.enterOldPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  labelColor: ColorManager.grey4,
                                  isPassword: true,
                                  isObscure: true,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),

                                //new password
                                LoginTextFieldWidget(
                                  controller: newPasswordController,
                                  label: StringsManager.enterNewPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  labelColor: ColorManager.grey4,
                                  isObscure: true,
                                  isPassword: true,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),

                                //confirm new password
                                LoginTextFieldWidget(
                                  controller: confirmPasswordController,
                                  label: StringsManager.confirmNewPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  labelColor: ColorManager.grey4,
                                  isObscure: true,
                                  isPassword: true,
                                ),

                                //botton
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                if (state is UpdatePersonalAccountLoadingState)
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                if (state is! UpdatePersonalAccountLoadingState)
                                  DefaultButtonWidget(
                                    text: StringsManager.save,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.changePasswordAccountFunction(
                                          context,
                                          password: oldPasswordController.text,
                                          newPassword:
                                              newPasswordController.text,
                                          confirmNewPassword:
                                              confirmPasswordController.text,
                                        );
                                      }
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: AppPadding.p31, vertical: AppPadding.p20),
            //   child: DefaultButtonWidget(
            //     text: StringsManager.save,
            //     onPressed: () {},
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
