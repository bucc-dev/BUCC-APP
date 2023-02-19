import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/screens/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: CustomAppBar(onPressed: () => Navigator.of(context).pop()),

      //! BODY
      body: SafeArea(
          child: Padding(
              padding: AppScreenUtils.appMainPadding,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //! SPACER
                    const Spacer(),

                    //! IMAGE
                    SvgPicture.asset(verifyEmailImage),

                    //! SPACER
                    AppScreenUtils.verticalSpaceLarge,

                    //! NOTE 1
                    Text("Check your email to verify",
                        style: Theme.of(context).textTheme.displaySmall),

                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium,

                    /* Text("Please click the link in the verification email sent",
                        style: Theme.of(context).textTheme.bodyMedium), */

                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                "Please click the link in the verification email sent to ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppThemeColours.lightGrey),
                            children: [
                              TextSpan(
                                  text: "nginikosi@yahoo.com. ",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              TextSpan(
                                  text: "If this email address is",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppThemeColours.lightGrey)),
                              TextSpan(
                                  text: "incorrect you can edit ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppThemeColours.lightGrey)),
                              TextSpan(
                                  text: "here",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppThemeColours.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ])),

                    //! SPACER
                    const Spacer(),

                    //! DIDN'T RECEIVE IT
                    RichText(
                        text: TextSpan(
                            text: "Didn't receive it?",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                          TextSpan(
                              text: " Resend email",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppThemeColours.lightGrey)),
                          TextSpan(
                              text: " or",
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text: " contact support",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppThemeColours.lightGrey))
                        ])),

                    //! TEXT BUTTON
                    TextButton(
                        onPressed: () =>
                            AppNavigator.navigateToAndRemoveAllPreviousScreens(
                                thePageRouteName: AppRoutes.register,
                                context: context),
                        child: Text("Use another account",
                            style: CompanionAppTheme.textButtonStyle)),

                    //! BUTTON
                    ButtonComponent(
                        onPressed: () => AppNavigator.navigateToPage(
                            thePageRouteName: AppRoutes.verifyCode,
                            context: context),
                        text: "Next"),

                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium
                  ]))));
}
