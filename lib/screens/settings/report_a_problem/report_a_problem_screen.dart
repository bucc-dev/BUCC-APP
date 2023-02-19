import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/screens/widgets/successful_response.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportAProblemScreen extends StatefulWidget {
  const ReportAProblemScreen({super.key});

  @override
  State<ReportAProblemScreen> createState() => _ReportAProblemScreenState();
}

class _ReportAProblemScreenState extends State<ReportAProblemScreen> {
  bool _isResponseSent = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: 1.0.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54, size: 16.0.sp),
          title: Text("Report",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600))),

      //! BODY
      body: _isResponseSent
          ?
          //! REPORT HAS BEEN SENT
          const SuccessfulResponse(theMessage: "Report sent successfully")
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
                    Text("We're here to help",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 14.0.sp)),

                    //! SPACER
                    AppScreenUtils.verticalSpaceMedium,

                    //! REPORT TEXT FIELD
                    const SizedBox(
                        width: double.infinity,
                        child: CustomTextField(
                            maxLines: 10, hintText: "Tell us the issue")),

                    //! SPACER
                    AppScreenUtils.verticalSpaceSmall,

                    SizedBox(
                        width: double.infinity,
                        child: ButtonComponent(
                            onPressed: () => setState(
                                () => _isResponseSent = !_isResponseSent),
                            text: "Send report")),

                    //! SPACER
                    AppScreenUtils.verticalSpaceSmall,

                    //! NOTICE
                    Text("We would send a response via your student’s email ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12.0.sp, color: const Color(0xFF878787)))
                  ])));
}
