import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/models/product_details/product_details_success_model.dart';
import '../../models/product_search/product_details_search_success_model.dart';
import '../../models/store_page_search/store_page_search_success_model.dart';
import '/presentation/product/cubit/product_cubit.dart';
import '/presentation/product/cubit/product_state.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/default_button_widget.dart';
import '/presentation/widgets/driver_widget.dart';
import '/presentation/widgets/produt_similar_iteem_widget.dart';
import '/presentation/widgets/white_app_bar_widget.dart';

class ProductScreen extends StatelessWidget {
  final String storeName;
  final StorePageProductsDto model;

  const ProductScreen({Key? key, required this.model, required this.storeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return Scaffold(
            appBar: whiteAppBarWidget(
              title: StringsManager.product,
              context: context,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(ImageAssets.shareIcon),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: AppSize.s168,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            model.productImage!,
                            height: AppSize.s168,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.accent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(AppSize.s5),
                              color: ColorManager.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: ColorManager.accent,
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  model.productRate!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: ColorManager.grey4,
                                        fontWeight: FontWeightManager.medium,
                                        fontSize: FontSizeManager.s14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Center(
                      child: Text(
                        model.productName!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorManager.grey4,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      StringsManager.description,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManager.primary,
                            fontSize: AppSize.s16,
                            fontFamily: FontConstants.fontFamily,
                          ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),

                    ///todo
                    Text(
                      '''Product description will be here bla bla bla and bla
will be here bla bla will be here bla bla .
will be here bla bla will be here bla bla will be here.
will be here bla bla will be here bla bla 
 ''',
                      style: const TextStyle(
                        color: ColorManager.grey4,
                        fontSize: AppSize.s14,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    DriverWidget(),
                    Row(
                      children: [
                        Text(
                          StringsManager.brand,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          storeName,
                          style: const TextStyle(
                            color: ColorManager.grey4,
                            fontSize: AppSize.s14,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    Row(
                      children: [
                        Text(
                          StringsManager.price,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s16,
                                    fontFamily: FontConstants.fontFamily,
                                  ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "${model.productPrice!} EGP",
                          style: const TextStyle(
                            color: ColorManager.grey4,
                            fontSize: AppSize.s14,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                    DriverWidget(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // add to cart
                        Expanded(
                          child: cubit.isInCart
                              ? Row(
                                  children: [
                                    Container(
                                      height: AppSize.s32,
                                      width: AppSize.s32,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s10),
                                        color: ColorManager.grey4,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Text(
                                            '-',
                                            style: TextStyle(
                                              color: ColorManager.white,
                                              fontSize: AppSize.s22,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '1 Kg',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: ColorManager.primary,
                                                fontSize: AppSize.s16,
                                                fontFamily:
                                                    FontConstants.fontFamily,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: AppSize.s32,
                                      width: AppSize.s32,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s10),
                                        color: ColorManager.primaryLight,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: ColorManager.white,
                                            size: AppSize.s22,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : DefaultButtonWidget(
                                  onPressed: () {
                                    cubit.changeCartButton();
                                  },
                                  radius: AppSize.s10,
                                  color: ColorManager.primaryLight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.addToBasketIcon,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        StringsManager.addToCart,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: ColorManager.white,
                                              fontWeight:
                                                  FontWeightManager.medium,
                                              fontSize: FontSizeManager.s14,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.02,
                        ),

                        // favorite icon
                        Container(
                          height: AppSize.s32,
                          width: AppSize.s32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.primaryLight,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                cubit.changeFavoriteButton();
                              },
                              icon: Icon(
                                model.isAddToFavoraite!
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border,
                                color: model.isAddToFavoraite!
                                    ? ColorManager.red
                                    : ColorManager.white,
                                size: AppSize.s22,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        )
                      ],
                    ),
                    DriverWidget(),
                    Center(
                      child: Text(
                        StringsManager.similarProducts,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeightManager.regular,
                              color: ColorManager.greyDark,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    SizedBox(
                      height: AppSize.s100,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            ProductSimilarItemWidget(
                          name: 'Lanshon 1',
                          image: ImageAssets.lanshonOffer,
                          onTap: () {},
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: AppSize.s16,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s16,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
