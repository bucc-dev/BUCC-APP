import 'package:bucc_app/screens/home/latest_activity/widget/comments_page.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/post_header.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatelessWidget {
  final int index;
  const PostWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) => Container(
      height: 600.h,
      width: double.infinity.w,
      margin: EdgeInsets.only(bottom: 12.0.h),
      child: Column(children: [
        //! HEADER
        PostHeader(index: index),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! IMAGE
        Expanded(child: Image.asset(defaultPostImage, fit: BoxFit.fill)),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! BASE
        Padding(
            padding: AppScreenUtils.appMainPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //! ACTION ICONS
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                //! LIKE BUTTON
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.favorite_outline)),

                //! SPACER
                AppScreenUtils.horizontalSpaceSmall,

                //! COMMENT BUTTON
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.comment_outlined))
              ]),

              //! LIKED BY
              Text("Liked by Blessing Madukoma and 30 others",
                  style: Theme.of(context).textTheme.bodyText1),

              //! VIEW ALL COMMENTS
              TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CommentsPage())),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text("View all 10 comments",
                      style: CompanionAppTheme.textButtonStyle
                          .copyWith(fontSize: 12.0.sp)))
            ]))
      ]));
}
