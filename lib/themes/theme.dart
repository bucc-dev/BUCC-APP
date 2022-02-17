import 'package:flutter/material.dart';

//!APP COLOURS
const Color purple = Color(0xFF556FCB);

const Color lightGrey = Color(0xFF878787);

const Color black = Colors.black;

const Color red = Color(0xffFF3D00);

const Color white = Colors.white;

const Color blue = Color(0xff3940F8);

const Color studentProfileHeaderColour = Color(0xFFCFBCA6);

//!APP THEME
BUCCCompanionAppTheme currentThemeData = BUCCCompanionAppTheme();

class BUCCCompanionAppTheme {
  get getCurrentThemeData => theTheme;

  static ThemeData get theTheme {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
        },
      ),
      shadowColor: const Color(0xFF878787).withOpacity(0.2),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "montserrat",
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
        bodyText1: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5F5F5F),
          overflow: TextOverflow.ellipsis,
        ),
        bodyText2: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      /* colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: _theThemeColours.primaryColour,
        secondary: _theThemeColours.backgroundColour,
        tertiary: _theThemeColours.secondaryBackgroundColour,
      ),
       */
      iconTheme: const IconThemeData(color: Color(0xFF878787), size: 30.0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12.0),
          primary: _theThemeColours.elevatedButtonBackgroundColour,
          textStyle: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: _theThemeColours.textColour,
            fontSize: 18.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}

get theThemeColours => BUCCCompanionThemeColours();
BUCCCompanionThemeColours _theThemeColours = BUCCCompanionThemeColours();

class BUCCCompanionThemeColours {
  Color primaryColour = const Color(0xFFD10808);
  Color backgroundColour = const Color(0xFFD10100);
  Color secondaryBackgroundColour = const Color(0xFFE5E5E5);
  Color textColour = const Color(0xFF000000);
  Color elevatedButtonBackgroundColour = const Color(0xFF560606);
  Color containersBackgroundColour = const Color(0xFF565759);
}
