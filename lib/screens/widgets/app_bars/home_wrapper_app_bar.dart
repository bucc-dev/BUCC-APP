// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bucc_app/screens/notifications/notifications.dart';
import 'package:bucc_app/screens/planner/planner.dart';
import 'package:bucc_app/services/model/event/event_model.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWrapperAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final ValueNotifier<int> currentPageIndex;
  const HomeWrapperAppBar({Key? key, required this.currentPageIndex})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  //! USED TO CONTAIN THE CURRENT VALUE OF THE NOTIFICATION PAGE BEING DISPLAYED
  static final ValueNotifier<int> currentNotificationValue = ValueNotifier(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
        elevation: 0.5.h,
        automaticallyImplyLeading: false,
        centerTitle: true,
        shadowColor: Theme.of(context).brightness == Brightness.light
            ? AppThemeColours.thirdGrey
            : Colors.white.withOpacity(0.1),
        title: ValueListenableBuilder(
          valueListenable: currentPageIndex,
          builder: (context, value, child) => currentPageIndex.value == 0
              ?
              //! HOME SCREEN
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      //! PROFILE IMAGE
                      Container(
                          margin: EdgeInsets.only(top: 10.0.h),
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
                    ])
              :

              //! NOTIFICATIONS PAGE
              currentPageIndex.value == 1
                  ?
                  //! NOTIFICATIONS
                  Row(children: [
                      //! PROFILE IMAGE
                      Container(
                          margin: EdgeInsets.only(top: 10.0.h),
                          height: 40.0.h,
                          width: 40.0.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                              image: DecorationImage(
                                  image: AssetImage(defaultUserImage2)))),

                      //! SPACER
                      AppScreenUtils.horizontalSpaceSmall,

                      //! TITLE
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 10.0.h),
                              padding: EdgeInsets.symmetric(vertical: 2.0.h),
                              alignment: Alignment.center,
                              child: ValueListenableBuilder(
                                  valueListenable: currentNotificationValue,
                                  builder: (context, value, child) =>
                                      PopupMenuButton(
                                          onSelected: (value) {
                                            //! SET PAGE VALUE
                                            currentNotificationValue.value =
                                                value as int;

                                            //! ALL NOTIFICATIONS
                                            if (value == 1) {
                                              //! SHOW ALL NOTIFICATIONS
                                              NotificationsScreen
                                                  .currentPage.value = 0;
                                            }

                                            //! EXECUTIVE NOTIFICATION
                                            else if (value == 2) {
                                              //! SHOW EXECUTIVE NOTIFICATIONS SCREEN
                                              NotificationsScreen
                                                  .currentPage.value = 1;
                                            }

                                            //! CLASS NOTIFICATION
                                            else if (value == 3) {
                                              //! SHOW CLASS NOTIFICATION SCREEN
                                              NotificationsScreen
                                                  .currentPage.value = 2;
                                            }
                                          },
                                          onCanceled: () {},
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.5,
                                                  color: lightGrey
                                                      .withOpacity(0.1)),
                                              borderRadius:
                                                  BorderRadius.circular(8.0.r)),
                                          offset: Offset(0.0.w, 50.h),
                                          elevation: 12.0.h,
                                          shadowColor: AppThemeColours.lightBlue
                                              .withOpacity(0.2),
                                          constraints: BoxConstraints(
                                              minHeight: 150.h,
                                              minWidth: 320.w),
                                          padding:
                                              AppScreenUtils.appMainPadding,
                                          itemBuilder: (context) => [
                                                //! ALL NOTIFICATIONS
                                                PopupMenuItem(
                                                    value: 1,
                                                    height: 55,
                                                    child: NotificationPopUpMenuItem(
                                                        title:
                                                            "All Notifications",
                                                        itemBgColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    1
                                                                ? const Color(
                                                                    0XFFE5EBFF)
                                                                : null,
                                                        itemColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    1
                                                                ? AppThemeColours
                                                                    .lightBlue
                                                                : null)),

                                                //! EXECUTIVE NOTIFICATIONS
                                                PopupMenuItem(
                                                    value: 2,
                                                    height: 55,
                                                    child: NotificationPopUpMenuItem(
                                                        title:
                                                            "Executive Notifications",
                                                        itemBgColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    2
                                                                ? const Color(
                                                                    0XFFE5EBFF)
                                                                : null,
                                                        itemColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    2
                                                                ? AppThemeColours
                                                                    .lightBlue
                                                                : null)),

                                                //! CLASS NOTIFICATIONS
                                                PopupMenuItem(
                                                    value: 3,
                                                    height: 55,
                                                    child: NotificationPopUpMenuItem(
                                                        title:
                                                            "Class Notifications",
                                                        itemBgColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    3
                                                                ? const Color(
                                                                    0XFFE5EBFF)
                                                                : null,
                                                        itemColour:
                                                            currentNotificationValue
                                                                        .value ==
                                                                    3
                                                                ? AppThemeColours
                                                                    .lightBlue
                                                                : null))
                                              ],

                                          //! CONTENT
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Class Notifications",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14.0.sp)),

                                                //! SPACER
                                                SizedBox(width: 5.0.w),

                                                //! ICON
                                                const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: AppThemeColours
                                                        .darkGrey,
                                                    size: 21.0)
                                              ])))))
                    ])
                  :

                  //! PLANNER SCREEN
                  currentPageIndex.value == 2
                      ? Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //! ICON BUTTON
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.menu,
                                        size: 21.0.sp,
                                        color: AppThemeColours.darkGrey)),

                                //! SPACER
                                AppScreenUtils.horizontalSpaceMedium,

                                //! TITLE
                                Row(children: [
                                  Text("Planner",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 16.0.sp,
                                              fontWeight: FontWeight.w600)),

                                  //! SPACER
                                  SizedBox(width: 5.0.w),

                                  //! ICON
                                  const Icon(Icons.keyboard_arrow_down_outlined,
                                      color: AppThemeColours.darkGrey,
                                      size: 21.0)
                                ]),

                                //! SPACER
                                AppScreenUtils.horizontalSpaceMedium,

                                //! TEXT BUTTON
                                InkWell(
                                    onTap: () {
                                      for (EventModel event
                                          in setOfEventsToBeDeleted.value) {
                                        listOfEvents.value.remove(event);
                                      }

                                      setOfEventsToBeDeleted.value.clear();
                                      listOfEvents.notifyListeners();
                                      setOfEventsToBeDeleted.notifyListeners();
                                    },
                                    splashColor:
                                        AppThemeColours.red.withOpacity(0.05),
                                    child: Container(
                                        width: 45.0.w,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Delete",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 12.0.sp,
                                                    color: AppThemeColours.red,
                                                    fontWeight:
                                                        FontWeight.w500))))
                              ]))
                      :

                      //! SETTINGS SCREEN
                      Padding(
                          padding: EdgeInsets.only(top: 10.0.h),
                          child: Text("Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.w600))),
        ));
  }
}

class NotificationPopUpMenuItem extends ConsumerWidget {
  final String title;
  final Color? itemBgColour;
  final Color? itemColour;
  const NotificationPopUpMenuItem(
      {required this.title, this.itemColour, this.itemBgColour, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 21.0.w),
        decoration: BoxDecoration(
            color: itemBgColour, borderRadius: BorderRadius.circular(8.0.r)),
        child: Text(title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12.0.sp,
                color: itemColour,
                fontWeight: FontWeight.w600)));
  }
}
