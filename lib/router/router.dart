import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/auth/register/register_screen.dart';
import 'package:bucc_app/screens/auth/verification/verify_code.dart';
import 'package:bucc_app/screens/home_wrapper.dart';
import 'package:bucc_app/screens/auth/login/login_view.dart';
import 'package:bucc_app/screens/onboarding/widget/onboarding_login_view.dart';
import 'package:bucc_app/screens/onboarding/onboarding_view.dart';
import 'package:bucc_app/screens/auth/verification/verify_email_view.dart';
import 'package:bucc_app/screens/planner/widgets/add_event.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  //! NAVIGATE TO A PAGE WITHOUT REPLACING THE PREVIOUS PAGE.
  static void navigateToPage(
          {required String thePageRouteName, required BuildContext context}) =>
      Navigator.of(context).pushNamed(thePageRouteName);

  //! NAVIGATE TO A PAGE AND REPLACE THE PREVIOUS PAGE
  static void navigateToReplacementPage(
          {required String thePageRouteName, required BuildContext context}) =>
      Navigator.of(context).pushReplacementNamed(thePageRouteName);

  //! PUSH NEW SCREEN AND REMOVE ALL SCREENS
  static void navigateToAndRemoveAllPreviousScreens(
          {required String thePageRouteName, required BuildContext context}) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(thePageRouteName, (route) => false);

  //! ROUTE GENERATOR
  static Route<dynamic> generateRoute({required RouteSettings routeSettings}) {
    switch (routeSettings.name) {
      //! ONBOARDING
      case AppRoutes.onboardingRoute:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const OnboardingView());

      //! ONBOARDING LOGIN
      case AppRoutes.onboardingLoginScreen:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const OnBoardingLoginView());

      //! USER TYPE VIEW
      // case AppRoutes.userTypeView:
      //   return _getPageRoute(
      //       routeName: routeSettings.name,
      //       args: routeSettings.arguments,
      //       view: const UserTypeView());

      //! LOGIN
      case AppRoutes.login:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const LoginView());

      //! REGISTER
      case AppRoutes.register:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const RegisterScreen());

      //! VERIFY EMAIL
      case AppRoutes.verifyEmail:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const VerifyEmailView());

      //! VERIFY CODE
      case AppRoutes.verifyCode:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const VerifyCode());

      //! HOME SCREEN WRAPPER
      case AppRoutes.homeScreenWrapper:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const HomeWrapper());

      //! ADD EVENT
      case AppRoutes.addEvent:
        return _getPageRoute(
            routeName: routeSettings.name,
            args: routeSettings.arguments,
            view: const AddEvent());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child:
                        Text('No route defined for ${routeSettings.name}'))));
    }
  }
}

//! GET A PAGE ROUTE
PageRoute _getPageRoute({String? routeName, Widget? view, Object? args}) =>
    MaterialPageRoute(
        settings: RouteSettings(name: routeName, arguments: args),
        builder: (_) => view!);
