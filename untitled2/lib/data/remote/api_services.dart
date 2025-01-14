import 'package:untitled2/data/remote/account_change_password_api.dart';
import 'package:untitled2/data/remote/home_page_api.dart';
import 'package:untitled2/data/remote/personal_account_api.dart';
import 'package:untitled2/data/remote/product_details_search_page_api.dart';
import 'package:untitled2/data/remote/productcategorypage.dart';
import 'package:untitled2/data/remote/store_page_api.dart';

import 'auth_api_services.dart';
import 'brand_page_api.dart';
import 'product_details_page_api.dart';
import 'product_page_search_api.dart';
import 'products_api.dart';
import 'store_offer_page_api.dart';
import 'store_page_search_api.dart';
import 'update_persone_account_api.dart';

class ApiServices {
  ApiServices._instance();

  static final ApiServices instance = ApiServices._instance();

  AuthApiServices authApiServices() => AuthApiServices.instance;

  HomePageApi homePageApi() => HomePageApi.instance;

  ProductCategoryPageApi productCategoryPageApi() =>
      ProductCategoryPageApi.instance;

  StorePageApi storePageApi() => StorePageApi.instance;

  StorePageSearchApi storePageSearchApi() => StorePageSearchApi.instance;

  ProductPageSearchApi productPageSearchApi() => ProductPageSearchApi.instance;

  ProductsApi productsApi() => ProductsApi.instance;

  StoreOfferPageApi storeOfferPageApi() => StoreOfferPageApi.instance;

  BrandPageApi brandPageApi() => BrandPageApi.instance;

  ProductDetailsPageAPI productDetailsPageApi() =>
      ProductDetailsPageAPI.instance;

  ProductDetailsSearchPageAPI productDetailsSearchPageApi() =>
      ProductDetailsSearchPageAPI.instance;

  PersonalAccountApi personalAccountApi() => PersonalAccountApi.instance;

  UpdatePersonalAccountApi updatePersonalAccountApi() =>
      UpdatePersonalAccountApi.instance;

  AccountChangePasswordApi accountChangePasswordApi() =>
      AccountChangePasswordApi.instance;
}
