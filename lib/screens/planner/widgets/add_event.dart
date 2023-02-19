import 'dart:developer';

import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  // Initial Selected Value
  String dropDownValue = "Priority status";

  // List of items in our dropdown menu
  var items = ["Urgent", "Medium", "Low", "Priority status"];

  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 9), end: DateTime(2100));

  bool hasDateBeenSelected = false;

  @override
  Widget build(BuildContext context) {
    //! HEADER TEXT STYLE
    TextStyle titleStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontSize: 14.0.sp, color: const Color(0xff878787));

    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 4.0,
            leading: //! PROFILE IMAGE
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: white,
                            image: DecorationImage(
                                image: AssetImage(defaultUserImage2))))),

            //! TITLE
            title: Text("Planner",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w600)),

            //! ACTIONS
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppThemeColours.red,
                          fontWeight: FontWeight.w500)))
            ]),

        //! BODY
        body: Padding(
            padding: AppScreenUtils.appMainPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              //! TITLE
              Text("Event title", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              //! TITLE
              const CustomTextField(hintText: "Title"),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! DESCRIPTION
              Text("Event description", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              const CustomTextField(hintText: "Description", maxLines: 6),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! PRIORITY
              Text("Priority", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: DropdownButton(
                      alignment: Alignment.center,
                      elevation: 1,
                      value: dropDownValue,
                      underline: const SizedBox.shrink(),

                      //! ICON
                      iconSize: 18.0.sp,
                      icon: const SizedBox.shrink(),

                      //! ITEMS
                      items: items
                          .map((String item) => DropdownMenuItem(
                              value: item,
                              child: Row(children: [
                                Icon(Icons.flag,
                                    size: 21.0.sp,
                                    color: items.indexOf(item) == 0
                                        ? AppThemeColours.red
                                        : items.indexOf(item) == 1
                                            ? Colors.amber.shade700
                                            : items.indexOf(item) == 2
                                                ? Colors.teal.shade300
                                                : Colors.grey.shade600),

                                //! SPACER
                                AppScreenUtils.horizontalSpaceSmall,

                                //! ITEM
                                Text(item,
                                    style:
                                        titleStyle.copyWith(fontSize: 12.0.sp))
                              ])))
                          .toList(),

                      //! CHANGE BUTTON VALUE
                      onChanged: (String? newValue) =>
                          setState(() => dropDownValue = newValue!))),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! START DATE
              Text("Start date", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              //! DATE PICKER
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0.h, horizontal: 18.0.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade200, width: 1.3.sp),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () => getDateRange(context: context),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //! TITLE
                            Text(
                                hasDateBeenSelected
                                    ? "Start: ${DateFormat("dd-MM-yyy").format(start)}   -  End: ${DateFormat("dd-MM-yyy").format(end)}  "
                                    : "Select date",
                                textAlign: TextAlign.center,
                                style: titleStyle.copyWith(
                                    fontSize: hasDateBeenSelected
                                        ? 14.0.sp
                                        : 12.0.sp)),

                            //! ICON
                            Icon(Icons.calendar_month_outlined,
                                size: 18.0.sp, color: Colors.black54)
                          ]))),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! BUTTON
              SizedBox(
                  width: double.infinity,
                  child: ButtonComponent(
                      onPressed: () {
                        log("Priority: $dropDownValue, Date: $difference");

                        Navigator.of(context).pop();
                      },
                      text: "Save Event"))
            ])));
  }

  Future<void> getDateRange({required BuildContext context}) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2022, 9),
        lastDate: DateTime(2100),
        cancelText: "",
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                appBarTheme: Theme.of(context).appBarTheme.copyWith(
                    backgroundColor: purple,
                    centerTitle: true,
                    titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                    iconTheme:
                        IconThemeData(color: Colors.white, size: 18.0.sp)),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 12.0.sp, color: Colors.black))),
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.indigo)),
            child: child!));

    if (newDateRange == null) return;

    setState(() => {dateRange = newDateRange, hasDateBeenSelected = true});
  }
}
