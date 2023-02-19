import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final bool isAComment;
  final bool commentedOnYourPost;
  final bool isAnEvent;
  final bool isAPost;
  final int index;
  final String imageURL;

  const NotificationItem(
      {super.key,
      required this.isAComment,
      required this.commentedOnYourPost,
      required this.imageURL,
      required this.index,
      required this.isAnEvent,
      required this.isAPost});

  @override
  Widget build(BuildContext context) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 2.0.h),

      //! LEADING
      leading: CircleAvatar(
          radius: 21.0.r,
          backgroundColor: purple.withOpacity(0.2),
          child: CircleAvatar(
              radius: 18.0.r,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imageURL))),

      //! TITLE
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //! MAIN TITLE
        commentedOnYourPost
            ? Row(children: [
                //! NAME
                Text("Blessed Madukoma",
                    style: Theme.of(context).textTheme.bodyLarge),

                //! SPACER
                SizedBox(width: 5.0.w),

                //! ACTION
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Text(" commented on your post",
                            style: Theme.of(context).textTheme.bodyMedium)))
              ])
            : Row(children: [
                //! NAME
                Text("Fidelis Antigha ",
                    style: Theme.of(context).textTheme.bodyLarge),

                //! SPACER
                SizedBox(width: 5.0.w),

                //! ACTION
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Text(" replied your comment",
                            style: Theme.of(context).textTheme.bodyMedium)))
              ]),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! TIME
        Text("8:00 AM",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10.0.sp, color: Colors.grey.shade600))
      ]));
}
