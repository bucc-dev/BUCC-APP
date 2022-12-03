import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
      elevation: 4.0.sp,
      centerTitle: true,

      //! LEADING
      leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, size: 18.0.sp),
          color: black,
          onPressed: () => Navigator.of(context).pop()),

      //! TITLE
      title: RichText(
          text: TextSpan(
              text: "BU",
              style: Theme.of(context).textTheme.headline2,
              children: [
            TextSpan(
                text: "CC ",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppThemeColours.primaryColour)),

            //! COMP
            TextSpan(
                text: "COMP",
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: AppThemeColours.primaryColour)),

            //! ANION
            TextSpan(
                text: "ANION", style: Theme.of(context).textTheme.headline2)
          ])));
}
