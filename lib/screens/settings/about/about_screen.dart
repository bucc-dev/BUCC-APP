import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/settings/widget/main_settings_item_widget.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});
  static const List<String> _mainAboutList = [
    "License",
    "Rate the app",
    "Privacy policy"
  ];

  static const List<IconData> _mainAboutListIcons = [
    Icons.workspace_premium_outlined,
    Icons.star_outline,
    Icons.privacy_tip_outlined
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
          elevation: 1.0.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(size: 21.0.sp),
          title: Text("About",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600))),

      //! BODY

      body: Padding(
          padding: AppScreenUtils.appMainPadding,
          child: Column(children: [
            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! OPTIONS
            ...List.generate(
                3,
                (index) => MainSettingsItemWidget(
                    index: index,
                    onTap: () => index == 1
                        ? AppNavigator.navigateToReplacementPage(
                            thePageRouteName: AppRoutes.changePassword,
                            context: context)
                        : index == 2
                            ? AppNavigator.navigateToReplacementPage(
                                thePageRouteName: AppRoutes.reportAProblem,
                                context: context)
                            : AppNavigator.navigateToReplacementPage(
                                thePageRouteName: AppRoutes.about,
                                context: context),
                    theIcon: _mainAboutListIcons.elementAt(index),
                    title: _mainAboutList.elementAt(index)))
          ])));
}
