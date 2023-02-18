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

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(onPressed: () => Navigator.of(context).pop()),
        resizeToAvoidBottomInset: false,

        //! BODY
        body: SafeArea(
            child: Padding(
                padding: AppScreenUtils.appMainPadding,
                child: Column(children: [
                  //! SPACER
                  AppScreenUtils.verticalSpaceLarge,

                  Text("Log in to your Companion Account",
                      style: Theme.of(context).textTheme.displaySmall),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! MATRIC NUMBER
                  const CustomTextField(
                      hintText: "Matric Number or Email", maxLines: 1),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

                  //! PASSWORD
                  ValueListenableBuilder(
                      valueListenable: isPasswordVisible,
                      builder: (context, value, child) => CustomTextField(
                          hintText: "Password",
                          maxLines: 1,
                          obscureText: isPasswordVisible.value,
                          suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 18.0.w),
                              child: IconButton(
                                  onPressed: () => isPasswordVisible.value =
                                      !isPasswordVisible.value,
                                  icon: isPasswordVisible.value
                                      ? const Icon(Icons.visibility_outlined)
                                      : const Icon(
                                          Icons.visibility_off_outlined))))),

                  //! FORGOT PASSWORD
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot password?",
                              style: CompanionAppTheme.textButtonStyle
                                  .copyWith(fontSize: 11.0.sp)))),

                  const Spacer(),

                  //! SPACER
                  AppScreenUtils.verticalSpaceMedium,

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

                  ButtonComponent(
                      onPressed: () => AppNavigator.navigateToPage(
                          thePageRouteName: AppRoutes.homeScreenWrapper,
                          context: context),
                      text: "Login"),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall,

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //! NOTICE
                    Text("Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium),

                    //! LOGIN
                    TextButton(
                        onPressed: () => AppNavigator.navigateToReplacementPage(
                            thePageRouteName: AppRoutes.register,
                            context: context),
                        child: Text("Sign up",
                            style: CompanionAppTheme.textButtonStyle
                                .copyWith(fontSize: 12.0.sp)))
                  ]),

                  //! SPACER
                  AppScreenUtils.verticalSpaceSmall
                ]))));
  }
}
