import 'dart:io';
import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/settings/widget/main_settings_item_widget.dart';
import 'package:bucc_app/screens/settings/widget/social_media_widget.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/theme/theme_preferences.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with TickerProviderStateMixin {
  static const List<String> _mainSettingsList = [
    "Change profile picture",
    "Change password",
    "Report a problem",
    "About"
  ];

  static const List<IconData> _mainSettingsIcons = [
    Icons.person_outline_outlined,
    Icons.lock_outline,
    Icons.flag_outlined,
    Icons.more_horiz_outlined
  ];

  static const List<IconData> _socialMediaIcons = [
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.instagram
  ];

  static const List<String> _socialMediaHandles = [
    "@Bucc__official",
    "@bucckfacebook_help",
    "Bucc"
  ];

  //! VARIABLES
  final ValueNotifier<File?> _selectedUserImage = ValueNotifier(File(""));
  final ValueNotifier<bool> _imageHasValue = ValueNotifier(false);

  //! THEME
  late TabController _tabController;

  static const List<String> _themeOptions = [
    "Match system",
    "Light mode",
    "Dark mode"
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _themeOptions.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
        padding: AppScreenUtils.appMainPadding,
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //! IMAGE
          Align(
              alignment: Alignment.center,
              child: ValueListenableBuilder(
                  valueListenable: _selectedUserImage,
                  builder: (context, value, child) => Container(
                      height: 100.0.h,
                      width: 100.0.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2.0.sp, color: Colors.grey.shade600),
                          color: Colors.grey.shade200,
                          image: _imageHasValue.value
                              ? DecorationImage(
                                  image: FileImage(
                                      File(_selectedUserImage.value!.path)),
                                  fit: BoxFit.cover)
                              : const DecorationImage(
                                  image: AssetImage(defaultUserImage3),
                                  fit: BoxFit.contain))))),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          //! USER NAME
          Text("Oluchi Egboh",
              style: textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFF313636),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0.sp)),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          //! USER DETAILS - COURSE AND LEVEL
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //! COURSE
            Text("Software Engineering",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF313636),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp)),

            //! SPACER
            AppScreenUtils.horizontalSpaceSmall,

            //! DOT
            CircleAvatar(
                radius: 3.0.r, backgroundColor: const Color(0xFF4F4F4F)),

            //! SPACER
            AppScreenUtils.horizontalSpaceSmall,

            //! LEVEL
            Text("400L",
                style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF313636),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0.sp))
          ]),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          //! NOTICE
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Settings",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppThemeColours.lightGrey))),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          ...List.generate(
              4,
              (index) => MainSettingsItemWidget(
                  index: index,
                  onTap: () => index == 0
                      ?
                      //! PICK IMAGE
                      AppFunctionalUtils.pickImage(userChoice: "")
                          .then((value) {
                          value == null
                              ? {}
                              : {
                                  _selectedUserImage.value = value,
                                  _imageHasValue.value = true
                                };
                        })
                      : index == 1
                          ? AppNavigator.navigateToPage(
                              thePageRouteName: AppRoutes.changePassword,
                              context: context)
                          : index == 2
                              ? AppNavigator.navigateToPage(
                                  thePageRouteName: AppRoutes.reportAProblem,
                                  context: context)
                              : AppNavigator.navigateToPage(
                                  thePageRouteName: AppRoutes.about,
                                  context: context),
                  theIcon: _mainSettingsIcons.elementAt(index),
                  title: _mainSettingsList.elementAt(index))),

          //! SPACER
          AppScreenUtils.verticalSpaceMedium,

          //! NOTICE
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Social media",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppThemeColours.lightGrey))),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          ...List.generate(
              3,
              (index) => SocialMediaSettingsItemWidget(
                  theIcon: _socialMediaIcons.elementAt(index),
                  title: _socialMediaHandles.elementAt(index))),

          //! SPACER
          AppScreenUtils.verticalSpaceMedium,

          //! NOTICE
          Align(
              alignment: Alignment.centerLeft,
              child: Text("App Theme",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppThemeColours.lightGrey))),

          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          //!  CHANGE THEME
          SizedBox(
              height: 56.0.h,
              width: double.infinity.w,
              child: //! TAB NOTIFIER
                  Consumer(
                builder: (context, ref, child) {
                  String themeMode =
                      ref.watch(themeModeProvider.notifier).theCurrentThemeMode;

                  //! IF THE MODE IN LOWER CASE CONTAINS THE LAST PART OF THE THEME MODE ENUM
                  //! AFTER BEING SPLIT BY THE "." SEPARATOR, ANIMATE THE TAB TO THAT OPTION
                  //! THIS SHOWS THE USERS LAST SELECTED MODE.
                  for (var mode in _themeOptions) {
                    if (mode
                        .toLowerCase()
                        .contains(themeMode.split(".").last)) {
                      _tabController.animateTo(_themeOptions.indexOf(mode));
                    }
                  }
                  return TabBar(
                      controller: _tabController,
                      indicatorColor: AppThemeColours.primaryColour,
                      indicatorWeight: 2.0.h,
                      indicatorSize: TabBarIndicatorSize.tab,
                      physics: const BouncingScrollPhysics(),
                      onTap: (value) => ref
                          .read(themeModeProvider.notifier)
                          .toggle(
                              newThemeMode: ThemeModeEnum.values
                                  .elementAt(value)
                                  .toString()),
                      tabs: _themeOptions
                          .map((themeOption) => Center(
                              child: Text(themeOption,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 12.0.sp))))
                          .toList());
                },
              )),

          //! SPACER
          AppScreenUtils.verticalSpaceMedium,

          ButtonComponent(
              onPressed: () =>
                  AppNavigator.navigateToAndRemoveAllPreviousScreens(
                      thePageRouteName: AppRoutes.login, context: context),
              text: "Logout"),

          //! SPACER
          AppScreenUtils.verticalSpaceMedium
        ]));
  }
}
