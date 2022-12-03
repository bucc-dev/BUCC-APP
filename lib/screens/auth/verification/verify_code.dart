import 'dart:developer';

import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_app_bar.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //! PIN INPUT FIELD THEME
    final PinTheme defaultPinTheme = PinTheme(
        width: 56.0.w,
        height: 56.0.h,
        textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600, fontSize: 21.0.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppThemeColours.lightGrey.withOpacity(0.5)
                    : Colors.white)));

    return Scaffold(
        appBar: const CustomAppBar(),

        //! BODY
        body: SafeArea(
            child: Padding(
                padding: AppScreenUtils.appMainPadding,
                child: Form(
                    key: formKey,
                    child: Column(children: [
                      //! SPACER
                      AppScreenUtils.verticalSpaceLarge,

                      //! NOTICE
                      Center(
                          child: Text("Enter the verification code",
                              style: Theme.of(context).textTheme.headline3)),

                      //! SPACER
                      AppScreenUtils.verticalSpaceLarge,

                      //! INPUT FIELD
                      Directionality(
                          textDirection:
                              TextDirection.ltr, //! SPECIFY DESIRED DIRECTION

                          //! MAIN PIN PAD
                          child: Pinput(
                              controller: pinController,
                              focusNode: focusNode,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: defaultPinTheme,

                              //! VALIDATOR
                              validator: (value) => "",

                              //! WHEN DATA IS SEEN IN CLIP BOARD
                              onClipboardFound: (value) {
                                log('onClipboardFound: $value');
                                pinController.setText(value);
                              },

                              //! ADD HAPTIC FEED / LITTLE VIBRATIONS
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,

                              //! WHEN COMPLETED
                              onCompleted: (pin) {
                                log('onCompleted: $pin');
                              },

                              //! IF VALUE IS CHANGED
                              onChanged: (value) {
                                log('onChanged: $value');
                              },

                              //! CURSOR STYLING
                              cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(bottom: 8.0.h),
                                        width: 21.0.w,
                                        height: 1.0..h,
                                        color: AppThemeColours.primaryColour)
                                  ]),

                              //! THEME FOR WHEN PIN PAD IS IN FOCUS
                              focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration: defaultPinTheme.decoration!.copyWith(
                                      border: Border.all(
                                          color:
                                              AppThemeColours.primaryColour))),

                              //! THEME FOR WHEN PIN PAD INPUT HAS BEEN SUBMITTED
                              submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration: defaultPinTheme.decoration!
                                      .copyWith(
                                          color: AppThemeColours
                                              .primaryColourWitOpacity,
                                          border: Border.all(
                                              color: AppThemeColours
                                                  .accentColour))),

                              //! ERROR THEME
                              errorTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: AppThemeColours.red),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(
                                      width: 1..sp,
                                      color: AppThemeColours.red)))),

                      //! SPACER
                      const Spacer(),

                      //! TEXT BUTTON
                      TextButton(
                          onPressed: () {},
                          child: Text("Resend code",
                              style: CompanionAppTheme.textButtonStyle.copyWith(
                                  fontSize: 11.0.sp,
                                  shadows: [
                                    const Shadow(
                                        color: Color(0xFF5F6DEF),
                                        offset: Offset(0, -5))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF5F6DEF),
                                  decorationThickness: 1.5.sp,
                                  decorationStyle: TextDecorationStyle.solid))),

                      //! BUTTON
                      ButtonComponent(
                          onPressed: () => AppNavigator
                              .navigateToAndRemoveAllPreviousScreens(
                                  thePageRouteName: AppRoutes.homeScreenWrapper,
                                  context: context),
                          text: "Next"),

                      //! SPACER
                      AppScreenUtils.verticalSpaceSmall
                    ])))));
  }
}
