import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/auth/register/register_screen_passwords.dart';
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
  static final ValueNotifier<TextEditingController> _emailController =
      ValueNotifier(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(onPressed: () => Navigator.of(context).pop()),

        //! BODY
        body: SafeArea(
            child: Padding(
                padding: AppScreenUtils.appMainPadding,
                child: Column(children: [
                  //! SPACER
                  AppScreenUtils.verticalSpaceLarge,

                  Text("Sign up for a Companion Account",
                      style: Theme.of(context).textTheme.displaySmall),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! MATRIC NUMBER
                  CustomTextField(
                      controller: _emailController.value,
                      hintText: "Matric Number or Email"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! SPACER
                  const Spacer(),

                  //! NOTICE
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "By signing up, you agree to our ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 12.0.sp),
                          children: [
                            TextSpan(
                                text: "Terms of Service",
                                style: CompanionAppTheme.textButtonStyle
                                    .copyWith(fontSize: 12.0.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                            TextSpan(
                                text: " and \n\n",
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: "Privacy Policy\n",
                                style: CompanionAppTheme.textButtonStyle
                                    .copyWith(fontSize: 12.0.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {})
                          ])),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall,

                  //! PROCEED
                  ButtonComponent(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreenPassword(
                              userEmail: _emailController.value.value.text
                                  .trim()))) /* AppNavigator.navigateToPage(
                          thePageRouteName: AppRoutes.verifyEmail,
                          context: context) */
                      ,
                      text: "Proceed"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall,

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //! NOTICE
                    const Text("Already have an account? "),

                    //! LOGIN
                    TextButton(
                        onPressed: () => AppNavigator.navigateToReplacementPage(
                            thePageRouteName: AppRoutes.login,
                            context: context),
                        child: Text("Sign in",
                            style: CompanionAppTheme.textButtonStyle
                                .copyWith(fontSize: 12.0.sp)))
                  ]),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall
                ]))));
  }
}
