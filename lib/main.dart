import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/screens/home_wrapper.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'screens/onboarding/onboarding_view.dart';

Future<void> main() async {
  //! INITIALIZE WIDGETS BINDING
  WidgetsFlutterBinding.ensureInitialized();

  //! ONBOARDING STARTS HERE - SHARED PREFERENCES FOR ONBOARDING SCREEN
  SharedPreferences appPreferences = await SharedPreferences.getInstance();

  //! CHECK IF ONBOARDING SCREEN HAS BEEN VISITED.
  final bool showHome = appPreferences.getBool("showHome") ?? false;

  runApp(ProviderScope(child: BUCCCompanionApp(showHome: showHome)));
}

//! THIS IS USED TO INITIALIZE APP RESOURCES, WHILE THE ONBOARDING SCREEN IS LOADING.

class BUCCCompanionApp extends StatelessWidget {
  final bool showHome;
  const BUCCCompanionApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375,
          812), //! 375 BY 812 - THAT'S THE LAYOUT GIVEN ON THE DESIGN BOARD

      //! BASE WIDGET
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "BUCC Companion App",
          theme: CompanionAppTheme.appTheme,

          //! SCROLL BEHAVIOUR CLASS, ACCEPTING ONLY TWO TYPES OF SCROLL DEVICES;
          //! MOUSE AND TOUCH.
          scrollBehavior: const MaterialScrollBehavior()
              .copyWith(scrollbars: false, dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          }),

          //! ROUTING
          onGenerateRoute: (settings) =>
              AppNavigator.generateRoute(routeSettings: settings),

          //! HOME
          home: showHome ? const HomeWrapper() : const OnboardingView()));
}
