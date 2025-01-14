import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/presentation/categories/cubit/categories_cubit.dart';
import 'package:untitled2/presentation/categories/cubit/categories_state.dart';
import '../shop/shop_screen.dart';
import '/models/category_item_model.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/category_common_item_widget.dart';
import '/presentation/widgets/category_nearest_list_item_widget.dart';
import '/presentation/widgets/category_search_text_form_widget.dart';
import '/presentation/widgets/location_mark_float_widget.dart';

class CategoryItemScreenWidget extends StatelessWidget {
  final CategoryItemModel model;
  final String title;

  const CategoryItemScreenWidget({
    Key? key,
    required this.model,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = CategoriesCubit.get(context);
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => CategoriesCubit()..getProductCategory(),
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state is GetShopPageSearchSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopScreen(
                  storePageSearchSuccessDataModel:
                      state.storePageSearchSuccessModel,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (CategoriesCubit.get(context).productCategoryPageSuccessModel !=
              null) {
            return Scaffold(
              appBar: AppBar(
                ///todo title
                title: Text(
                  title,
                  style: const TextStyle(
                    letterSpacing: AppSize.none,
                    fontFamily: FontConstants.fontFamily,
                    fontSize: AppSize.s20,
                    color: ColorManager.white,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                centerTitle: true,
              ),
              body: CategoriesCubit.get(context)
                      .productCategoryPageSuccessModel!
                      .data!
                      .isEmpty
                  ? const Center(
                      child: Text(StringsManager.noItmesFound),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          CategorySearchTextFieldWidget(
                              searchController: searchController),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          // categories Images
                          ///todo photos
                          Padding(
                            padding:
                                const EdgeInsets.only(left: AppPadding.p12),
                            child: SizedBox(
                              height: AppSize.s92,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Image.asset(
                                  model.categoriesImages[index],
                                  width: AppSize.s92,
                                  height: AppSize.s92,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: AppSize.s12,
                                ),
                                itemCount: model.categoriesImages.length,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s30,
                          ),

                          // common restaurant
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    model.commonText,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: AppSize.s18,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    StringsManager.showAll,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ColorManager.primaryLight,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: AppPadding.p12),
                            child: SizedBox(
                              height: AppSize.s152,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    CategoryCommonListItemWidget(
                                  model: CategoriesCubit.get(context)
                                      .productCategoryPageSuccessModel!
                                      .data![index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: AppSize.s14,
                                ),
                                itemCount: CategoriesCubit.get(context)
                                    .productCategoryPageSuccessModel!
                                    .data!
                                    .length,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s32,
                          ),

                          //Nearest Restaurants
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    model.nearestText,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: AppSize.s18,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    StringsManager.showAll,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ColorManager.primaryLight,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (CategoriesCubit.get(context)
                              .productCategoryPageSuccessModel!
                              .data![0]
                              .nearestStoreDto!
                              .isEmpty)
                            const Text(StringsManager.noItmesFound),

                          if (CategoriesCubit.get(context)
                              .productCategoryPageSuccessModel!
                              .data![0]
                              .nearestStoreDto!
                              .isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p22),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    CategoryNearestListItemWidget(
                                  model: CategoriesCubit.get(context)
                                      .productCategoryPageSuccessModel!
                                      .data![0]
                                      .nearestStoreDto![index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: AppSize.s22,
                                ),
                                itemCount: model.nearestModel.length,
                              ),
                            ),
                        ],
                      ),
                    ),
              floatingActionButton: const LocationMarkFloatWidget(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
            );
          } else if (CategoriesCubit.get(context)
                  .productCategoryPageErrorModel !=
              null) {
            return Scaffold(
              body: Center(
                child: Text(
                  CategoriesCubit.get(context)
                      .productCategoryPageErrorModel!
                      .messages
                      .toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorManager.red,
                      ),
                ),
              ),
            );
          } else if (CategoriesCubit.get(context)
                  .productCategoryPageError400Model !=
              null) {
            return Scaffold(
              body: Center(
                child: Text(
                  CategoriesCubit.get(context)
                      .productCategoryPageError400Model!
                      .errors
                      .toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorManager.red,
                      ),
                ),
              ),
            );
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
