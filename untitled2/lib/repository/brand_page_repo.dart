

import '../data/remote/api_services.dart';
import '../data/remote/brand_page_api.dart';
import '../models/brand_page/brand_page_model.dart';

class BrandPageRepository {
  BrandPageRepository._internal();
  static final BrandPageRepository instance = BrandPageRepository._internal();

  Future<BrandPageModel> getBrandPageData(int brandId) async {
    return await ApiServices.instance
        .brandPageApi()
        .fetchBrandPage(brandId: brandId);
  }
}
