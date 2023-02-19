import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestedUserItem extends StatelessWidget {
  final bool isFollowing;
  final String imageURL;

  const SuggestedUserItem(
      {super.key, required this.isFollowing, required this.imageURL});

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 12.0.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //! LEADING
        CircleAvatar(
            radius: 25.0,
            backgroundColor: const Color(0XFF5F6DEF).withOpacity(0.1),
            child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(imageURL))),

        //! TITLE
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //! MAIN TITLE
          Text("Ekaneoffiong \nstarted following you",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.w600)),
          //! SPACER
          AppScreenUtils.verticalSpaceSmall,

          //! TIME
          Text("8:00 AM",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 10.0.sp, color: Colors.grey.shade600))
        ]),

        //! SPACER
        AppScreenUtils.horizontalSpaceSmall,

        //! FOLLOW BUTTON
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                backgroundColor: AppThemeColours.primaryColour,
                elevation: 2.0,
                shadowColor: AppThemeColours.shadowColour),
            child: Text("Follow",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w600))),

        //! CANCEL BUTTON
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {}, //! TODO: REMOVE USER FOM SUGGESTED LIST
            icon: const Icon(Icons.close, size: 14.0, color: Colors.black45))
      ]));
}
