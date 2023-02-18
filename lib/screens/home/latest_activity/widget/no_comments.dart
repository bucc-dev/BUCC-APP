import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoComments extends ConsumerWidget {
  const NoComments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/Images/no_comment.png", scale: 1.2.sp),

        //! SPACER
        AppScreenUtils.verticalSpaceMedium,

        //! TEXT
        Text("No Comments",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: AppThemeColours.lightBlue))
      ]);
}
