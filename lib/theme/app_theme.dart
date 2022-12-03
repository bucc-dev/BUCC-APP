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

  //! APP THEME - LIGHT
  static ThemeData get appThemeLight => ThemeData(
      //! HOW PAGES TRANSITION BETWEEN EACH OTHER
      //! ASSIGN ALL PLATFORMS TO TRANSITION USING THE ZOOM PAGE TRANSITION
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        for (final platform in TargetPlatform.values)
          platform: const ZoomPageTransitionsBuilder()
      }),

      //! ENSURING THAT THE DENSITY OF ELEMENTS ACROSS THE APP, MATCHES THE PLATFORM
      visualDensity: VisualDensity.adaptivePlatformDensity,

      //! OTHER COLOURS
      shadowColor: AppThemeColours.shadowColour,
      backgroundColor: AppThemeColours.backgroundColour,
      scaffoldBackgroundColor: AppThemeColours.scaffoldBackgroundColour,
      splashColor: AppThemeColours.splashColour,

      //! COLOUR SCHEME
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          secondary: AppThemeColours.accentColour),

      //! APP BAR
      appBarTheme: AppBarTheme(
          backgroundColor: AppThemeColours.appBackgroundColour,
          shadowColor: AppThemeColours.shadowColour,
          titleTextStyle: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 21.0.sp)),

      //! BOTTOM NAV BAR
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppThemeColours.scaffoldBackgroundColour,
          unselectedIconTheme: IconThemeData(size: 16.0.sp),
          selectedIconTheme: IconThemeData(
              color: AppThemeColours.primaryColour, size: 18.0.sp),
          unselectedLabelStyle:
              TextStyle(color: Colors.black54, fontSize: 10.0.sp),
          selectedLabelStyle: TextStyle(
              color: AppThemeColours.primaryColour, fontSize: 12.0.sp),
          selectedItemColor: AppThemeColours.primaryColour,
          unselectedItemColor: Colors.black54),

      //! ICON THEME
      iconTheme: IconThemeData(
          color: AppThemeColours.iconsColourLightMode, size: 18.0.sp),

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
              bodyText1:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: AppThemeColours.bodyTextColour, fontSize: 13.0.sp)
                      .copyWith(overflow: TextOverflow.visible),
              bodyText2:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: AppThemeColours.bodyTextColour, fontSize: 12.0.sp)
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

  //!
  //!
  //!
  //! APP THEME - DARK
  //!
  static ThemeData get appThemeDark => ThemeData(
      //! HOW PAGES TRANSITION BETWEEN EACH OTHER
      //! ASSIGN ALL PLATFORMS TO TRANSITION USING THE ZOOM PAGE TRANSITION
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        for (final platform in TargetPlatform.values)
          platform: const ZoomPageTransitionsBuilder()
      }),

      //! ENSURING THAT THE DENSITY OF ELEMENTS ACROSS THE APP, MATCHES THE PLATFORM
      visualDensity: VisualDensity.adaptivePlatformDensity,

      //! OTHER COLOURS
      shadowColor: AppThemeColours.shadowColour,
      backgroundColor: AppThemeColours.backgroundColourDark,
      scaffoldBackgroundColor: AppThemeColours.scaffoldBackgroundColourDark,
      splashColor: AppThemeColours.splashColour,

      //! COLOUR SCHEME
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark, secondary: AppThemeColours.accentColour),

      //! APP BAR
      appBarTheme: AppBarTheme(
          backgroundColor: AppThemeColours.appBackgroundColourDark,
          shadowColor: AppThemeColours.shadowColour,
          titleTextStyle: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 21.0.sp)),

      //! BOTTOM NAV BAR
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppThemeColours.scaffoldBackgroundColourDark,
          unselectedIconTheme: IconThemeData(size: 16.0.sp),
          selectedIconTheme: IconThemeData(
              color: AppThemeColours.primaryColour, size: 18.0.sp),
          unselectedLabelStyle:
              TextStyle(color: Colors.black54, fontSize: 10.0.sp),
          selectedLabelStyle: TextStyle(
              color: AppThemeColours.primaryColour, fontSize: 12.0.sp),
          selectedItemColor: AppThemeColours.primaryColour,
          unselectedItemColor: Colors.white),

      //! ICONS
      iconTheme: IconThemeData(
          color: AppThemeColours.iconsColourDarkMode, size: 18.0.sp),

      //! TEXT THEMES
      textTheme: TextTheme(
              //! HEADER TEXTS
              headline1: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 21.0.sp,
                  color: AppThemeColours.headerColourDark),
              headline2: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0.sp,
                  color: AppThemeColours.headerColourDark),
              //! SUBHEADER TEXTS - TYPE 2
              headline3: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0.sp,
                  color: AppThemeColours.headerColourDark),

              //! BODY TEXT
              bodyText1:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: AppThemeColours.bodyTextColourDark, fontSize: 13.0.sp)
                      .copyWith(overflow: TextOverflow.visible),
              bodyText2:
                  GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: AppThemeColours.bodyTextColourDark, fontSize: 12.0.sp)
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
  static const Color backgroundColourDark = Color(0xFF313636);

  //! APP BAR BG COLOUR
  static const Color appBackgroundColour = Colors.white;
  static const Color appBackgroundColourDark = Color(0xFF313636);

  //! SCAFFOLD BACKGROUND COLOUR
  static const scaffoldBackgroundColour = Colors.white;
  static const Color scaffoldBackgroundColourDark = Color(0xFF313636);

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
  static const headerColourDark = Colors.white;

  //! BODY TEXT COLOUR
  static const bodyTextColour = Color(0xFF313636);
  static const bodyTextColourDark = Colors.white;

  //! ICON COLOURS
  static const iconsColourLightMode = Color(0xFF333333);
  static const iconsColourDarkMode = Colors.white;

  //! OTHER COLOURS
  static const Color lightGrey = Color(0xFF878787);
  static const Color red = Color(0xffFF3D00);
}
