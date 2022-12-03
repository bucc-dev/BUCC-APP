//! ALAS! LET THE THEMING BEGIN!
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanionAppTheme {
  //! TEXT BUTTON STYLE
  static TextStyle textButtonStyle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: AppThemeColours.textButtonTextColour,
      fontSize: 14.0.sp);

  //! APP THEME
  static ThemeData get appTheme => ThemeData(
      //! HOW PAGES TRANSITION BETWEEN EACH OTHER
      //! ASSIGN ALL PLATFORMS TO TRANSITION USING THE ZOOM PAGE TRANSITION
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        for (final platform in TargetPlatform.values)
          platform: const ZoomPageTransitionsBuilder()
      }),

      //! OTHER COLOURS
      shadowColor: AppThemeColours.shadowColour,
      backgroundColor: AppThemeColours.backgroundColour,
      scaffoldBackgroundColor: AppThemeColours.scaffoldBackgroundColour,
      splashColor: AppThemeColours.splashColour,

      //! COLOUR SCHEME
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppThemeColours.accentColour),

      //! APP BAR
      appBarTheme: AppBarTheme(
          backgroundColor: AppThemeColours.appBackgroundColour,
          shadowColor: AppThemeColours.shadowColour,
          titleTextStyle: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 21.0.sp)),
      iconTheme:
          IconThemeData(color: AppThemeColours.iconColorBlack, size: 18.0.sp),

      //! TEXT THEMES
      textTheme: TextTheme(
              //! HEADER TEXTS
              headline1: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 21.0.sp,
                  color: AppThemeColours.headerColour),
              headline2: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0.sp,
                  color: AppThemeColours.headerColour),
              //! SUBHEADER TEXTS - TYPE 2
              headline3: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0.sp,
                  color: AppThemeColours.headerColour),

              //! BODY TEXT
              bodyText1: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: AppThemeColours.bodyTextColour, fontSize: 13.0.sp)
                  .copyWith(overflow: TextOverflow.visible),
              bodyText2: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: AppThemeColours.bodyTextColour,
                      fontSize: 12.0.sp)
                  .copyWith(overflow: TextOverflow.visible))
          .apply(fontSizeFactor: 1.sp),

      //! SNACK BAR
      snackBarTheme: SnackBarThemeData(
          elevation: 12.0.sp,
          backgroundColor: Colors.black,
          shape: const StadiumBorder(),
          contentTextStyle: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white)),

      //! BOTTOM SHEET THEME
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 12.0, backgroundColor: Colors.transparent),

      //! BUTTONS
      //! ELEVATED BUTTON
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 100.0.w),
              backgroundColor: AppThemeColours.elevatedButtonBGColour,
              textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.0.sp),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.r)))));
}

//! HOLDS ANY EXTRA APP COLOURS.
class AppThemeColours {
  //! BACKGROUNDS
  //! BACKGROUND
  static const Color backgroundColour = Colors.white;

  //! APP BAR BG COLOUR
  static const Color appBackgroundColour = Colors.white;

  //! SCAFFOLD BACKGROUND COLOUR
  static const scaffoldBackgroundColour = Colors.white;

  //! SHADOW COLOUR
  static Color shadowColour = const Color(0xFF556FCB).withOpacity(0.1);

  //! PRIMARY
  static const Color primaryColour = Color(0xFF556FCB);

  //! PRIMARY COLOUR WITH OPACITY
  static Color primaryColourWitOpacity =
      const Color(0xFF556FCB).withOpacity(0.1);

  //! SPLASH
  static Color splashColour = const Color(0xFF556FCB).withOpacity(0.1);

  //! ACCENT
  static Color accentColour = const Color(0xFF556FCB).withOpacity(0.3);

  //! ONBOARDING
  static const Color onboardingScreenBGColour = Color(0xFFFFE4DA);

  //! DOTTED BORDER CIRCLE
  static const Color dottedBorderCircle = Color(0xFF5F6DEF);

  //! BUTTONS
  //! TEXT BUTTON
  static const Color textButtonTextColour = Color(0xFF556FCB);

  //! ELEVATED BUTTON
  static const Color elevatedButtonBGColour = Color(0xFF556FCB);

  //! TEXT
  //!HEADER COLOURS
  static const headerColour = Color(0xFF313636);
  //! BODY TEXT COLOUR
  static const bodyTextColour = Color(0xFF313636);

  //! ICON COLOURS
  static const iconColorBlack = Color(0xFF333333);

  //! OTHER COLOURS
  static const Color lightGrey = Color(0xFF878787);
  static const Color red = Color(0xffFF3D00);
}
