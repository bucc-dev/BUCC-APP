// ignore_for_file: library_private_types_in_public_api, invalid_use_of_protected_member
import 'package:bucc_app/screens/planner/widgets/no_events.dart';
import 'package:bucc_app/services/model/event/event_model.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_fade_animation.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

ValueNotifier<List<EventModel>> listOfEvents = ValueNotifier([]);

class PlannerScreen extends ConsumerStatefulWidget {
  const PlannerScreen({super.key});

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends ConsumerState<PlannerScreen> {
  //! List of items in our dropdown menu
  var items = ["Urgent", "Medium", "Low", "Priority status"];

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: listOfEvents,
      builder: (context, value, child) => listOfEvents.value.isEmpty
          ? const NoEvents()
          : SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 12.0.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                  children: listOfEvents.value
                      .map((event) => AppFadeAnimation(
                            delay: listOfEvents.value.indexOf(event) == 0
                                ? 1.05
                                : listOfEvents.value.indexOf(event) == 1
                                    ? 1.15
                                    : 1.25,
                            child: Column(children: [
                              Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.3,
                                      children: [
                                        //! DELETE / REMOVE RECIPIENT FROM FAVOURITES LIST
                                        SlidableAction(
                                            flex: 1,
                                            onPressed: (value) async => {
                                                  listOfEvents.value
                                                      .remove(event),
                                                  // ignore: invalid_use_of_visible_for_testing_member
                                                  listOfEvents.notifyListeners()
                                                },
                                            backgroundColor: AppThemeColours.red
                                                .withOpacity(0.1),
                                            foregroundColor:
                                                AppThemeColours.red,
                                            icon: Icons.delete_outline)
                                      ]),

                                  //! EVENT BEING SHOWN
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 12.0.w),
                                    child: Row(children: [
                                      //! PRIORITY BAR
                                      Container(
                                          width: 5.0.w,
                                          height: 42.0.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0.r),
                                              color: AppFunctionalUtils
                                                  .getPriorityColour(
                                                      priorityIndex:
                                                          items.indexOf(event
                                                              .priority!)))),

                                      //! SPACER
                                      AppScreenUtils.horizontalSpaceMedium,

                                      //! TITLE AND DESCRIPTION
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //! TITLE
                                            Text(
                                                event.title ??
                                                    "Event title yet to be given",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 14.0.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppThemeColours
                                                            .fourthGrey)),

                                            //! SPACER
                                            AppScreenUtils.verticalSpaceSmall,

                                            //! DESCRIPTION
                                            Text(
                                                event.description ??
                                                    "Event description yet to be given",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 12.0.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppThemeColours
                                                            .fourthGrey)),
                                          ]),

                                      //! SPACER
                                      const Spacer(),

                                      //! TIME OF EVENT
                                      SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Text(
                                              TimeOfDay.fromDateTime(
                                                      DateTime.parse(
                                                          event.time!))
                                                  .format(context)
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontSize: 12.0.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppThemeColours
                                                          .lightGrey)))
                                    ]),
                                  )),

                              //! SPACER
                              AppScreenUtils.verticalSpaceSmall,

                              //! DIVIDER
                              const Divider(),

                              //! SPACER
                              AppScreenUtils.verticalSpaceSmall
                            ]),
                          ))
                      .toList())));
}
