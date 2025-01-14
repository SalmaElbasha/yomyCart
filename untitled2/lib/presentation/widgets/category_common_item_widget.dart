import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled2/models/product_category_page/product_category_page_success_model.dart';
import 'package:untitled2/presentation/categories/cubit/categories_cubit.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/values_manager.dart';

class CategoryCommonListItemWidget extends StatelessWidget {
  final Data model;

  const CategoryCommonListItemWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CategoriesCubit.get(context)
            .shopPageSearchButtonPressed(context, model.categoryId!);
      },
      child: SizedBox(
        height: AppSize.s152,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                model.categoryImage!,
                width: AppSize.s173,
                height: AppSize.s76,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.categoryName!,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        '${model.rate}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        ImageAssets.mapIcon,
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      // Text(
                      //   model.,
                      //   style: Theme.of(context).textTheme.caption,
                      // ),
                    ],
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
