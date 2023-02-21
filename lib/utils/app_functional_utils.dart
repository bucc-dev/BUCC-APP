import 'dart:async';
import 'dart:io';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // ignore: body_might_complete_normally_nullable
  static Future<File?> pickImage({required String userChoice}) async {
    try {
      //! INITIALIZE PICKER THEN; PICK IMAGE OR TAKE PHOTO
      final XFile? imageOrPhoto = await ImagePicker().pickImage(
          source: userChoice.toLowerCase() == "take image"
              ? ImageSource.camera
              : ImageSource.gallery);

      File? imageTemp =
          imageOrPhoto?.path != null ? File(imageOrPhoto!.path) : null;

      return imageTemp;
    } on PlatformException catch (e) {
      "Failed to pick images: $e".log();
    }
  }

//!
//! SHOW BANNER
  static showBanner(
      {required BuildContext context,
      required String theMessage,
      required NotificationType theType}) {
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
        elevation: 4.0.sp,
        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 25.0.w),
        forceActionsBelow: true,
        backgroundColor: theType == NotificationType.failure
            ? Colors.red.shade400
            : theType == NotificationType.success
                ? Colors.green.shade400
                : purple,

        //! THE CONTENT
        content: Text(theMessage,
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w500, color: white)),

        //! ACTIONS - DISMISS BUTTON
        actions: [
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      padding: const EdgeInsets.all(12.0),
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.white24,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.0.r))),
                  child: Text("Dismiss",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: white))))
        ]));

    //! DISMISS AFTER 2 SECONDS
    Timer(const Duration(milliseconds: 2500),
        () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner());
  }

//! FETCH MONTH NAME
  static String getMonth({required DateTime dateTime}) {
    String theMonth = "";
    switch (dateTime.month) {
      case 1:
        theMonth = "January";
        return theMonth;
      case 2:
        theMonth = "February";
        return theMonth;
      case 3:
        theMonth = "March";
        return theMonth;
      case 4:
        theMonth = "April";
        return theMonth;
      case 5:
        theMonth = "May";
        return theMonth;
      case 6:
        theMonth = "June";
        return theMonth;
      case 7:
        theMonth = "July";
        return theMonth;
      case 8:
        theMonth = "August";
        return theMonth;
      case 9:
        theMonth = "September";
        return theMonth;
      case 10:
        theMonth = "October";
        return theMonth;
      case 11:
        theMonth = "November";
        return theMonth;
      case 12:
        theMonth = "December";
        return theMonth;

      //! DEFAULT VALUES
      default:
        theMonth = "Could not fetch the month";
        return theMonth;
    }
  }

  //!
  //! SHARED PREF
  static Future<void> saveShowHomePref() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("showHome", true);
  }

  //!
  //! GET PRIORITY COLOUR
  static Color getPriorityColour({required int priorityIndex}) =>
      priorityIndex == 0
          ? AppThemeColours.red
          : priorityIndex == 1
              ? Colors.amber.shade700
              : priorityIndex == 2
                  ? Colors.teal.shade300
                  : Colors.grey.shade600;
}
