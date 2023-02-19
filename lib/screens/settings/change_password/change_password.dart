import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/screens/widgets/successful_response.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isResponseSent = false;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //! BOOLEANS
  bool oldControllerHasValue = false;
  bool newControllerHasValue = false;
  bool confirmNewControllerHasValue = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: 1.0.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54, size: 16.0.sp),
          title: Text("Password",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600))),

      //! BODY
      body: _isResponseSent
          ?
          //! REPORT HAS BEEN SENT
          const SuccessfulResponse(theMessage: "Password changed successfully")
          :
          //! REPORT HAS NOT BEEN SENT
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: AppScreenUtils.appMainPadding,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium,

                    //! NOTICE
                    Text("Change your  Companion password",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14.0.sp)),

                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium,

                    //! ENTER OLD PASSWORD
                    SizedBox(
                        width: double.infinity,
                        child: CustomTextField(
                            controller: _oldPasswordController,
                            onChanged: () => setState(() =>
                                oldControllerHasValue = _oldPasswordController
                                    .value.text.isNotEmpty),
                            hintText: "Enter old password")),

                    //! SPACER
                    AppScreenUtils.verticalSpaceSmall,

                    //! ENTER NEW PASSWORD
                    SizedBox(
                        width: double.infinity,
                        child: CustomTextField(
                            controller: _newPasswordController,
                            hintText: "Enter new password")),

                    //! SPACER
                    AppScreenUtils.verticalSpaceSmall,

                    //! REPORT TEXT FIELD
                    SizedBox(
                        width: double.infinity,
                        child: CustomTextField(
                            controller: _confirmPasswordController,
                            hintText: "Confirm new password")),

                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium,

                    SizedBox(
                        width: double.infinity,
                        child: ButtonComponent(
                            onPressed: () => setState(
                                () => _isResponseSent = !_isResponseSent),
                            text: "Save password"))
                  ])));
}
