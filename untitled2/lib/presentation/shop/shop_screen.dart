import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/presentation/product/product_screen.dart';
import 'package:untitled2/presentation/shop/shop_about_screen.dart';
import '../../models/Store_page/store_page_success_model.dart';
import '../../models/store_page_search/store_page_search_success_model.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/shop/cubit/shop_cubit.dart';
import '/presentation/shop/cubit/shop_state.dart';
import '/presentation/widgets/driver_widget.dart';
import '/presentation/widgets/shop_category_item_widget.dart';
import '/presentation/widgets/shop_item_horizontal_widget.dart';
import '/presentation/widgets/shop_item_vertical_widget.dart';
import '/presentation/widgets/shop_search_bar_widget.dart';

class ShopScreen extends StatelessWidget {
  final StorePageSearchSuccessModel storePageSearchSuccessDataModel;

  const ShopScreen({
    Key? key,
    required this.storePageSearchSuccessDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          // if (state is GetProductDetailsSearchSuccessState) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ProductScreen(
          //         model: state.productDetailsSearchSuccessModel,
          //       ),
          //     ),
          //   );
          // }
        },
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorManager.primaryLight,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.search);
                    },
                    icon: SvgPicture.asset(
                      ImageAssets.categories,
                      color: ColorManager.grey3,
                      width: AppSize.s28,
                      height: AppSize.s28,
                      fit: BoxFit.fill,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.shopFilet);
                    },
                    icon: SvgPicture.asset(ImageAssets.filterIcon)),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Market Image
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        storePageSearchSuccessDataModel.data![0].storeImage!,
                        width: double.infinity,
                        height: AppSize.s156,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        ImageAssets.shadoImage,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              storePageSearchSuccessDataModel
                                  .data![0].storeName!,
                              style: const TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.medium,
                                fontFamily: FontConstants.fontFamily,
                                fontSize: AppSize.s20,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopAboutScreen(
                                            model:
                                                storePageSearchSuccessDataModel)));
                              },
                              icon: CircleAvatar(
                                radius: AppSize.s25,
                                backgroundColor: ColorManager.accent,
                                child: SvgPicture.asset(ImageAssets.aboutImage),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.changeFavorite();
                              },
                              icon: CircleAvatar(
                                radius: AppSize.s25,
                                backgroundColor: ColorManager.accent,
                                child: Icon(
                                  storePageSearchSuccessDataModel
                                          .data![0].isAddToFavoraite!
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: AppSize.s19,
                                  color: storePageSearchSuccessDataModel
                                          .data![0].isAddToFavoraite!
                                      ? ColorManager.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //categories
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p17,
                        top: AppPadding.p20,
                      ),
                      child: SizedBox(
                        height: AppSize.s70,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ShopCategoryItemWidget(
                            image: storePageSearchSuccessDataModel.data![0]
                                .storePageTypesDto![index].storeTypeImage!,
                            text: storePageSearchSuccessDataModel.data![0]
                                .storePageTypesDto![index].storeTypeName!,

                            ///todo
                            isTaped: false,
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: AppSize.s16,
                          ),
                          itemCount: storePageSearchSuccessDataModel
                              .data![0].storePageTypesDto!.length,
                        ),
                      ),
                    ),
                  ),

                  //product and offers and search
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppPadding.p30,
                      left: AppPadding.p30,
                    ),
                    child: Column(
                      children: [
                        DriverWidget(),

                        //product and offers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //products
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  cubit.changeButton('products');
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        StringsManager.products,
                                        style: TextStyle(
                                          color: cubit.isProducts
                                              ? ColorManager.primary
                                              : ColorManager.grey4,
                                          fontSize: AppSize.s16,
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                      ),
                                    ),
                                    if (cubit.isProducts)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            color: cubit.isProducts
                                                ? ColorManager.primary
                                                : ColorManager.grey2,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1.0,
                              height: AppSize.s34,
                              color: ColorManager.grey2,
                            ),
                            // offers
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ///todo id
                                  cubit.changeButton(
                                    'offers',
                                    context: context,
                                    id: 1,
                                  );
                                },
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        StringsManager.offers,
                                        style: TextStyle(
                                          color: cubit.isOffers
                                              ? ColorManager.primary
                                              : ColorManager.grey4,
                                          fontSize: AppSize.s16,
                                          fontWeight: FontWeightManager.bold,
                                          fontFamily: FontConstants.fontFamily,
                                        ),
                                      ),
                                    ),
                                    if (cubit.isOffers)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            color: cubit.isOffers
                                                ? ColorManager.primary
                                                : ColorManager.grey2,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //search
                        ShopSearchBarWidget(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.search);
                          },
                        ),
                      ],
                    ),
                  ),

                  //product and offer items
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                      vertical: AppPadding.p19,
                    ),
                    child: Column(
                      children: [
                        /* Row(
                          children: [
                            ShopItemVerticalWidget(
                              onTap: (){

                              },
                              inCart: false,
                              isFavorite: false,
                              name: 'Lasnshon Halwany',
                              price: '20 EGP / 1 KG',
                              image: ImageAssets.lanshonOffer,
                              rate: 4,
                            ),
                            const Spacer(),
                            ShopItemVerticalWidget(
                              onTap: (){

                              },
                              inCart: true,
                              isFavorite: true,
                              name: 'Lasnshon Halwany',
                              price: '20 EGP / 1 KG',
                              image: ImageAssets.lanshonOffer,
                              rate: 4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),*/
                        if (cubit.isProducts)
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                ShopItemHorizontalWidget(
                              onTap: () {
                                // cubit.getProductDetailsSearchButtonPressed(
                                //   context,
                                //   int.parse(storePageSuccessDataModel.data![0]
                                //       .storePageProductsDto![index].productId!),
                                // );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                        storeName:
                                            storePageSearchSuccessDataModel
                                                .data![0].storeName!,
                                        model: storePageSearchSuccessDataModel
                                            .data![0]
                                            .storePageProductsDto![index]),
                                  ),
                                );
                              },

                              ///todo in cart
                              inCart: false,
                              cartPress: () {},

                              isFavorite: storePageSearchSuccessDataModel
                                  .data![0]
                                  .storePageProductsDto![index]
                                  .isAddToFavoraite!,
                              name: storePageSearchSuccessDataModel.data![0]
                                  .storePageProductsDto![index].productName!,
                              price: storePageSearchSuccessDataModel.data![0]
                                  .storePageProductsDto![index].productPrice!,
                              image: storePageSearchSuccessDataModel.data![0]
                                  .storePageProductsDto![index].productImage!,
                              quantity: storePageSearchSuccessDataModel
                                  .data![0]
                                  .storePageProductsDto![index]
                                  .productQuantity!,
                              rate: int.parse(storePageSearchSuccessDataModel
                                      .data![0]
                                      .storePageProductsDto![index]
                                      .productRate!)
                                  .toDouble(),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: AppSize.s10,
                            ),
                            itemCount: storePageSearchSuccessDataModel
                                .data![0].storePageProductsDto!.length,
                          ),
                        if (cubit.isOffers)
                          cubit.storeOfferSuccessModel != null
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      ShopItemHorizontalWidget(
                                    onTap: () {
                                      ///todo function of product
                                      // cubit.getProductDetailsSearchButtonPressed(
                                      //   context,
                                      //   int.parse(storePageSuccessDataModel.data![0]
                                      //       .storePageProductsDto![index].productId!),
                                      // );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductScreen(
                                              storeName: cubit
                                                  .storeOfferSuccessModel!
                                                  .data![0]
                                                  .storeName!,
                                              model: cubit
                                                      .storeOfferSuccessModel!
                                                      .data![0]
                                                      .storePageProductsDto![
                                                  index]),
                                        ),
                                      );
                                    },

                                    ///todo in cart
                                    inCart: false,
                                    cartPress: () {},

                                    isFavorite: cubit
                                        .storeOfferSuccessModel!
                                        .data![0]
                                        .storePageProductsDto![index]
                                        .isAddToFavoraite!,
                                    name: cubit
                                        .storeOfferSuccessModel!
                                        .data![0]
                                        .storePageProductsDto![index]
                                        .productName!,
                                    price: cubit
                                        .storeOfferSuccessModel!
                                        .data![0]
                                        .storePageProductsDto![index]
                                        .productPrice!,
                                    image: cubit
                                        .storeOfferSuccessModel!
                                        .data![0]
                                        .storePageProductsDto![index]
                                        .productImage!,
                                    quantity: cubit
                                        .storeOfferSuccessModel!
                                        .data![0]
                                        .storePageProductsDto![index]
                                        .productQuantity!,
                                    rate: int.parse(cubit
                                            .storeOfferSuccessModel!
                                            .data![0]
                                            .storePageProductsDto![index]
                                            .productRate!)
                                        .toDouble(),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: AppSize.s10,
                                  ),
                                  itemCount: cubit.storeOfferSuccessModel!
                                      .data![0].storePageProductsDto!.length,
                                )
                              : cubit.storeOfferErrorModel != null
                                  ? Center(
                                      child: Text(
                                        cubit.storeOfferErrorModel!.messages
                                            .toString(),
                                      ),
                                    )
                                  : cubit.storeOfferError400Model != null
                                      ? Center(
                                          child: Text(
                                            cubit
                                                .storeOfferError400Model!.detail
                                                .toString(),
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
