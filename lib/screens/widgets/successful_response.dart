import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulResponse extends StatelessWidget {
  final String theMessage;
  const SuccessfulResponse({super.key, required this.theMessage});

  @override
  Widget build(BuildContext context) => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            width: 90.0.w,
            height: 90.0.h,
            decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                shape: BoxShape.circle,
                border:
                    Border.all(width: 4.0.sp, color: const Color(0xFF22BC44))),
            child: Icon(Icons.done,
                size: 42.0.sp, color: const Color(0xFF22BC44))),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! MESSAGE
        Text(theMessage,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 18.0.sp, fontWeight: FontWeight.w600))
      ]));
}
