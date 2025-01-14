import 'package:flutter/material.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/guide_page_view_widget.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            child: GuidePageViewWidget(),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
            child: Text(
              StringsManager.skip,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorManager.accent,
                    fontSize: 20,
                  ),
            ),
          ),
          const SizedBox(
            height: AppSize.s70,
          ),
        ],
      ),
    );
  }
}
