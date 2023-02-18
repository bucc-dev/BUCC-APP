import 'package:bucc_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onPressed;
  const CustomAppBar({Key? key, this.onPressed}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
      elevation: 1.0.sp,
      centerTitle: true,
      shadowColor: AppThemeColours.lightGrey,
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back, color: AppThemeColours.darkGrey)),

      //! TITLE
      title: RichText(
          text: TextSpan(
              text: "BU",
              style: Theme.of(context).textTheme.displayMedium,
              children: [
            TextSpan(
                text: "CC ",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppThemeColours.primaryColour)),

            //! COMP
            TextSpan(
                text: "COMP",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppThemeColours.primaryColour)),

            //! ANION3
            TextSpan(
                text: "ANION", style: Theme.of(context).textTheme.displayMedium)
          ])));
}
