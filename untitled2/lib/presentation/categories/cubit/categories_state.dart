import 'package:untitled2/models/Store_page/store_page_error400_model.dart';
import 'package:untitled2/models/Store_page/store_page_success_model.dart';

import '../../../models/Store_page/store_page_error_model.dart';
import '../../../models/store_page_search/store_page_search_error400_model.dart';
import '../../../models/store_page_search/store_page_search_error_model.dart';
import '../../../models/store_page_search/store_page_search_success_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class GetShopPageLoadingState extends CategoriesState {}

class GetShopPageSuccessState extends CategoriesState {
  final StorePageSuccessModel storePageSuccessModel;

  GetShopPageSuccessState(this.storePageSuccessModel);
}

class GetShopPageErrorState extends CategoriesState {
  final StorePageErrorModel storePageErrorModel;

  GetShopPageErrorState(this.storePageErrorModel);
}

class GetShopPageError400State extends CategoriesState {
  final StorePageError400Model storePageError400Model;

  GetShopPageError400State(this.storePageError400Model);
}

class GetProductCategoryPageLoadingState extends CategoriesState {}

class GetProductCategoryPageSuccessState extends CategoriesState {}

class GetProductCategoryPageErrorState extends CategoriesState {}

class GetProductCategoryPageError400State extends CategoriesState {}

class GetShopPageSearchLoadingState extends CategoriesState {}

class GetShopPageSearchSuccessState extends CategoriesState {
  final StorePageSearchSuccessModel storePageSearchSuccessModel;

  GetShopPageSearchSuccessState(this.storePageSearchSuccessModel);
}

class GetShopPageSearchErrorState extends CategoriesState {
  final StorePageSearchErrorModel storePageSearchErrorModel;

  GetShopPageSearchErrorState(this.storePageSearchErrorModel);
}

class GetShopPageSearchError400State extends CategoriesState {
  final StorePageSearchError400Model storePageSearchError400Model;

  GetShopPageSearchError400State(this.storePageSearchError400Model);
}
