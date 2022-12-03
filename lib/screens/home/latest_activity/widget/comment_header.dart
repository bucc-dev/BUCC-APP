import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentPageHeader extends StatelessWidget {
  const CommentPageHeader({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppScreenUtils.appMainPadding,
      child: Row(children: [
        //! USER IMAGE
        CircleAvatar(
            radius: 24.0.r,
            backgroundColor: purple.withOpacity(0.1),
            backgroundImage: const AssetImage(defaultUserImage)),

        //! SPACER
        AppScreenUtils.horizontalSpaceSmall,

        //! BRIEF POST DESCRIPTION
        Text(
            "Great BUCC! \n\nWe’re having a BUCC BI - Weekly jogging \nfor females, the first of it’s kind.",
            overflow: TextOverflow.visible,
            maxLines: 10,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(height: 1.3.h, fontSize: 12.0.sp))
      ]));
}
