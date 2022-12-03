import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AppFunctionalUtils {
  //! SHOW DIALOGUE
  static showAppDialogBox(
          {required BuildContext theBuildContext,
          required Widget child,
          required double width,
          required double height}) =>
      showGeneralDialog(
          //!SHADOW EFFECT
          barrierColor: AppThemeColours.shadowColour,

          //! OTHER NEEDED PARAMETERS
          barrierDismissible: true,
          barrierLabel: "LABEL",
          context: theBuildContext,

          //! USE PROVIDED ANIMATION
          transitionBuilder: (context, a1, a2, widget) => Dialog(
              elevation: 12.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21)),
              child: SizedBox(
                  height: height * a1.value,
                  width: width * a1.value,
                  child: Padding(
                      padding: AppScreenUtils.appMainPadding,
                      child: SingleChildScrollView(child: child)))),

          //! ANIMATION DURATION
          transitionDuration: const Duration(milliseconds: 200),

          //! STILL DON'T KNOW WHAT THIS DOES, BUT IT'S REQUIRED
          pageBuilder: (context, animation1, animation2) => const Text(""));

  //! SHOW MODAL SHEET
  static showAppModalBottomSheet(
          {required BuildContext theBuildContext, required Widget child}) =>
      BottomSheet(
          onClosing: () => Navigator.of(theBuildContext).pop(),
          enableDrag: false,
          elevation: 0.0.h,
          constraints: BoxConstraints(
              maxWidth: double.infinity.w,
              maxHeight: MediaQuery.of(theBuildContext).size.height * 0.9.h),
          backgroundColor: Colors.grey.shade100.withOpacity(0.05),
          builder: (context) => AnimatedContainer(
              margin: EdgeInsets.all(12.w),
              duration: const Duration(seconds: 1),
              padding:
                  EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 21.0.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)),
              child: child));

  //! IMAGE PICKER
  static Future<XFile?> pickImage({required String userChoice}) async {
    //! INITIALIZE PICKER
    final ImagePicker picker = ImagePicker();

    //! PICK IMAGE OR TAKE PHOTO
    final XFile? imageOrPhoto = await picker.pickImage(
        source: userChoice.toLowerCase() == "take image"
            ? ImageSource.camera
            : ImageSource.gallery);

    return imageOrPhoto;
  }
}
