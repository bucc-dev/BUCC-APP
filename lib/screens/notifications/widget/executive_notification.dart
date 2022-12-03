import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExecutiveNotifications extends StatelessWidget {
  const ExecutiveNotifications({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: AppScreenUtils.appMainPadding,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //! IMAGE
        Image.asset(noNotification, fit: BoxFit.contain),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! TEXT
        Text("No Executive Notifications",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18.0.sp, color: AppThemeColours.primaryColour))
      ]));
}
