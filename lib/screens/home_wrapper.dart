// ignore_for_file: library_private_types_in_public_api
import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/notifications/notifications.dart';
import 'package:bucc_app/screens/planner/planner.dart';
import 'package:bucc_app/screens/settings/settings.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/app_bars/home_wrapper_app_bar.dart';
import 'package:bucc_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWrapper extends ConsumerStatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends ConsumerState<HomeWrapper>
    with TickerProviderStateMixin {
  //! SCAFFOLD KEY
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  //! TAB CONTROLLER
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  //! PAGE INDEX
  final ValueNotifier<int> currentPageIndex = ValueNotifier(0);

  //! PAGES
  static const List<Widget> _pages = [
    //! HOME
    Home(),

    //! NOTIFICATIONS
    NotificationsScreen(),

    //! NOTIFICATIONS
    PlannerScreen(),

    //! NOTIFICATIONS
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(currentPageIndex.value == 3 ? 55 : 65),
            child: ValueListenableBuilder(
                valueListenable: currentPageIndex,
                builder: (context, value, child) =>
                    HomeWrapperAppBar(screenIndex: currentPageIndex.value))),

        //! BODY
        body: SafeArea(
            child: Column(children: [
          //! PAGE
          ValueListenableBuilder(
              valueListenable: currentPageIndex,
              builder: (context, value, child) =>
                  Expanded(child: _pages.elementAt(currentPageIndex.value))),

          //! TAB NOTIFIER
          IgnorePointer(
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: purple,
                  indicatorWeight: 2.0.h,
                  indicatorSize: TabBarIndicatorSize.tab,
                  physics: const NeverScrollableScrollPhysics(),
                  tabs: _pages.map((page) => const SizedBox.shrink()).toList()))
        ])),

        //! FLOATING ACTION BUTTON
        floatingActionButton: ValueListenableBuilder(
            valueListenable: currentPageIndex,
            builder: (context, value, child) => currentPageIndex.value == 2
                ? FloatingActionButton(
                    onPressed: () => AppNavigator.navigateToPage(
                        thePageRouteName: AppRoutes.addEvent, context: context),
                    backgroundColor: purple,
                    child: Icon(Icons.add, size: 21.0.sp))
                : const SizedBox.shrink()),

        //! BOTTOM NAVIGATION BAR
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: currentPageIndex,
            builder: (context, value, child) => BottomNavigationBar(
                    onTap: (value) {
                      //! CHANGE CURRENT INDEX FOR BOTTOM NAV BAR
                      currentPageIndex.value = value;

                      //! MOVE TAB BAR INDICATOR
                      _tabController.animateTo(currentPageIndex.value);
                    },
                    currentIndex: currentPageIndex.value,

                    //! ITEMS
                    items: const [
                      //! HomeWrapper
                      BottomNavigationBarItem(
                          label: "Home", icon: Icon(Icons.home)),

                      //! NOTIFICATIONS
                      BottomNavigationBarItem(
                          label: "Notifications",
                          icon: Icon(Icons.notifications_none_outlined)),

                      //! HomeWrapper
                      BottomNavigationBarItem(
                          label: "Planner",
                          icon: Icon(Icons.event_available_outlined)),

                      //! HomeWrapper
                      BottomNavigationBarItem(
                          label: "Settings",
                          icon: Icon(Icons.settings_outlined))
                    ])));
  }
}
