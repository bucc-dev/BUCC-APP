///This is the feed or view for the home screen
///It returns a Scaffold, whose app bar is passed through a custom app bar ...
///... named TitleBarWidget.
///Body is a default tab controller, housing the LatestActivity() widget
///and the Events() widget.

import 'package:bucc_app/view/custom_widgets/custom_app_bar.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:bucc_app/view/events.dart';
import 'package:bucc_app/view/latest_activity.dart';
import 'package:flutter/material.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.11),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: TitleBarWidget(
            pageTitle: "home",
          ),
        ),
      ),
      //!THE TABS
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              toolbarHeight: _screenSize.height * 0.01,
              bottom: const TabBar(
                indicatorColor: Color(0xFF556FCB),
                tabs: <Widget>[
                  Tab(
                    child: CustomTextWidget(
                        textType: "subtitle", text: "Latest activity"),
                  ),
                  Tab(
                    child:
                        CustomTextWidget(textType: "subtitle", text: "Events"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  //!LATEST ACTIVITY VIEW
                  const LatestActivity(),

                  //!EVENTS VIEW
                  Events(),
                ])),
      ),
    );
  }
}
