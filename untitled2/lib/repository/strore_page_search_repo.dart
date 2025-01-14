import '../data/remote/api_services.dart';
import '../models/store_page_search/store_page_search_model.dart';

class StorePageSearchRepository {
  static final instance = StorePageSearchRepository._internal();

  StorePageSearchRepository._internal();

  factory StorePageSearchRepository() => instance;

  Future<StorePageSearchModel> getStoreSearchDetails(int storeId) async =>
      await ApiServices.instance
          .storePageSearchApi()
          .searchStore(storeId: storeId);
}
