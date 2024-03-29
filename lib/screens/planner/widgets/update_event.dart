// ignore_for_file: invalid_use_of_protected_member

import 'package:bucc_app/screens/planner/planner.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/services/model/event/event_model.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpdateEvent extends StatefulWidget {
  final EventModel theEvent;
  const UpdateEvent({super.key, required this.theEvent});

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  //! TEXT FORM FIELD CONTROLLERS
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  //! Initial Selected Value
  ValueNotifier<String> dropDownValue = ValueNotifier("No Priority");

  //! List of items in our dropdown menu
  var items = ["Urgent", "Medium", "Low", "No Priority"];

  ValueNotifier<DateTimeRange> dateRange = ValueNotifier(
      DateTimeRange(start: DateTime(2022, 9), end: DateTime(2100)));

  ValueNotifier<bool> hasValuesBeenInitialized = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  @override
  Widget build(BuildContext context) {
    //! HEADER TEXT STYLE
    TextStyle titleStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 14.0.sp, color: const Color(0xff878787));

    "Update Event Build".log();

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.5.h,
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w600)),

            //! ACTIONS
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppThemeColours.red,
                          fontWeight: FontWeight.w500)))
            ]),

        //! BODY
        body: SingleChildScrollView(
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
              CustomTextField(
                  maxLines: 1, controller: _titleController, hintText: "Title"),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! DESCRIPTION
              Text("Event description", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              CustomTextField(
                  hintText: "Description",
                  controller: _descriptionController,
                  maxLines: 6),

              //! SPACER
              AppScreenUtils.verticalSpaceMedium,

              //! PRIORITY
              Text("Priority", style: titleStyle),

              //! SPACER
              AppScreenUtils.verticalSpaceSmall,

              //! PRIORITY
              Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0.w),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: ValueListenableBuilder(
                    valueListenable: dropDownValue,
                    builder: (context, value, child) => DropdownButton(
                        alignment: Alignment.center,
                        elevation: 1,
                        value: dropDownValue.value,
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
                                      color:
                                          AppFunctionalUtils.getPriorityColour(
                                              priorityIndex:
                                                  items.indexOf(item))),

                                  //! SPACER
                                  AppScreenUtils.horizontalSpaceSmall,

                                  //! ITEM
                                  Text(item,
                                      style: titleStyle.copyWith(
                                          fontSize: 12.0.sp))
                                ])))
                            .toList(),

                        //! CHANGE BUTTON VALUE
                        onChanged: (newValue) =>
                            dropDownValue.value = newValue.toString()),
                  )),

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
                            ValueListenableBuilder(
                                valueListenable: hasValuesBeenInitialized,
                                builder: (context, value, child) => Text(
                                    hasValuesBeenInitialized.value
                                        ? "${DateFormat("dd-MM-yyy").format(dateRange.value.start)}   -  ${DateFormat("dd-MM-yyy").format(dateRange.value.end)}  "
                                        : "Select date",
                                    textAlign: TextAlign.center,
                                    style: titleStyle.copyWith(
                                        fontSize: hasValuesBeenInitialized.value
                                            ? 14.0.sp
                                            : 12.0.sp))),

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
                        listOfEvents.value.remove(widget.theEvent);

                        listOfEvents.value.add(EventModel(
                            postID: "",
                            title: _titleController.value.text.trim(),
                            description:
                                _descriptionController.value.text.trim(),
                            priority: dropDownValue.value,
                            startDate: dateRange.value.start.toString(),
                            endDate: dateRange.value.end.toString(),
                            time: widget.theEvent.time));

                        // ignore: invalid_use_of_visible_for_testing_member
                        listOfEvents.notifyListeners();

                        Navigator.of(context).pop();
                      },
                      text: "Save Event"))
            ])));
  }

  //! GET DATE RANGE
  Future<void> getDateRange({required BuildContext context}) async {
    hasValuesBeenInitialized.value = false;

    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange.value,
        firstDate: DateTime(2022, 9),
        lastDate: DateTime(2100),
        cancelText: "",
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                appBarTheme: Theme.of(context).appBarTheme.copyWith(
                    backgroundColor: purple,
                    centerTitle: true,
                    titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                    iconTheme:
                        IconThemeData(color: Colors.white, size: 18.0.sp)),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 12.0.sp, color: Colors.black))),
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.indigo)),
            child: child!));

    if (newDateRange == null) return;

    dateRange.value = newDateRange;
    hasValuesBeenInitialized.value = true;
  }

  //! INITIALIZE VALUES
  void initializeValues() {
    //! CONTROLLERS
    _titleController.value =
        TextEditingValue(text: widget.theEvent.title ?? "");
    _descriptionController.value =
        TextEditingValue(text: widget.theEvent.description ?? "");

    //! PRIORITY
    dropDownValue.value = widget.theEvent.priority ?? "No Priority";

    //! HANDLE DATE RANGE
    dateRange.value =
        (widget.theEvent.startDate != null && widget.theEvent.endDate != null)
            ? DateTimeRange(
                start: DateTime.parse(widget.theEvent.startDate!),
                end: DateTime.parse(widget.theEvent.endDate!))
            : DateTimeRange(start: DateTime.now(), end: DateTime(2100));

    hasValuesBeenInitialized.value = true;
  }
}
