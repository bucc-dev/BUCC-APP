import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingLoginView extends StatelessWidget {
  const OnBoardingLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child: Padding(
              padding: AppScreenUtils.appMainPadding,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! IMAGE
                    Expanded(
                        flex: 3, child: SvgPicture.asset(onboardingImage1)),

                    //! SPACER
                    const Spacer(),

                    //! BUCC
                    Center(
                        child: RichText(
                            text: const TextSpan(
                                text: "BU",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: black),
                                children: [
                          TextSpan(
                              text: "CC",
                              style: TextStyle(
                                  color: purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0))
                        ]))),

                    //! COMPANION
                    RichText(
                        text: const TextSpan(
                            text: "COMP",
                            style: TextStyle(
                                color: purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                            children: [
                          TextSpan(
                              text: "ANION",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: black))
                        ])),

                    //! SPACER
                    AppScreenUtils.verticalSpaceLarge,

                    //! AUTH BUTTONS
                    ButtonComponent(
                        onPressed: () => AppNavigator.navigateToPage(
                            thePageRouteName: AppRoutes.register,
                            context: context),
                        text: "Register"),

                    //! SPACER
                    AppScreenUtils.verticalSpaceSmall,

                    ButtonComponent(
                        onPressed: () => AppNavigator.navigateToPage(
                            thePageRouteName: AppRoutes.login,
                            context: context),
                        text: "Login"),

                    AppScreenUtils.verticalSpaceMedium
                  ]))));
}
