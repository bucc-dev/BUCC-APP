import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostHeader extends StatelessWidget {
  final int index;
  const PostHeader({super.key, required this.index});

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 22.0.w),
      child: Column(children: [
        Row(children: [
          //! USER IMAGE
          CircleAvatar(
              radius: 24.0.r,
              backgroundColor: purple.withOpacity(0.1),
              backgroundImage: AssetImage(
                  index.isOdd ? defaultUserImage : defaultUserImage3)),

          //! SPACER
          AppScreenUtils.horizontalSpaceSmall,

          //! OWNER OF POST, POSITION AND TIME
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //! OWNER
            Text("Blessed Madukoma",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.8.h,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500)),

            //! POSITION
            Text("Bucc president",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 11.0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppThemeColours.lightGrey)),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! DATE
            Text("3w",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 10.0.sp, color: AppThemeColours.lightGrey))
          ])
        ]),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! BRIEF POST DESCRIPTION
        Text(
            "Great BUCC! \n\nWe’re having a BUCC BI - Weekly jogging for females, the first of it’s kind.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 1.3.h, fontWeight: FontWeight.w500, fontSize: 12.0.sp))
      ]));
}
