import 'package:untitled2/repository/account_change_password_repo.dart';
import 'package:untitled2/repository/brand_page_repo.dart';
import 'package:untitled2/repository/personal_account_repo.dart';
import 'package:untitled2/repository/product_category_repo.dart';
import 'package:untitled2/repository/product_details_repo.dart';
import 'package:untitled2/repository/store_offer_page_repo.dart';
import 'package:untitled2/repository/strore_page_repo.dart';
import 'package:untitled2/repository/strore_page_search_repo.dart';

import 'Home_repo.dart';
import 'auth_repo.dart';
import 'product_details_search_repo.dart';
import 'product_page_search_repo.dart';
import 'products_repo.dart';
import 'update_personal_account_repo.dart';

class Repository {
  static final instance = Repository._internal();

  Repository._internal();

  factory Repository() => instance;

  AuthRepository authRepository() => AuthRepository.instance;

  HomeRepository homeRepository() => HomeRepository.instance;

  ProductCaegoryRepo productCategoryRepo() => ProductCaegoryRepo.instance;

  StorePageRepository storePageRepository() => StorePageRepository.instance;

  StorePageSearchRepository storePageSearchRepository() =>
      StorePageSearchRepository.instance;

  ProductDetailsRepository productDetailsRepository() =>
      ProductDetailsRepository.instance;

  ProductPageSearchRepository productPageSearchRepository() =>
      ProductPageSearchRepository.instance;

  ProductsRepository productsRepository() => ProductsRepository.instance;

  ProductDetailsSearchRepository productDetailsSearchRepository() =>
      ProductDetailsSearchRepository.instance;

  StoreOfferPageRepository storeOfferPageRepository() =>
      StoreOfferPageRepository.instance;

  BrandPageRepository brandPageRepository() => BrandPageRepository.instance;

  PersonalAccountRepository personalAccountRepository() =>
      PersonalAccountRepository.instance;

  UpdatePersonalAccountRepository updatePersonalAccountRepository() =>
      UpdatePersonalAccountRepository.instance;

  AccountChangePasswordRepository accountChangePasswordRepository() =>
      AccountChangePasswordRepository.instance;
}
