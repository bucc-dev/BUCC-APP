import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/screens/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),

        //! BODY
        body: SafeArea(
            child: Padding(
                padding: AppScreenUtils.appMainPadding,
                child: Column(children: [
                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall,

                  Text("Sign up for a Companion Account",
                      style: Theme.of(context).textTheme.headline3),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! MATRIC NUMBER
                  const CustomTextField(hintText: "Matric Number or Email"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! PASSWORD
                  const CustomTextField(hintText: "Password"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! PASSWORD
                  const CustomTextField(hintText: "Confirm password"),

                  //! FORGOT PASSWORD
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot password?",
                              style: CompanionAppTheme.textButtonStyle
                                  .copyWith(fontSize: 11.0.sp)))),

                  const Spacer(),

                  ButtonComponent(
                      onPressed: () => AppNavigator.navigateToPage(
                          thePageRouteName: AppRoutes.verifyEmail,
                          context: context),
                      text: "Proceed"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  Text("By signing up, you agree to our",
                      style: Theme.of(context).textTheme.bodyText2),

                  RichText(
                      text: TextSpan(
                          text: "Terms of Service",
                          style: CompanionAppTheme.textButtonStyle
                              .copyWith(fontSize: 11.0.sp),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          children: [
                        TextSpan(
                            text: " and ",
                            style: Theme.of(context).textTheme.bodyText2),
                        TextSpan(
                            text: "Privacy Policy",
                            style: CompanionAppTheme.textButtonStyle
                                .copyWith(fontSize: 11.0.sp),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall,

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //! NOTICE
                    const Text("Already have an account"),

                    //! SPACER
                    AppScreenUtils.horizontalSpaceSmall,

                    //! LOGIN
                    TextButton(
                        onPressed: () => AppNavigator.navigateToReplacementPage(
                            thePageRouteName: AppRoutes.login,
                            context: context),
                        child: Text("Sign in",
                            style: CompanionAppTheme.textButtonStyle))
                  ]),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium
                ]))));
  }
}
