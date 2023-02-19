import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventExpandableCard extends StatelessWidget {
  final String title;
  final String description;
  final int index;
  const EventExpandableCard(
      {super.key,
      required this.title,
      required this.description,
      required this.index});

  @override
  Widget build(BuildContext context) => ExpandableNotifier(
      child: ScrollOnExpand(
          scrollOnExpand: false,
          scrollOnCollapse: false,
          child: ExpandablePanel(
              theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: false,
                  crossFadePoint: 0.5,
                  tapBodyToCollapse: true),

              //! EXPANDABLE SHEET HEADER
              header: Container(
                  height: 150.h,
                  margin: EdgeInsets.only(bottom: 18.0.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: lightGrey, width: 1.3.sp),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  padding: AppScreenUtils.appMainPadding,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //! TITLE, PRIORITY && TIME
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //! TITLE
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 16.0.sp,
                                                fontWeight: FontWeight.w500)),

                                    //! SPACER
                                    AppScreenUtils.verticalSpaceSmall,

                                    //! TIME
                                    Text("10:00 AM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)
                                  ]),

                              //! PRIORITY
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.0.h, horizontal: 0.0.w),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Aug 10 2022",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),

                                        //! SPACER
                                        AppScreenUtils.horizontalSpaceSmall,

                                        Icon(Icons.flag,
                                            color: index == 2
                                                ? const Color(
                                                    0xFFFF0000) //! RED HOT CHILLI PEPPERS
                                                : index.isEven
                                                    ? const Color(
                                                        0xFF72C8CC) //! MEDIUM PRIORITY
                                                    : const Color(0xFFF3C110))
                                      ]))
                            ]),

                        //! SPACER
                        AppScreenUtils.verticalSpaceSmall,

                        //! DESCRIPTION
                        Text("${description.substring(0, 120)}...")
                      ])),

              //! TEXT TO SHOW WHEN COLLAPSED
              collapsed: const SizedBox.shrink(),

              //! CHILD TO SHOW WHEN EXPANDED
              expanded: Container(
                  padding: AppScreenUtils.appMainPadding,
                  margin: EdgeInsets.only(bottom: 18.0.h),
                  child: Text(description)))));
}
