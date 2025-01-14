import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/models/Store_page/store_page_error400_model.dart';
import 'package:untitled2/models/Store_page/store_page_success_model.dart';
import 'package:untitled2/models/product_category_page/product_category_page_model.dart';
import 'package:untitled2/models/store_page_search/store_page_search_success_model.dart';
import '../../../models/Store_page/store_page_error_model.dart';
import '../../../models/product_category_page/product_category_page_error_400_model.dart';
import '../../../models/product_category_page/product_category_page_error_model.dart';
import '../../../models/product_category_page/product_category_page_success_model.dart';
import '../../../models/store_page_search/store_page_search_error400_model.dart';
import '../../../models/store_page_search/store_page_search_error_model.dart';
import '../../resources/routes_manager.dart';
import '/models/category_common_model.dart';
import '/models/category_item_model.dart';
import '/models/category_nearest_model.dart';
import '/presentation/categories/cubit/categories_state.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '../../../../repository/repo.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  static CategoriesCubit get(BuildContext context) => BlocProvider.of(context);

  ProductCategoryPageSuccessModel? productCategoryPageSuccessModel;
  ProductCategoryPageErrorModel? productCategoryPageErrorModel;
  ProductCategoryPageError400Model? productCategoryPageError400Model;

  getProductCategory() async {
    emit(GetProductCategoryPageLoadingState());
    ProductCategoryPageModel model =
        await Repository.instance.productCategoryRepo().getProductCategory();
    if (model is ProductCategoryPageSuccessModel) {
      productCategoryPageSuccessModel = model;
      emit(GetProductCategoryPageSuccessState());
    } else if (model is ProductCategoryPageErrorModel) {
      productCategoryPageErrorModel = model;
      emit(GetProductCategoryPageErrorState());
    } else if (model is ProductCategoryPageError400Model) {
      productCategoryPageError400Model = model;
      emit(GetProductCategoryPageError400State());
    }
  }

  CategoryItemModel foodProduct = CategoryItemModel(
    categoriesImages: [
      ImageAssets.spicesFoodProducts,
      ImageAssets.fishFoodProducts,
      ImageAssets.meatMarkeFoodProducts,
      ImageAssets.dawagenFoodProducts,
    ],
    commonModel: [
      CategoryCommonModel(
        name: 'Khier Zaman',
        image: ImageAssets.boutcherShop2,
        rate: 1,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
      CategoryCommonModel(
        name: 'Ragab Sons',
        image: ImageAssets.boutcherShop2,
        rate: 2,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
      CategoryCommonModel(
        name: 'Kazyon Market',
        image: ImageAssets.boutcherShop2,
        rate: 3,
        reviewsNum: '402',
        ratingNum: 1.5,
        location: StringsManager.haramGiza,
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: 'Kazyon',
        image: ImageAssets.kazyonMarketNearest,
        category: 'Super Market',
        rate: 3,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'BMI',
        image: ImageAssets.bimNearest,
        category: 'Super Market',
        rate: 4,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Al Othiem',
        image: ImageAssets.alOthiemNearest,
        category: 'Hyper Market',
        rate: 5,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'El Gezawy',
        image: ImageAssets.elGizawyNearest,
        category: 'Super Market',
        rate: 2.5,
        distance: '10 KM',
        time: StringsManager.available24Hours,
      ),
    ],
    commonText: StringsManager.commonMarkets,
    nearestText: StringsManager.nearestMarkets,
    appBarTitle: StringsManager.foodProducts,
  );

  CategoryItemModel restaurants = CategoryItemModel(
    appBarTitle: StringsManager.restaurant,
    commonText: StringsManager.commonRestaurants,
    nearestText: StringsManager.nearestRestaurants,
    categoriesImages: [
      ImageAssets.pizzaCategories,
      ImageAssets.fastFood,
      ImageAssets.seaFood,
      ImageAssets.koshariCategories,
    ],
    commonModel: [
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.kfc,
        rate: 2.5,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.tahreer,
        rate: 4,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: 'Estacoza',
        rate: 3,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: StringsManager.hardees,
        image: ImageAssets.hardees,
        distance: '10 KM',
        category: StringsManager.fastFood,
        rate: 3,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.kfc,
        image: ImageAssets.kfcRestaurant,
        distance: '10 KM',
        category: 'Fried Chicken ',
        rate: 2.5,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.macRestaurant,
        image: ImageAssets.macRestaurant,
        distance: '10 KM',
        category: 'Burger',
        rate: 4,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Pizza King',
        image: ImageAssets.pizzaKingRestaurant,
        distance: '10 KM',
        category: 'Pizza',
        rate: 5,
        time: StringsManager.available24Hours,
      ),
    ],
  );

  CategoryItemModel fastFood = CategoryItemModel(
    appBarTitle: StringsManager.fastFood,
    commonText: 'Common Fast Foods',
    nearestText: 'Nearest Fast Food Restaurants',
    categoriesImages: [
      ImageAssets.pizzaCategories,
      ImageAssets.fastFood,
      ImageAssets.seaFood,
      ImageAssets.koshariCategories,
    ],
    commonModel: [
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.kfc,
        rate: 2.5,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: StringsManager.tahreer,
        rate: 4,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
      CategoryCommonModel(
        image: ImageAssets.boutcherShop2,
        name: 'Estacoza',
        rate: 3,
        ratingNum: 23,
        location: StringsManager.haramGiza,
        reviewsNum: '(150)',
      ),
    ],
    nearestModel: [
      CategoryNearestModel(
        name: StringsManager.hardees,
        image: ImageAssets.hardees,
        distance: '10 KM',
        category: StringsManager.fastFood,
        rate: 3,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.kfc,
        image: ImageAssets.kfcRestaurant,
        distance: '10 KM',
        category: 'Fried Chicken ',
        rate: 2.5,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: StringsManager.macRestaurant,
        image: ImageAssets.macRestaurant,
        distance: '10 KM',
        category: 'Burger',
        rate: 4,
        time: StringsManager.available24Hours,
      ),
      CategoryNearestModel(
        name: 'Pizza King',
        image: ImageAssets.pizzaKingRestaurant,
        distance: '10 KM',
        category: 'Pizza',
        rate: 5,
        time: StringsManager.available24Hours,
      ),
    ],
  );

  late StorePageSuccessModel storePageSuccessModel;
  late StorePageError400Model storePageError400Model;
  late StorePageErrorModel storePageErrorModel;

  ///ToDo Function inputs

  Future<void> shopPageButtonPressed(BuildContext context, int id) async {
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

  StorePageSearchSuccessModel? storePageSearchSuccessModel;
  StorePageSearchError400Model? storePageSearchError400Model;
  StorePageSearchErrorModel? storePageSearchErrorModel;

  ///ToDo Function inputs

  Future<void> shopPageSearchButtonPressed(BuildContext context, int id) async {
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
}
