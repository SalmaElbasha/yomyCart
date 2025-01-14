import '../data/remote/api_services.dart';
import '../models/store_page_search/store_page_search_model.dart';

class StoreOfferPageRepository {
  static final instance = StoreOfferPageRepository._internal();

  StoreOfferPageRepository._internal();

  factory StoreOfferPageRepository() => instance;

  Future<StorePageSearchModel> getStoreOfferDetails(int storeOfferId) async =>
      await ApiServices.instance
          .storeOfferPageApi()
          .fetchStoreOfferPage(storeOfferId: storeOfferId);
}
