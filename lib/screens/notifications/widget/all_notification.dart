import 'package:bucc_app/screens/notifications/widget/notification_item.dart';
import 'package:bucc_app/utils/app_fade_animation.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});
  static final List<String> _listOfSuggestedUsers = ["Test"];

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: AppScreenUtils.appMainPadding,
      physics: const NeverScrollableScrollPhysics(),
      child: Column(children: [
        //! TOPIC
        Align(
            alignment: Alignment.centerLeft,
            child: Text("New",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 11.0.sp, fontWeight: FontWeight.w700))),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! NOTIFICATIONS
        ...List.generate(
            3,
            (index) => AppFadeAnimation(
                delay: index == 0
                    ? 1.2
                    : index == 1
                        ? 1.4
                        : 1.6,
                child: NotificationItem(
                    isAComment: index.isEven,
                    imageURL: defaultUserImage,
                    index: index,
                    commentedOnYourPost: index.isOdd,
                    isAPost: index == 3,
                    isAnEvent: index == 4))),

        //! SPACER
        AppScreenUtils.verticalSpaceMedium,

        //! SUGGESTED USERS SECTION
        _listOfSuggestedUsers.isEmpty
            ? const SizedBox.shrink()
            : Align(
                alignment: Alignment.centerLeft,
                child: Text("Earlier today",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14.0.sp, fontWeight: FontWeight.w700))),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        ...List.generate(
            3,
            (index) => AppFadeAnimation(
                delay: index == 0
                    ? 1.2
                    : index == 1
                        ? 1.4
                        : 1.6,
                child: NotificationItem(
                    isAComment: false,
                    imageURL: defaultUserImage,
                    index: index,
                    commentedOnYourPost: false,
                    isAPost: index == 3,
                    isAnEvent: index == 4)))
      ]));
}
