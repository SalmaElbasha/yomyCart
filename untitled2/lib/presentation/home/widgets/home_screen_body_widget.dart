import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/home_list_item_widget.dart';
import '../cubit/home_cubit.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  const HomeScreenBodyWidget({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, bodyIndex) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cubit.homePageApiModel!.data![bodyIndex].siteSliderName!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        StringsManager.viewAll,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorManager.primaryLight),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HomeListItemWidget(
                      name: cubit.homePageApiModel!.data![bodyIndex]
                          .homePageDetailDto![index].sliderItemName!,
                      image: cubit.homePageApiModel!.data![bodyIndex]
                          .homePageDetailDto![index].sliderItemImage!,
                      address: cubit.homePageApiModel!.data![bodyIndex]
                          .homePageDetailDto![index].sliderItemLocation!,
                      rate: cubit.homePageApiModel!.data![bodyIndex]
                          .homePageDetailDto![index].rate!,
                      onTap: () {
                        cubit.getShopPageSearchButtonPressed(
                          context,
                          cubit.homePageApiModel!.data![bodyIndex]
                              .homePageDetailDto![index].sliderItemId!,
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  itemCount: cubit.homePageApiModel!.data![bodyIndex]
                      .homePageDetailDto!.length,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: HomeCubit.get(context).homePageApiModel!.data!.length);
  }
}
