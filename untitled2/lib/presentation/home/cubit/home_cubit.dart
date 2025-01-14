import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/models/home_page/home_page_api_error400_model.dart';
import 'package:untitled2/presentation/shop/shop_screen.dart';

import '../../../models/Store_page/store_page_error400_model.dart';
import '../../../models/Store_page/store_page_error_model.dart';
import '../../../models/Store_page/store_page_success_model.dart';
import '../../../models/home_page/home_page_api_error_model.dart';
import '../../../models/home_page/home_page_api_success_model.dart';
import '../../../models/personal_account/personal_account_error400_model.dart';
import '../../../models/personal_account/personal_account_error_model.dart';
import '../../../models/personal_account/personal_account_success_model.dart';
import '../../../models/store_page_search/store_page_search_error400_model.dart';
import '../../../models/store_page_search/store_page_search_error_model.dart';
import '../../../models/store_page_search/store_page_search_success_model.dart';
import '../../resources/routes_manager.dart';
import '/presentation/account/account_screen.dart';
import '/presentation/cart/cart_screen.dart';
import '/presentation/home/home_screen.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '../../../repository/repo.dart';
import '../../categories/categories_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  HomePageApiSuccessModel? homePageApiModel;
  HomePageApiErrorModel? homePageApiErrorModel;
  HomePageApiError400Model? homePageApiError404Model;

  List<String> items = [
    for (int i = 0; i < 5; i++) ImageAssets.pizzaKing,
  ];
  double indicatorIndex = 0;
  int currentIndex = 0;
  List<Items> navItems = [
    Items(
      index: 0,
      text: StringsManager.home,
      icon: ImageAssets.home,
      onPressed: () {},
    ),
    Items(
        index: 1,
        text: StringsManager.categories,
        icon: ImageAssets.categories,
        onPressed: () {}),
    Items(
      index: 2,
      text: StringsManager.cart,
      icon: ImageAssets.cart,
      onPressed: () {},
    ),
    Items(
      index: 3,
      text: StringsManager.orders,
      icon: ImageAssets.orders,
      onPressed: () {},
    ),
    Items(
      index: 4,
      text: StringsManager.setting,
      icon: ImageAssets.profile,
      onPressed: () {},
    ),
  ];

  void changeIndicatorIndex(double index) {
    emit(HomeInitial());
    indicatorIndex = index;
    emit(HomeChangeIndicatorIndexState());
  }

  Widget? pages(context, index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return const AccountScreen();
    }
    return null;
  }

  void changePageIndex(int index, context) {
    emit(HomeInitial());
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    } else if (index == 4) {
      getPersonalAccountFunction();
      currentIndex = index;
    } else {
      currentIndex = index;
    }
    emit(HomeChangePageIndexState());
  }

  getHomeScreenApi({required BuildContext context}) async {
    emit(HomeGetHomePageDataLoadingState());
    final response =
        await Repository.instance.homeRepository().featchHomeData();
    // return response;
    if (response is HomePageApiSuccessModel) {
      log(response.data!.toString());
      homePageApiModel = response;
      emit(HomeGetHomePageDataSuccessState(response));
    } else if (response is HomePageApiErrorModel) {
      log('Error: ${response.messages}');
      if (response.messages[0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      homePageApiErrorModel = response;
      emit(HomeGetHomePageDataErrorState(response));
    } else if (response is HomePageApiError400Model) {
      log(response.detail.toString());
      homePageApiError404Model = response;
      emit(HomeGetHomePageDataError404State(response));
    }
  }

  StorePageSearchSuccessModel? storePageSearchSuccessModel;
  StorePageSearchError400Model? storePageSearchError400Model;
  StorePageSearchErrorModel? storePageSearchErrorModel;

  Future<void> getShopPageSearchButtonPressed(
      BuildContext context, int id) async {
    emit(GetShopPageSearchLoadingState());
    final response = await Repository.instance
        .storePageSearchRepository()
        .getStoreSearchDetails(id);

    if (response is StorePageSearchSuccessModel) {
      log(response.toString());
      storePageSearchSuccessModel = response;
      emit(GetShopPageSearchSuccessState(response));
    } else if (response is StorePageSearchErrorModel) {
      log('Error: ${response.messages}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      storePageSearchErrorModel = response;
      emit(GetShopPageSearchErrorState(response));
    } else if (response is StorePageSearchError400Model) {
      log(response.detail.toString());
      storePageSearchError400Model = response;
      emit(GetShopPageSearchError400State(response));
    }
  }

  late StorePageSuccessModel storePageSuccessModel;
  late StorePageError400Model storePageError400Model;
  late StorePageErrorModel storePageErrorModel;

  ///ToDo Function inputs

  Future<void> getShopPageButtonPressed(BuildContext context, int id) async {
    emit(GetShopPageLoadingState());
    final response =
        await Repository.instance.storePageRepository().getStoreDetails(id);

    if (response is StorePageSuccessModel) {
      log(response.toString());
      storePageSuccessModel = response;

      emit(GetShopPageSuccessState(response));
    } else if (response is StorePageErrorModel) {
      log('Error: ${response.messages}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      storePageErrorModel = response;
      emit(GetShopPageErrorState(response));
    } else if (response is StorePageError400Model) {
      log(response.detail.toString());
      storePageError400Model = response;
      emit(GetShopPageError400State(response));
    }
  }

  PersonalAccountSuccessModel? personalAccountSuccessModel;

  PersonalAccountError400Model? personalAccountError400Model;
  PersonalAccountErrorModel? personalAccountErrorModel;

  Future<void> getPersonalAccountFunction() async {
    emit(GetPersonalAccountLoadingState());
    final response = await Repository.instance
        .personalAccountRepository()
        .getPersonalAccount();

    if (response is PersonalAccountSuccessModel) {
      log(response.toString());
      personalAccountSuccessModel = response;

      emit(GetPersonalAccountSuccessState(response));
    } else if (response is PersonalAccountErrorModel) {
      log('Error: ${response.messages}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        personalAccountErrorModel = response;
        emit(GetPersonalAccountErrorState(response));
      }
    } else if (response is PersonalAccountError400Model) {
      log(response.detail.toString());
      personalAccountError400Model = response;
      emit(GetPersonalAccountError400State(response));
    }
  }
}

class Items {
  int? index;
  String? text;
  String? icon;
  Function? onPressed;

  Items({
    required this.index,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}
