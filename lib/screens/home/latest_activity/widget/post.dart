import 'package:bucc_app/screens/home/latest_activity/widget/comments_page.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/post_header.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/theme/theme_preferences.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends ConsumerWidget {
  final int index;
  const PostWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
      height: 630.h,
      width: double.infinity.w,
      child: Column(children: [
        //! HEADER
        PostHeader(index: index),

        //! IMAGE
        Expanded(child: Image.asset(defaultPostImage, fit: BoxFit.fill)),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! BASE
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 22.0.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //! ACTION ICONS
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //! LIKE BUTTON
                InkWell(
                    onTap: () {}, child: const Icon(Icons.favorite_outline)),

                //! SPACER
                AppScreenUtils.horizontalSpaceSmall,

                //! COMMENT BUTTON
                InkWell(onTap: () {}, child: const Icon(Icons.comment_outlined))
              ]),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              //! LIKED BY NOTICE
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Liked by ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12.0.sp),
                      children: [
                        TextSpan(
                            text: "Blessing Madukoma",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12.0.sp),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                            text: " and ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextSpan(
                            text: "30 others",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12.0.sp),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),

              //! VIEW ALL COMMENTS
              Consumer(builder: (context, ref, child) {
                String themeMode =
                    ref.read(themeModeProvider.notifier).theCurrentThemeMode;

                themeMode = themeMode.toLowerCase().split(".").last;
                return TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const CommentsPage())),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text("View all 10 comments",
                        style: CompanionAppTheme.textButtonStyle.copyWith(
                            fontSize: 12.0.sp,
                            color: themeMode == "light"
                                ? AppThemeColours.darkGrey
                                : themeMode == "dark"
                                    ? AppThemeColours.thirdGrey
                                    : AppThemeColours.lightGrey)));
              })
            ]))
      ]));
}
