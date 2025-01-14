

import '../data/remote/api_services.dart';
import '../models/home_page/home_page_api_model.dart';

class HomeRepository {
  static final instance = HomeRepository._internal();
  HomeRepository._internal();
  factory HomeRepository() => instance;

  Future<HomePageApiModel> featchHomeData() async =>
      await ApiServices.instance.homePageApi().getHomePageData();
}
