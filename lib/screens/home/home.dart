import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/screens/home/events/events.dart';
import 'package:bucc_app/screens/home/latest_activity/latest_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Column(children: [
        //! TABS
        TabBar(
            controller: _tabController,
            indicatorColor: AppThemeColours.primaryColour,
            indicatorWeight: 3.0.h,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor:
                Theme.of(context).brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white.withOpacity(0.5),
            labelColor: Theme.of(context).brightness == Brightness.light
                ? AppThemeColours.headerColour
                : Colors.white,
            physics: const BouncingScrollPhysics(),
            tabs: const [
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Latest Activity")),
              Padding(padding: EdgeInsets.all(16.0), child: Text("Events"))
            ]),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! TAB BAR VIEW
        Expanded(
            child: TabBarView(controller: _tabController, children: const [
          //! LATEST ACTIVITY
          LatestActivityScreen(),

          //! EVENTS
          EventsScreen()
        ]))
      ]);
}
