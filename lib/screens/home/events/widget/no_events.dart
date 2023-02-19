import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoEventsScheduled extends ConsumerWidget {
  const NoEventsScheduled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/Images/no_event_scheduled.png", scale: 1.1.sp),

        //! SPACER
        AppScreenUtils.verticalSpaceMedium,

        //! TEXT
        Text("No events scheduled",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w600,
                color: AppThemeColours.lightBlue))
      ]);
}
