// ignore_for_file: library_private_types_in_public_api
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/screens/home/events/events.dart';
import 'package:bucc_app/screens/home/latest_activity/latest_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //! TABS
      TabBar(
          controller: _tabController,
          indicatorColor: AppThemeColours.primaryColour,
          indicatorWeight: 2.0.h,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black54
              : Colors.white.withOpacity(0.5),
          labelColor: Theme.of(context).brightness == Brightness.light
              ? AppThemeColours.headerColour
              : Colors.white,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
          physics: const BouncingScrollPhysics(),
          tabs: const [
            Padding(
                padding: EdgeInsets.all(16.0), child: Text("Latest Activity")),
            Padding(padding: EdgeInsets.all(16.0), child: Text("Events"))
          ]),

      //! TAB BAR VIEW
      Expanded(
          child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
            //! LATEST ACTIVITY
            LatestActivityScreen(),

            //! EVENTS
            EventsScreen()
          ]))
    ]);
  }
}
