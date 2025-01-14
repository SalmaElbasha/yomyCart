import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../cubit/home_cubit.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: cubit.homePageApiModel!.data![0].homePageDetailDto!
              .map(
                (e) => InkWell(
                  onTap: () {
                    cubit.getShopPageSearchButtonPressed(
                        context, e.sliderItemId!);
                  },
                  child: Image.network(
                    e.sliderItemImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.2,
            autoPlay: true,
            initialPage: 0,
            reverse: false,
            enlargeCenterPage: true,
            clipBehavior: Clip.antiAlias,
            // enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, page) {
              cubit.changeIndicatorIndex(index.toDouble());
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AnimatedSmoothIndicator(
          activeIndex: cubit.indicatorIndex.toInt(),
          count: cubit.homePageApiModel!.data![0].homePageDetailDto!.length,
          effect: const WormEffect(
            dotColor: ColorManager.grey2,
            activeDotColor: ColorManager.primaryLight,
            type: WormType.normal,
            strokeWidth: AppSize.s4,
            dotHeight: AppSize.s16,
            dotWidth: AppSize.s16,
            spacing: AppSize.s10,
          ),
        ),
      ],
    );
  }
}
