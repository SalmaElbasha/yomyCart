import 'package:untitled2/models/product_details/product_details_error_400_model.dart';
import 'package:untitled2/models/product_details/product_details_error_model.dart';
import 'package:untitled2/models/product_details/product_details_success_model.dart';
import 'package:untitled2/models/store_page_search/store_page_search_error_model.dart';
import 'package:untitled2/models/store_page_search/store_page_search_success_model.dart';

import '../../../models/brand_page/brand_page_error_400_model.dart';
import '../../../models/brand_page/brand_page_error_model.dart';
import '../../../models/brand_page/brand_page_success_odel.dart';
import '../../../models/product_details/product_details_model.dart';
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

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ChangeButtonState extends ShopState {}

class ChangeFavoriteState extends ShopState {}

class ChangeCarouselIndexState extends ShopState {}

class ChangePriceIndicatorState extends ShopState {}

class GetProductDetailsLoadingState extends ShopState {}

class GetProductDetailsSuccessState extends ShopState {
  final ProductDetailsSuccessModel productDetailsSuccessModel;

  GetProductDetailsSuccessState(this.productDetailsSuccessModel);
}

class GetProductDetailsErrorState extends ShopState {
  final ProductDetailsErrorModel productDetailsErrorModel;

  GetProductDetailsErrorState(this.productDetailsErrorModel);
}

class GetProductDetailsError400State extends ShopState {
  final ProductDetailsError400Model productDetailsError400Model;

  GetProductDetailsError400State(this.productDetailsError400Model);
}

class GetProductDetailsSearchLoadingState extends ShopState {}

class GetProductDetailsSearchSuccessState extends ShopState {
  final ProductDetailsSearchSuccessModel productDetailsSearchSuccessModel;

  GetProductDetailsSearchSuccessState(this.productDetailsSearchSuccessModel);
}

class GetProductDetailsSearchErrorState extends ShopState {
  final ProductDetailsSearchErrorModel productDetailsSearchErrorModel;

  GetProductDetailsSearchErrorState(this.productDetailsSearchErrorModel);
}

class GetProductDetailsSearchError400State extends ShopState {
  final ProductDetailsSearchError400Model productDetailsSearchError400Model;

  GetProductDetailsSearchError400State(this.productDetailsSearchError400Model);
}

class GetProductPageSearchLoadingState extends ShopState {}

class GetProductPageSearchSuccessState extends ShopState {
  final ProductPageSearchSuccessModel productPageSearchSuccessModel;

  GetProductPageSearchSuccessState(this.productPageSearchSuccessModel);
}

class GetProductPageSearchErrorState extends ShopState {
  final ProductPageSearchErrorModel productPageSearchErrorModel;

  GetProductPageSearchErrorState(this.productPageSearchErrorModel);
}

class GetProductPageSearchError400State extends ShopState {
  final ProductPageSearchError400Model productPageSearchError400Model;

  GetProductPageSearchError400State(this.productPageSearchError400Model);
}

class GetProductsLoadingState extends ShopState {}

class GetProductsSuccessState extends ShopState {
  final ProductsSuccessModel productsSuccessModel;

  GetProductsSuccessState(this.productsSuccessModel);
}

class GetProductsErrorState extends ShopState {
  final ProductsErrorModel productsErrorModel;

  GetProductsErrorState(this.productsErrorModel);
}

class GetProductsError400State extends ShopState {
  final ProductsError400Model productsError400Model;

  GetProductsError400State(this.productsError400Model);
}

class GetStoreOfferLoadingState extends ShopState {}

class GetStoreOfferSuccessState extends ShopState {
  final StorePageSearchSuccessModel storePageSearchSuccessModel;

  GetStoreOfferSuccessState(this.storePageSearchSuccessModel);
}

class GetStoreOfferErrorState extends ShopState {
  final StorePageSearchErrorModel storePageSearchErrorModel;

  GetStoreOfferErrorState(this.storePageSearchErrorModel);
}

class GetStoreOfferError400State extends ShopState {
  final StorePageSearchError400Model storePageSearchError400Model;

  GetStoreOfferError400State(this.storePageSearchError400Model);
}

class GetBrandPageLoadingState extends ShopState {}

class GetBrandPageSuccessState extends ShopState {
  final BrandPageSuccessModel brandPageSuccessModel;

  GetBrandPageSuccessState(this.brandPageSuccessModel);
}

class GetBrandPageErrorState extends ShopState {
  final BrandPageErrorModel brandPageErrorModel;

  GetBrandPageErrorState(this.brandPageErrorModel);
}

class GetBrandPageError400State extends ShopState {
  final BrandPageError400Model brandPageError400Model;

  GetBrandPageError400State(this.brandPageError400Model);
}
