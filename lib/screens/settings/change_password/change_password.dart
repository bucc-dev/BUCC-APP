// ignore_for_file: library_private_types_in_public_api
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/screens/widgets/successful_response.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final ValueNotifier<bool> _isResponseSent = ValueNotifier(false);
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //! BOOLEANS
  final ValueNotifier<bool> oldControllerHasValue = ValueNotifier(false);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(size: 21.0.sp),
          title: Text("Password",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600))),

      //! BODY
      body: ValueListenableBuilder(
          valueListenable: _isResponseSent,
          builder: (context, value, child) => _isResponseSent.value
              ?
              //! REPORT HAS BEEN SENT
              const SuccessfulResponse(
                  theMessage: "Password changed successfully")
              :
              //! REPORT HAS NOT BEEN SENT
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: AppScreenUtils.appMainPadding,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //! SPACER
                          AppScreenUtils.verticalSpaceMedium,

                          //! NOTICE
                          Text("Change your  Companion password",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0.sp)),

                          //! SPACER
                          AppScreenUtils.verticalSpaceMedium,

                          //! ENTER OLD PASSWORD
                          SizedBox(
                              width: double.infinity,
                              child: CustomTextField(
                                  isHomeScreen: true,
                                  controller: _oldPasswordController,
                                  maxLines: 1,
                                  onChanged: () => oldControllerHasValue.value =
                                      _oldPasswordController
                                          .value.text.isNotEmpty,
                                  validator: () {
                                    if (_oldPasswordController
                                            .value.text.length <
                                        8) {
                                      return "Passwords should not be less than 8";
                                    } else {
                                      return null;
                                    }
                                  },
                                  hintText: "Enter old password")),

                          //! SPACER
                          AppScreenUtils.verticalSpaceMedium,

                          //! ENTER NEW PASSWORD
                          SizedBox(
                              width: double.infinity,
                              child: CustomTextField(
                                  isHomeScreen: true,
                                  maxLines: 1,
                                  controller: _newPasswordController,
                                  validator: () {
                                    if (_oldPasswordController.value.text
                                            .compareTo(_newPasswordController
                                                .value.text) ==
                                        0) {
                                      return "Old Password and New Password cannot be the same";
                                    } else if (_newPasswordController.value.text
                                            .compareTo(
                                                _confirmPasswordController
                                                    .value.text) !=
                                        0) {
                                      return "New Password and Confirm New Password must be the same";
                                    } else if (_newPasswordController
                                            .value.text.length <
                                        8) {
                                      return "Passwords should not be less than 8";
                                    } else {
                                      return null;
                                    }
                                  },
                                  hintText: "Enter new password")),

                          //! SPACER
                          AppScreenUtils.verticalSpaceMedium,

                          //! CONFIRM NEW PASSWORD
                          SizedBox(
                              width: double.infinity,
                              child: CustomTextField(
                                  isHomeScreen: true,
                                  maxLines: 1,
                                  controller: _confirmPasswordController,
                                  validator: () {
                                    if (_newPasswordController.value.text
                                            .compareTo(
                                                _confirmPasswordController
                                                    .value.text) !=
                                        0) {
                                      return "New Password and Confirm New Password must be the same";
                                    } else if (_newPasswordController
                                            .value.text.length <
                                        8) {
                                      return "Passwords should not be less than 8";
                                    } else {
                                      return null;
                                    }
                                  },
                                  hintText: "Confirm new password")),

                          //! SPACER
                          AppScreenUtils.verticalSpaceMedium,

                          SizedBox(
                              width: double.infinity,
                              child: ValueListenableBuilder(
                                  valueListenable: oldControllerHasValue,
                                  builder: (context, value, child) =>
                                      ButtonComponent(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _isResponseSent.value =
                                                  !_isResponseSent.value;
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  (oldControllerHasValue.value)
                                                      ? AppThemeColours
                                                          .lightBlue
                                                      : AppThemeColours
                                                          .lightGrey),
                                          text: "Save password")))
                        ]),
                  ))));
}
