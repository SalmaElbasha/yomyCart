import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart'as slider;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/models/brand_page/brand_page_success_odel.dart';
import '../../../models/brand_page/brand_page_error_400_model.dart';
import '../../../models/brand_page/brand_page_error_model.dart';
import '../../../models/product_details/product_details_error_400_model.dart';
import '../../../models/product_details/product_details_error_model.dart';
import '../../../models/product_details/product_details_success_model.dart';
import '../../../models/product_page_search/product_page_search_error400_model.dart';
import '../../../models/product_page_search/product_page_search_error_model.dart';
import '../../../models/product_page_search/product_page_search_success_model.dart';
import '../../../models/product_search/product_details_search_error_400_model.dart';
import '../../../models/product_search/product_details_search_error_model.dart';
import '../../../models/product_search/product_details_search_success_model.dart';
import '../../../models/products/products_error400_model.dart';
import '../../../models/products/products_error_model.dart';
import '../../../models/products/products_success_model.dart';
import '../../../models/store_page_search/store_page_search_error400_model.dart';
import '../../../models/store_page_search/store_page_search_error_model.dart';
import '../../../models/store_page_search/store_page_search_success_model.dart';
import '../../../repository/repo.dart';
import '../../resources/routes_manager.dart';
import '/models/shop_category_model.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/shop/cubit/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(BuildContext context) => BlocProvider.of(context);

  // List<ShopCategoryModel> model = [
  //   ShopCategoryModel(
  //     name: 'All',
  //     image: ImageAssets.allIcon,
  //     isTaped: true,
  //   ),
  //   ShopCategoryModel(
  //     name: 'Drinks',
  //     image: ImageAssets.drinksImg,
  //     isTaped: false,
  //   ),
  //   ShopCategoryModel(
  //     name: 'Sweets',
  //     image: ImageAssets.sweetsIcon,
  //     isTaped: false,
  //   ),
  //   ShopCategoryModel(
  //     name: 'Cleaners',
  //     image: ImageAssets.cleaningProductIcon,
  //     isTaped: false,
  //   ),
  //   ShopCategoryModel(
  //     name: 'Foods',
  //     image: ImageAssets.foodsIcon,
  //     isTaped: false,
  //   ),
  //   ShopCategoryModel(
  //     name: 'Sweets',
  //     image: ImageAssets.sweetsIcon,
  //     isTaped: false,
  //   ),
  // ];

  bool isFavorite = false;
  bool isProducts = true;
  bool isOffers = false;

  void changeButton(String type, {context, id}) {
    if (type == 'products') {
      isProducts = true;
      isOffers = false;
    }
    if (type == 'offers') {
      getStoreOfferButtonPressed(context, id);
      isProducts = false;
      isOffers = true;
    }

    emit(ChangeButtonState());
  }

  ///todo
  void changeFavorite() {
    // isFavorite = !isFavorite;

    emit(ChangeFavoriteState());
  }

  List<String> images = [
    for (int i = 0; i < 5; i++) ImageAssets.muskMarket,
  ];

  int activeIndex = 0;

  void changeCarouselIndex(int index) {
    activeIndex = index;
    emit(ChangeCarouselIndexState());
  }

  var controller = slider.CarouselSliderController();
  List<ShopCategoryModel> filterModel = [
    ShopCategoryModel(
      name: 'Drinks',
      image: ImageAssets.drinksImg,
      isTaped: true,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Cleaners',
      image: ImageAssets.cleaningProductIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Foods',
      image: ImageAssets.foodsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
  ];
  RangeValues priceValues = const RangeValues(500, 800);

  void changePriceIndicator(value) {
    priceValues = value;
    emit(ChangePriceIndicatorState());
  }

  late ProductDetailsSuccessModel productDetailsSuccessModel;
  late ProductDetailsError400Model productDetailsError400Model;
  late ProductDetailsErrorModel productDetailsErrorModel;

  Future<void> getProductDetailsButtonPressed(
      BuildContext context, int id) async {
    emit(GetProductDetailsLoadingState());
    final response = await Repository.instance
        .productDetailsRepository()
        .getProductDetails(id);

    if (response is ProductDetailsSuccessModel) {
      log(response.toString());
      productDetailsSuccessModel = response;

      emit(GetProductDetailsSuccessState(response));
    } else if (response is ProductDetailsErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      productDetailsErrorModel = response;
      emit(GetProductDetailsErrorState(response));
    } else if (response is ProductDetailsError400Model) {
      log(response.detail.toString());
      productDetailsError400Model = response;
      emit(GetProductDetailsError400State(response));
    }
  }

  ProductDetailsSearchSuccessModel? productDetailsSearchSuccessModel;
  ProductDetailsSearchError400Model? productDetailsSearchError400Model;
  ProductDetailsSearchErrorModel? productDetailsSearchErrorModel;

  Future<void> getProductDetailsSearchButtonPressed(
      BuildContext context, int id) async {
    emit(GetProductDetailsSearchLoadingState());
    final response = await Repository.instance
        .productDetailsSearchRepository()
        .getProductDetailsSearch(id);

    if (response is ProductDetailsSearchSuccessModel) {
      log(response.toString());
      productDetailsSearchSuccessModel = response;

      emit(GetProductDetailsSearchSuccessState(response));
    } else if (response is ProductDetailsSearchErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      productDetailsSearchErrorModel = response;
      emit(GetProductDetailsSearchErrorState(response));
    } else if (response is ProductDetailsSearchError400Model) {
      log(response.detail.toString());
      productDetailsSearchError400Model = response;
      emit(GetProductDetailsSearchError400State(response));
    }
  }

  ProductPageSearchSuccessModel? productPageSearchSuccessModel;
  ProductPageSearchError400Model? productPageSearchError400Model;
  ProductPageSearchErrorModel? productPageSearchErrorModel;

  Future<void> getProductPageSearchButtonPressed(
      BuildContext context, int id) async {
    emit(GetProductPageSearchLoadingState());
    final response = await Repository.instance
        .productPageSearchRepository()
        .getProductPageSearch(id);

    if (response is ProductPageSearchSuccessModel) {
      log(response.toString());
      productPageSearchSuccessModel = response;

      emit(GetProductPageSearchSuccessState(response));
    } else if (response is ProductPageSearchErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      productPageSearchErrorModel = response;
      emit(GetProductPageSearchErrorState(response));
    } else if (response is ProductPageSearchError400Model) {
      log(response.detail.toString());
      productPageSearchError400Model = response;
      emit(GetProductPageSearchError400State(response));
    }
  }

  StorePageSearchSuccessModel? storeOfferSuccessModel;
  StorePageSearchError400Model? storeOfferError400Model;
  StorePageSearchErrorModel? storeOfferErrorModel;

  Future<void> getStoreOfferButtonPressed(BuildContext context, int id) async {
    emit(GetStoreOfferLoadingState());
    final response = await Repository.instance
        .storeOfferPageRepository()
        .getStoreOfferDetails(id);

    if (response is StorePageSearchSuccessModel) {
      log(response.toString());
      storeOfferSuccessModel = response;

      emit(GetStoreOfferSuccessState(response));
    } else if (response is StorePageSearchErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      storeOfferErrorModel = response;
      emit(GetStoreOfferErrorState(response));
    } else if (response is StorePageSearchError400Model) {
      log(response.detail.toString());
      storeOfferError400Model = response;
      emit(GetStoreOfferError400State(response));
    }
  }

  ProductsSuccessModel? productsSuccessModel;
  ProductsError400Model? productsError400Model;
  ProductsErrorModel? productsErrorModel;

  Future<void> getProductsButtonPressed(BuildContext context, int id) async {
    emit(GetProductsLoadingState());
    final response =
        await Repository.instance.productsRepository().getProducts(id);

    if (response is ProductsSuccessModel) {
      log(response.toString());
      productsSuccessModel = response;

      emit(GetProductsSuccessState(response));
    } else if (response is ProductsErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      productsErrorModel = response;
      emit(GetProductsErrorState(response));
    } else if (response is ProductsError400Model) {
      log(response.detail.toString());
      productsError400Model = response;
      emit(GetProductsError400State(response));
    }
  }

  BrandPageSuccessModel? brandPageSuccessModel;
  BrandPageError400Model? brandPageError400Model;
  BrandPageErrorModel? brandPageErrorModel;

  Future<void> getBrandPageButtonPressed(BuildContext context, int id) async {
    emit(GetBrandPageLoadingState());
    final response =
        await Repository.instance.brandPageRepository().getBrandPageData(id);

    if (response is BrandPageSuccessModel) {
      log(response.toString());
      brandPageSuccessModel = response;

      emit(GetBrandPageSuccessState(response));
    } else if (response is BrandPageErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      brandPageErrorModel = response;
      emit(GetBrandPageErrorState(response));
    } else if (response is BrandPageError400Model) {
      log(response.detail.toString());
      brandPageError400Model = response;
      emit(GetBrandPageError400State(response));
    }
  }
}
