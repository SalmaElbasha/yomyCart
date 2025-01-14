part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeIndicatorIndexState extends HomeState {}

class HomeChangePageIndexState extends HomeState {}

class HomeGetTokensLoadingState extends HomeState {}

class HomeGetTokensSuccessState extends HomeState {}

class HomeGetTokensErrorState extends HomeState {}

class HomeGetHomePageDataLoadingState extends HomeState {}

class HomeGetHomePageDataSuccessState extends HomeState {
  final HomePageApiSuccessModel homePageApiModel;

  HomeGetHomePageDataSuccessState(this.homePageApiModel);
}

class HomeGetHomePageDataErrorState extends HomeState {
  final HomePageApiErrorModel homePageApiErrorModel;

  HomeGetHomePageDataErrorState(this.homePageApiErrorModel);
}

class HomeGetHomePageDataError404State extends HomeState {
  final HomePageApiError400Model homePageApiError404Model;

  HomeGetHomePageDataError404State(this.homePageApiError404Model);
}

class GetShopPageLoadingState extends HomeState {}

class GetShopPageSuccessState extends HomeState {
  final StorePageSuccessModel storePageSuccessModel;

  GetShopPageSuccessState(this.storePageSuccessModel);
}

class GetShopPageSearchLoadingState extends HomeState {}

class GetShopPageSearchSuccessState extends HomeState {
  final StorePageSearchSuccessModel storePageSearchSuccessModel;

  GetShopPageSearchSuccessState(this.storePageSearchSuccessModel);
}

class GetShopPageSearchErrorState extends HomeState {
  final StorePageSearchErrorModel storePageSearchErrorModel;

  GetShopPageSearchErrorState(this.storePageSearchErrorModel);
}

class GetShopPageSearchError400State extends HomeState {
  final StorePageSearchError400Model storePageSearchError400Model;

  GetShopPageSearchError400State(this.storePageSearchError400Model);
}

class GetShopPageErrorState extends HomeState {
  final StorePageErrorModel storePageErrorModel;

  GetShopPageErrorState(this.storePageErrorModel);
}

class GetShopPageError400State extends HomeState {
  final StorePageError400Model storePageError400Model;

  GetShopPageError400State(this.storePageError400Model);
}

class GetPersonalAccountLoadingState extends HomeState {}

class GetPersonalAccountSuccessState extends HomeState {
  final PersonalAccountSuccessModel personalAccountSuccessModel;

  GetPersonalAccountSuccessState(this.personalAccountSuccessModel);
}

class GetPersonalAccountErrorState extends HomeState {
  final PersonalAccountErrorModel personalAccountErrorModel;

  GetPersonalAccountErrorState(this.personalAccountErrorModel);
}

class GetPersonalAccountError400State extends HomeState {
  final PersonalAccountError400Model personalAccountError400Model;

  GetPersonalAccountError400State(this.personalAccountError400Model);
}
