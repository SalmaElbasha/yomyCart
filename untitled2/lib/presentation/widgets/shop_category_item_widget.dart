import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ShopCategoryItemWidget extends StatelessWidget {
  final String image;
  final String text;
  bool isTaped;

  ShopCategoryItemWidget({
    super.key,
    required this.image,
    required this.text,
    required this.isTaped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isTaped = !isTaped;
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                image,
                height: 48,
                width: 48,
                //  color: isTaped ? ColorManager.white : ColorManager.grey4,
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          Text(
            text,
            style: TextStyle(
              color: isTaped ? ColorManager.accent : ColorManager.grey4,
              fontSize: AppSize.s14,
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.fontFamily,
            ),
          )
        ],
      ),
    );
  }
}
