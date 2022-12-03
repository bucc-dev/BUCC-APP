//! THIS FILE HANDLES ALL UTILS THAT ASSISTS WITH UI ALIGNMENT.
//! PADDINGS, SPACERS ...
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreenUtils {
  //! MAIN PADDING
  static EdgeInsets appMainPadding =
      EdgeInsets.only(top: 6.0.h, left: 12.0.w, right: 12.0.w);

  //! SPACERS
  //! HORIZONTAL SPACES
  static Widget horizontalSpaceSmall = SizedBox(width: 10.0.w);
  static Widget horizontalSpaceMedium = SizedBox(width: 30.0.w);
  static Widget horizontalSpaceLarge = SizedBox(width: 30.0.w);

  //! VERTICAL SPACES
  static Widget verticalSpaceSmall = SizedBox(height: 10.0.h);
  static Widget verticalSpaceMedium = SizedBox(height: 30.0.h);
  static Widget verticalSpaceLarge = SizedBox(height: 50.0.h);
}
