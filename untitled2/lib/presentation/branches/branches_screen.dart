import 'package:flutter/material.dart';
import '../../models/brand_page/brand_page_success_odel.dart';
import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/font_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/home_list_item_widget.dart';
import '/presentation/widgets/shop_search_bar_widget.dart';
import '/presentation/widgets/white_app_bar_widget.dart';

class BranchesScreen extends StatelessWidget {
  final BrandPageSuccessModel brandPageSuccessModel;

  const BranchesScreen({Key? key, required this.brandPageSuccessModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(
        title: StringsManager.branches,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  brandPageSuccessModel.data![0].brandImage!,
                  width: double.infinity,
                  height: AppSize.s156,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    ImageAssets.shadoImage,
                    width: double.infinity,
                    height: AppSize.s156,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    brandPageSuccessModel.data![0].brandName!,
                    style: const TextStyle(
                      color: ColorManager.white,
                      fontWeight: FontWeightManager.medium,
                      fontFamily: FontConstants.fontFamily,
                      fontSize: AppSize.s20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p17,
                vertical: AppPadding.p8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //search
                  ShopSearchBarWidget(
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppPadding.p31,
                  ),

                  ///todo data
                  //branches
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: AppSize.s23,
                    mainAxisSpacing: AppSize.s32,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      brandPageSuccessModel.data![0].brandStoresDto!.length,
                      (index) => HomeListItemWidget(
                        onTap: () {},
                        address: StringsManager.haramGiza,
                        image: brandPageSuccessModel
                            .data![0].brandStoresDto![index].storeImage!,
                        name: brandPageSuccessModel
                            .data![0].brandStoresDto![index].storeName!,
                        rate: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
