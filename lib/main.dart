import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/screens/auth/login/login_view.dart';
import 'package:bucc_app/screens/auth/register/register_screen.dart';
import 'package:bucc_app/screens/home_wrapper.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/theme/theme_preferences.dart';
import 'package:bucc_app/utils/register_model_adapters.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding/onboarding_view.dart';

Future<void> main() async {
  //! INITIALIZE WIDGETS BINDING
  WidgetsFlutterBinding.ensureInitialized();

  //! INITIALIZE DB AND REGISTER ADAPTERS
  await RegisterAdapters.initializeBDAndRegisterAdapters();

  //! ONBOARDING STARTS HERE - SHARED PREFERENCES FOR ONBOARDING SCREEN
  SharedPreferences appPreferences = await SharedPreferences.getInstance();

  //! CHECK IF ONBOARDING SCREEN HAS BEEN VISITED.
  final bool showHome = appPreferences.getBool("showHome") ?? false;

  //! RUN APP
  runApp(ProviderScope(child: BUCCCompanionApp(showHome: showHome)));
}

class BUCCCompanionApp extends ConsumerWidget {
  final bool showHome;
  const BUCCCompanionApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //! GET THE THEME MODE FROM REF
    String themeMode = ref.watch(themeModeProvider);

    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        //! 375 BY 812 - THAT'S THE LAYOUT GIVEN ON THE DESIGN BOARD
        designSize: const Size(375, 812),

        //! BASE WIDGET
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "BUCC Companion App",
            theme: CompanionAppTheme.appThemeLight,
            darkTheme: CompanionAppTheme.appThemeDark,
            themeMode: themeMode == ThemeModeEnum.light.toString()
                ? ThemeMode.light
                : themeMode == ThemeModeEnum.dark.toString()
                    ? ThemeMode.dark
                    : ThemeMode.system,

            //! SCROLL BEHAVIOR CLASS, ACCEPTING FOUR TYPES OF SCROLL DEVICES;
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
            home: showHome ? const RegisterScreen() : OnboardingView()));
  }
}
