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
  final ValueNotifier<bool> _isResponseSent = ValueNotifier(false);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: 1.0.h,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(size: 21.0.sp),
          title: Text("Report",
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0.sp)),

                      //! SPACER
                      AppScreenUtils.verticalSpaceMedium,

                      //! REPORT TEXT FIELD
                      SizedBox(
                          width: double.infinity,
                          child: CustomTextField(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 24.0.h, horizontal: 32.0.w),
                              maxLines: 10,
                              hintText: "Tell us the issue")),

                      //! SPACER
                      AppScreenUtils.verticalSpaceMedium,

                      SizedBox(
                          width: double.infinity,
                          child: ButtonComponent(
                              onPressed: () => _isResponseSent.value =
                                  !_isResponseSent.value,
                              text: "Send report")),

                      //! SPACER
                      AppScreenUtils.verticalSpaceMedium,

                      //! NOTICE
                      Center(
                          child: Text(
                              "We would send a response via your student’s email ",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 12.0.sp,
                                      color: const Color(0xFF878787))))
                    ])),
      ));
}
