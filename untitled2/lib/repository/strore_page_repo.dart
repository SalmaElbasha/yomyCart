import '../data/remote/api_services.dart';
import '../models/Store_page/store_page_model.dart';

class StorePageRepository {
  static final instance = StorePageRepository._internal();

  StorePageRepository._internal();

  factory StorePageRepository() => instance;

  Future<StorePageModel> getStoreDetails(int storeId) async =>
      await ApiServices.instance
          .storePageApi()
          .getStoreDetails(storeId: storeId);
}
