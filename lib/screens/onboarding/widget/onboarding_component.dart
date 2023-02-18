import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingComponent extends StatelessWidget {
  final String imageURL, title, description;
  const OnboardingComponent(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! IMAGE
            Transform.scale(scale: 0.8.sp, child: SvgPicture.asset(imageURL)),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! TITLE
            Text(title,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! NOTE
            Text(description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppThemeColours.lightGrey,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center)
          ]);
}
