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
      padding: AppScreenUtils.appMainPadding,
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
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14.0.sp)),

            //! POSITION
            Text("Bucc president",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 11.0.sp)),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! DATE
            Text("3w",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 10.0.sp))
          ])
        ]),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! BRIEF POST DESCRIPTION
        Text(
            "Great BUCC! \n\nWe’re having a BUCC BI - Weekly jogging for females, the first of it’s kind.",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 12.0.sp))
      ]));
}
