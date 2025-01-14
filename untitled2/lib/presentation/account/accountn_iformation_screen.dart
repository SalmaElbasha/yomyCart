import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/presentation/account/cubit/account_cubit.dart';
import 'package:untitled2/presentation/account/cubit/account_state.dart';
import '../../models/personal_account/personal_account_success_model.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/default_button_widget.dart';
import '/presentation/widgets/edit_account_text_field_widget.dart';
import '/presentation/widgets/white_app_bar_widget.dart';

var emailController = TextEditingController();
var firstNameController = TextEditingController();
var lastNameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class AccountInformationScreen extends StatelessWidget {
  final PersonalAccountSuccessModel model;

  const AccountInformationScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///todo password
    passwordController.text = '123';
    firstNameController.text = model.firstName!;
    lastNameController.text = model.lastName!;
    phoneController.text = model.phoneNumber ?? '';
    emailController.text = model.email!;
    var cubit = AccountCubit.get(context);
    var accountImage = cubit.accountImage;

    return BlocProvider(
      create: (context) => AccountCubit(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          if (state is UpdatePersonalAccountSuccessState) {
            ///todo
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: whiteAppBarWidget(
              context: context,
              color: ColorManager.primaryMoreLight,
              title: StringsManager.accountInformation,
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p31),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // profile image
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        ///todo condition
                        if (state is! AccountImagePickedSuccessState)
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                              model.imageUrl ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ1S0dbT6_X45YWOdDKArI9NqDp3je9-1FUGhITp9jLK0svOyhYYJGL1HLV2wXQd2TcyM&usqp=CAU',
                            ),
                          ),
                        if (state is AccountImagePickedSuccessState)
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: FileImage(accountImage!),
                          ),
                        IconButton(
                          icon: const CircleAvatar(
                            backgroundColor: ColorManager.accent,
                            radius: 25.0,
                            child: Icon(
                              Icons.add,
                              size: 16.0,
                              color: ColorManager.white,
                            ),
                          ),
                          onPressed: () {
                            cubit.getAccountImage();
                          },
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: AppPadding.p14,
                    ),

                    //first name
                    EditAccountTextFieldWidget(
                      controller: firstNameController,
                      label: StringsManager.firstName,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //last name
                    EditAccountTextFieldWidget(
                      controller: lastNameController,
                      label: StringsManager.lastName,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //phone
                    EditAccountTextFieldWidget(
                      controller: phoneController,
                      label: StringsManager.phone,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //email
                    EditAccountTextFieldWidget(
                      controller: emailController,
                      label: StringsManager.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    //password
                    EditAccountTextFieldWidget(
                      controller: passwordController,
                      label: StringsManager.editPassword,
                      keyboardType: TextInputType.text,
                      isRead: true,
                      isObscure: true,
                      onPress: () {
                        Navigator.pushNamed(context, Routes.changePassword);
                      },
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    if (state is UpdatePersonalAccountLoadingState)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is! UpdatePersonalAccountLoadingState)
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p31),
                        child: DefaultButtonWidget(
                          text: StringsManager.update,
                          onPressed: () {
                            if (cubit.accountImage == null) {
                              cubit.updatePersonalAccountFunction(
                                context,
                                id: model.id!,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                phoneNumber: phoneController.text,
                                email: emailController.text,
                                deleteCurrentImage: false,
                              );
                            } else if (cubit.accountImage != null) {
                              cubit.updatePersonalAccountWithImageFunction(
                                context,
                                id: model.id!,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                phoneNumber: phoneController.text,
                                email: emailController.text,

                                ///todo Image data
                                imageName: 'Name',
                                imageExtension: 'png',
                                imageData: '00',
                                deleteCurrentImage: true,
                              );
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
