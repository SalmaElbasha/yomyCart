import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled2/presentation/categories/cubit/categories_cubit.dart';
import '/models/product_category_page/product_category_page_success_model.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/values_manager.dart';

class CategoryNearestListItemWidget extends StatelessWidget {
  final NearestStoreDto model;

  const CategoryNearestListItemWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CategoriesCubit.get(context)
            .shopPageButtonPressed(context, model.storeId!);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            model.storeImage!,
            height: AppSize.s92,
            width: AppSize.s125,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: AppSize.s20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.storeName!,
                  style: const TextStyle(
                    fontSize: AppSize.s17,
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s1_5,
                ),
                // Text(
                //  model.category,
                //  style: const TextStyle(
                //    fontSize: AppSize.s15,
                //    fontWeight: FontWeightManager.bold,
                //    color: ColorManager.grey3,
                //  ),
                //),
                const SizedBox(
                  height: AppSize.s1_5,
                ),
                Text(
                  model.availability!,
                  style: const TextStyle(
                    fontSize: AppSize.s15,
                    fontWeight: FontWeightManager.bold,
                    color: ColorManager.grey3,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      initialRating: model.rate!.toDouble(),
                      minRating: 1,
                      itemSize: AppSize.s12,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ColorManager.accent,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.location_on,
                    //       color: ColorManager.primary,
                    //     ),
                    //     const SizedBox(
                    //       width: AppSize.s1_5,
                    //     ),
                    //     Text(
                    //       model.distance,
                    //       style: const TextStyle(
                    //         fontSize: AppSize.s15,
                    //         fontWeight: FontWeightManager.bold,
                    //         color: ColorManager.primary,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
