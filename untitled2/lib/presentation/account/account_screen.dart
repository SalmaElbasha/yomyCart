import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/cubit/home_cubit.dart';
import '/presentation/account/cubit/account_cubit.dart';
import '/presentation/account/cubit/account_state.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/account_banner_widget.dart';
import '/presentation/widgets/account_item_widget.dart';
import '/presentation/widgets/driver_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'accountn_iformation_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    return BlocProvider(
        create: (context) => AccountCubit(),
        child: BlocConsumer<AccountCubit, AccountState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AccountCubit.get(context);
              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //profile data
                        homeCubit.personalAccountSuccessModel != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: AppSize.s15,
                                  ),
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage(
                                      homeCubit.personalAccountSuccessModel!
                                              .imageUrl ??
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ1S0dbT6_X45YWOdDKArI9NqDp3je9-1FUGhITp9jLK0svOyhYYJGL1HLV2wXQd2TcyM&usqp=CAU',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppSize.s7,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccountInformationScreen(
                                                        model: homeCubit
                                                            .personalAccountSuccessModel!,
                                                      )));
                                        },
                                        child: SvgPicture.asset(
                                          ImageAssets.editIcon,
                                          height: AppSize.s25,
                                          width: AppSize.s25,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppSize.s8,
                                      ),
                                      Text(
                                        '${homeCubit.personalAccountSuccessModel!.firstName} ${homeCubit.personalAccountSuccessModel!.lastName}',
                                        style: const TextStyle(
                                          color: ColorManager.primaryLight,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: AppSize.s8,
                                  ),
                                  Text(
                                    homeCubit.personalAccountSuccessModel!
                                            .phoneNumber ??
                                        "000",
                                    style: const TextStyle(
                                      color: ColorManager.greyDark,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            : homeCubit.personalAccountErrorModel != null
                                ? Center(
                                    child: Text(
                                      homeCubit
                                          .personalAccountErrorModel!.messages
                                          .toString(),
                                    ),
                                  )
                                : homeCubit.personalAccountError400Model != null
                                    ? Center(
                                        child: Text(
                                          homeCubit
                                              .personalAccountError400Model!
                                              .detail
                                              .toString(),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: DriverWidget(),
                        ),
                        //My Account
                        AccountBannerWidget(
                          text: StringsManager.myAccount,
                          onPressed: () {
                            cubit.changeRadioButton('account');
                          },
                          isPressed: cubit.isMyAccount,
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isMyAccount)
                          Column(
                            children: [
                              //wish List
                              AccountItemWidget(
                                text: StringsManager.wishList,
                                image: ImageAssets.heartIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.wishList);
                                },
                              ),

                              //my orders
                              AccountItemWidget(
                                text: StringsManager.myOrders,
                                image: ImageAssets.myOrderIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.myOrders);
                                },
                              ),

                              //saved Addresses
                              AccountItemWidget(
                                text: StringsManager.savedAddresses,
                                image: ImageAssets.addressesIcon,
                                onTap: () {},
                              ),
                            ],
                          ),

                        //settings
                        AccountBannerWidget(
                          text: StringsManager.settings,
                          onPressed: () {
                            cubit.changeRadioButton('settings');
                          },
                          isPressed: cubit.isSettings,
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isSettings)
                          Column(
                            children: [
                              //Language
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p30,
                                      right: AppPadding.p30,
                                      bottom: AppPadding.p17),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: AppSize.s44,
                                        child: SvgPicture.asset(
                                          ImageAssets.languageIcon,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: AppSize.s25,
                                      ),
                                      const Text(
                                        StringsManager.language,
                                        style: TextStyle(
                                          color: ColorManager.greyDark,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'English',
                                        style: TextStyle(
                                          color: ColorManager.greyDark,
                                          fontSize: AppSize.s15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Payment
                              AccountItemWidget(
                                text: StringsManager.payment,
                                image: ImageAssets.creditIcon,
                                onTap: () {},
                              ),

                              //Notifications
                              AccountItemWidget(
                                text: StringsManager.notifications,
                                image: ImageAssets.notificationIcon,
                                onTap: () {},
                              ),
                            ],
                          ),

                        //3alnassya
                        Container(
                          height: AppSize.s45,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            right: AppPadding.p20,
                            left: AppPadding.p30,
                          ),
                          color: ColorManager.primaryMoreLight,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                ImageAssets.alnassyaIcon,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  cubit.changeRadioButton('3alnassya');
                                },
                                icon: Icon(
                                    cubit.isAlnassya
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: ColorManager.accent),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s17,
                        ),
                        if (cubit.isAlnassya)
                          Column(
                            children: [
                              //about app
                              AccountItemWidget(
                                text: StringsManager.aboutApplication,
                                image: ImageAssets.aboutIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.about);
                                },
                              ),

                              //privacy
                              AccountItemWidget(
                                text: StringsManager.privacyPolicy,
                                image: ImageAssets.privacyIcon,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.policy);
                                },
                              ),

                              //terms
                              AccountItemWidget(
                                text: StringsManager.termsAndConditions,
                                image: ImageAssets.termsIcon,
                                onTap: () {},
                              ),

                              //call us
                              AccountItemWidget(
                                text: StringsManager.callUs,
                                image: ImageAssets.phoneIcon,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.contactUs);
                                },
                              ),

                              //facebook
                              AccountItemWidget(
                                text: StringsManager.facebook,
                                image: ImageAssets.facebookIcon,
                                onTap: () {},
                              ),

                              //twitter
                              AccountItemWidget(
                                text: StringsManager.twitter,
                                image: ImageAssets.twitterIcon,
                                onTap: () {},
                              ),

                              //instagram
                              AccountItemWidget(
                                text: StringsManager.instagram,
                                image: ImageAssets.instagramIcon,
                                onTap: () {},
                              ),

                              //share App With Friends
                              AccountItemWidget(
                                text: StringsManager.shareAppWithFriends,
                                image: ImageAssets.shareIcon,
                                onTap: () {},
                              ),

                              //rate Application
                              AccountItemWidget(
                                text: StringsManager.rateApplication,
                                image: ImageAssets.starIcon,
                                png: true,
                                onTap: () {},
                              ),

                              //help
                              AccountItemWidget(
                                text: StringsManager.helpFAQ,
                                image: ImageAssets.helpIcon,
                                onTap: () {},
                              ),

                              //legal
                              AccountItemWidget(
                                text: StringsManager.legal,
                                image: ImageAssets.legalIcon,
                                onTap: () {},
                              ),

                              //log out
                              AccountItemWidget(
                                text: StringsManager.logOut,
                                image: ImageAssets.logoutIcon,
                                onTap: () {
                                  cubit.logout(context: context);
                                },
                              ),
                            ],
                          ),

                        const Text(
                          'جميع الحقوق محفوظة لشركة اون كوميرس',
                          style: TextStyle(
                            color: ColorManager.greyDark,
                            fontSize: AppSize.s15,
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s26,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
