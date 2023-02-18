import 'package:bucc_app/screens/notifications/notifications.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWrapperAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final int screenIndex;
  const HomeWrapperAppBar({Key? key, required this.screenIndex})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(screenIndex == 3 ? 55 : 65);

  @override
  Widget build(BuildContext context, WidgetRef ref) => AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      centerTitle: true,
      shadowColor: Theme.of(context).brightness == Brightness.light
          ? AppThemeColours.thirdGrey
          : Colors.white.withOpacity(0.1),
      title: screenIndex == 1
          ?

          //! NOTIFICATIONS
          Row(children: [
              //! PROFILE IMAGE
              CircleAvatar(
                  radius: 18.r,
                  backgroundColor: white,
                  backgroundImage: const AssetImage(defaultUserImage2)),

              //! SPACER
              AppScreenUtils.horizontalSpaceMedium,

              //! TITLE
              PopupMenuButton(
                  onSelected: (value) {
                    //! ALL NOTIFICATIONS
                    if (value == 1) {
                      //! SCROLL TO LOCATION
                      NotificationsScreen.notificationPageController
                          .animateToPage(0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                    }

                    //! EXECUTIVE NOTIFICATION
                    else if (value == 2) {
                      //! SCROLL TO LOCATION
                      NotificationsScreen.notificationPageController
                          .animateToPage(1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                    }

                    //! CLASS NOTIFICATION
                    else if (value == 3) {
                      //! SCROLL TO LOCATION
                      NotificationsScreen.notificationPageController
                          .animateToPage(2,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                    }
                  },
                  onCanceled: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.5, color: lightGrey.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(8.0)),
                  offset: Offset(85.w, 60.h),
                  elevation: 4.0,
                  constraints:
                      BoxConstraints(minHeight: 150.h, minWidth: 320.w),
                  padding: AppScreenUtils.appMainPadding,
                  itemBuilder: (context) => [
                        //! ALL NOTIFICATIONS
                        PopupMenuItem(
                            value: 1,
                            height: 45,
                            child: SizedBox(
                                width: double.infinity,
                                child: Text("All Notifications",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600)))),

                        //! EXECUTIVE NOTIFICATIONS
                        PopupMenuItem(
                            value: 2,
                            height: 45,
                            child: SizedBox(
                                width: double.infinity,
                                child: Text("Executive Notifications",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600)))),

                        //! CLASS NOTIFICATIONS
                        PopupMenuItem(
                            value: 3,
                            height: 45,
                            child: SizedBox(
                                width: double.infinity,
                                child: Text("Class Notifications",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600))))
                      ],

                  //! CONTENT
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Class Notifications",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0.sp)),

                        //!spacer
                        AppScreenUtils.horizontalSpaceSmall,

                        //! ICON
                        const Icon(Icons.arrow_drop_down_sharp, size: 12.0)
                      ]))
            ])
          :

          //! SETTINGS SCREEN
          screenIndex == 3
              ? Text("Profile",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600))
              :

              //! HOME SCREEN
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      //! PROFILE IMAGE
                      Container(
                          margin: EdgeInsets.only(top: 7.0.h),
                          height: 40.0.h,
                          width: 40.0.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                              image: DecorationImage(
                                  image: AssetImage(defaultUserImage2)))),

                      //! SPACER
                      AppScreenUtils.horizontalSpaceSmall,

                      //! SEARCH FIELD
                      Expanded(
                          child: Container(
                              height: 48.0.h,
                              margin: EdgeInsets.only(top: 10.0.h),
                              padding: EdgeInsets.symmetric(vertical: 2.0.h),
                              child: const CustomTextField(
                                  isHomeScreen: true,
                                  maxLines: 1,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search Companion")))
                    ]));
}
