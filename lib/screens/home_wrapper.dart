import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/screens/notifications/notifications.dart';
import 'package:bucc_app/screens/planner/planner.dart';
import 'package:bucc_app/screens/settings/settings.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/app_bars/home_wrapper_app_bar.dart';
import 'package:bucc_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper>
    with TickerProviderStateMixin {
  static int currentPageIndex = 0;
  //! SCAFFOLD KEY
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  //! PAGES
  static const List<Widget> _pages = [
    //! Home
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
        appBar: HomeWrapperAppBar(screenIndex: currentPageIndex),

        //! BODY
        body: SafeArea(
            child: Column(children: [
          //! PAGE
          Expanded(child: _pages.elementAt(currentPageIndex)),

          //! TAB NOTIFIER
          TabBar(
              controller: _tabController,
              indicatorColor: purple,
              indicatorWeight: 3.0.h,
              indicatorSize: TabBarIndicatorSize.tab,
              physics: const BouncingScrollPhysics(),
              tabs: _pages.map((page) => const SizedBox.shrink()).toList())
        ])),

        //! FLOATING ACTION BUTTON
        floatingActionButton: (currentPageIndex == 2)
            ? FloatingActionButton(
                onPressed: () => AppNavigator.navigateToPage(
                    thePageRouteName: AppRoutes.addEvent, context: context),
                backgroundColor: purple,
                child: Icon(Icons.add, size: 21.0.sp))
            : null,

        //! BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              //! CHANGE CURRENT INDEX FOR BOTTOM NAV BAR
              setState(() => currentPageIndex = value);

              //! MOVE TAB BAR INDICATOR
              _tabController.animateTo(currentPageIndex);
            },
            currentIndex: currentPageIndex,

            //! ITEMS
            items: const [
              //! HomeWrapper
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),

              //! NOTIFICATIONS
              BottomNavigationBarItem(
                  label: "Notifications",
                  icon: Icon(Icons.notifications_none_outlined)),

              //! HomeWrapper
              BottomNavigationBarItem(
                  label: "Planner", icon: Icon(Icons.event_available_outlined)),

              //! HomeWrapper
              BottomNavigationBarItem(
                  label: "Settings", icon: Icon(Icons.settings_outlined))
            ]));
  }
}
