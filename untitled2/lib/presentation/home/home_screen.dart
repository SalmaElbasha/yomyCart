import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shop/shop_screen.dart';
import '/presentation/home/cubit/home_cubit.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '../resources/colors_manager.dart';
import 'widgets/home_screen_body_widget.dart';
import 'widgets/home_screen_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeScreenApi(context: context),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetShopPageSearchSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopScreen(
                    storePageSearchSuccessDataModel:
                        state.storePageSearchSuccessModel,
                  ),
                ));
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.homePageApiModel != null
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  StringsManager.gizaEmbaba,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                DropdownButton(
                                  items: [],
                                  onChanged: (index) {},
                                  iconSize: AppSize.s40,
                                  elevation: 0,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: ColorManager.black),
                                ),
                                Text(
                                  StringsManager.welcomeAhmed,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: AppSize.s18),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: ColorManager.grey3,
                                    size: AppSize.s32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          HomeScreenHeaderWidget(cubit: cubit),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          HomeScreenBodyWidget(cubit: cubit),
                        ],
                      ),
                    ),
                  )
                : cubit.homePageApiErrorModel != null
                    ? Center(
                        child: Text(
                          cubit.homePageApiErrorModel!.messages.toString(),
                        ),
                      )
                    : cubit.homePageApiError404Model != null
                        ? Center(
                            child: Text(
                              cubit.homePageApiError404Model!.detail.toString(),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
          );
        },
      ),
    );
  }
}
