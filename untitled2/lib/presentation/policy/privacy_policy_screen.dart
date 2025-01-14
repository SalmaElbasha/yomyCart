import 'package:flutter/material.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/white_app_bar_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBarWidget(
        title: StringsManager.privacyPolicy,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p30,
          top: AppPadding.p16,
        ),
        child: Text(
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type andscrambled it to make a type specimen book. 
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like 
Aldus PageMaker including Lorem Ipsum.''',
          style: const TextStyle(
            fontSize: AppSize.s15,
            fontWeight: FontWeightManager.bold,
            color: ColorManager.greyDark,
          ),
        ),
      ),
    );
  }
}
