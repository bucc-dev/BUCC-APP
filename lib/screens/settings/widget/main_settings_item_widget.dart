import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainSettingsItemWidget extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final IconData theIcon;
  final String title;
  const MainSettingsItemWidget(
      {super.key,
      required this.theIcon,
      required this.title,
      required this.index,
      this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 21.0.w),
          margin: EdgeInsets.symmetric(vertical: 4.0.h),
          decoration: BoxDecoration(
              color: const Color(0xFFE5EBFF),
              borderRadius: BorderRadius.circular(8.0.r)),
          child: Row(children: [
            //! ICON
            Icon(theIcon, size: 18.0.sp, color: Colors.black54),

            //! SPACER
            AppScreenUtils.horizontalSpaceSmall,

            Text(title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4F4F4F))),

            //! SPACER
            const Spacer(),

            //! SPACER
            Icon(Icons.arrow_forward_ios, size: 16.0.sp, color: Colors.black54)
          ])));
}
